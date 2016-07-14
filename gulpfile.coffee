config = require './config'

path = require 'path'
_ = require 'lodash'
sequence = require 'run-sequence'
del = require 'del'

gulp = require 'gulp'
util = require 'gulp-util'
plugins = require 'gulp-load-plugins'
gulpif = require 'gulp-if'

bowerFiles = require 'main-bower-files'

{Server} = require 'karma'
{parseConfig} = require 'karma/lib/config'

# Local variables
env = process.env.NODE_ENV
karmaConfig = './karma.conf.coffee'
cachebust = if env isnt 'prod' then ".#{Date.now()}" else ""

paths =
  app: ['src/modules/**/*.coffee', '!src/modules/**/test/**']
  styles: ['src/modules/**/*.scss', 'src/modules/**/*.sass']
  templates: ['src/*.jade', 'src/modules/**/*.jade']
  assets: [
    'src/assets/**/*'
  ]
  test: './test/**/*.coffee'
  public: (path) ->
    if Array.isArray path
      return path.map (p)->
        "./public/#{p}"
    "./public/#{path}"

###*
 * karma runner process
 * @param  {string}   path    Path to karma config file
 * @param  {object}   options karma options
 * @param  {Function} next    Callback
 * @return
###
runKarma = (filePath, options, next) ->
  filePath = path.resolve filePath
  {log, colors} = util
  config = parseConfig filePath, {}

  _.merge config, options

  runner = new Server config, (exitCode) ->
    log "Karma has exited with #{colors.red(exitCode)}"
    next()
    process.exit exitCode

  runner.start()

gulp.task 'bower', ->
  plugins().bower()

  # gulp.src bowerFiles(debugging: true)
  #   .pipe plugins().concat "vendor#{cachebust}.js"
  #   .pipe gulp.dest paths.public('js')

gulp.task 'scorm', (done)->
  # gulp.src "./public/**/*"
  #   .pipe logFile(require('event-stream'))

  scormPackage = require('node-scorm-packager')

  scormPackage
    version: '1.2'
    organization: 'Hologic'
    title: 'Trident System Virtual On-Demand Training Program'
    identifier: '00'
    masteryScore: 80
    source: './public'
    destination: './scorm'
  , ->
    done()
  return

logFile = (es) ->
  es.map (file, cb) ->
    console.log file.path
    cb()

###*
 * CoffeeScript compilation and sourcemaps
 * @return
###
gulp.task 'coffee', ->
  sourcemaps = plugins().sourcemaps

  gulp.src paths.app
    # .pipe require('gulp-debug')()
    .pipe plugins().plumber()

    .pipe gulpif(env isnt 'prod', sourcemaps.init())
    .pipe plugins().coffee
      bare: true
    .pipe plugins().concat "bundle#{cachebust}.js"
    .pipe gulpif(env isnt 'prod', sourcemaps.write())
    .pipe gulp.dest paths.public('js')

gulp.task 'ng-env', ->
  gulp.src './config/index.coffee'
    .pipe plugins().plumber()
    .pipe plugins().ngConstant
      name: 'app-env'
      constants:
        title: config.title
      stream: true
    .pipe plugins().rename "env#{cachebust}.js"
    .pipe gulp.dest paths.public('js')

gulp.task 'sass', ->
  sourcemaps = plugins().sourcemaps
  gulp.src paths.styles
    .pipe plugins().plumber()
    .pipe gulpif(env isnt 'prod', sourcemaps.init())
    .pipe plugins().sass()
    .pipe plugins().concat("styles#{cachebust}.css")
    .pipe gulpif(env isnt 'prod', sourcemaps.write())
    .pipe gulp.dest paths.public('css')
  return

###*
 * Move asset files to public
 * @return
###
gulp.task 'assets', ->
  gulp
    .src paths.assets
    .pipe gulp.dest paths.public('assets')

###*
 * Compile jade templates
 * @return
###
gulp.task 'jade', ->
  return gulp
    .src paths.templates
    .pipe plugins().plumber()
    .pipe plugins().jade
      pretty: true
      locals:
        config: config
        env: env or 'local'
        cachebust: cachebust
    .pipe gulp.dest paths.public('/')
    .pipe plugins().htmlmin
      collapseWhitepace: true
    .pipe plugins().ngTemplates
      filename: "templates#{cachebust}.js"
      module: 'app.templates'
      path: (path, base) ->
        path.replace "#{base}/", ""
    .pipe gulp.dest paths.public('js')

###*
 * Clean up public directory
 * @return
###
gulp.task 'clean', ->
  del [
    './public/js/*'
    './public/css/*'
    './public/index.html'
  ]

###*
 * Watch all files to compile or reload the
 * test page
 * @return
###
gulp.task 'watch', ->
  livereload = plugins().livereload
  livereload.listen()

  gulp.watch './config/**/*.coffee', ['build']
  gulp.watch paths.styles, ['sass']
  gulp.watch paths.app, ['coffee']
  gulp.watch paths.templates, ['jade']

  gulp
    .watch paths.public(['**/*.css', '**/*.js', '**/*.html'])
    .on 'change', livereload.changed
  return

###*
 * Nodemon stuff
 * @return
###
gulp.task 'nodemon', ->
  plugins().nodemon
    script: 'index.coffee'
    nodeArgs: ['--debug']
    ext: 'js,css,html'
    watch: ['config/**/*.coffee']
    env:
      NODE_ENV: 'dev'
      port: config.port

###*
 * Build function
 * @param  {Function} done callback
 * @return
###
gulp.task 'build', (done) ->
  config = require './config'
  sequence 'clean', 'bower', ['sass', 'coffee', 'ng-env', 'jade', 'assets'], done

gulp.task 'test', (cb)->
  runKarma karmaConfig, {}, cb
  return

gulp.task 'default', (done) ->
  sequence 'build', ['nodemon', 'watch'], done
