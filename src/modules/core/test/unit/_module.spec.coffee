describe 'angular', ->
  it 'should exist', ->
    expect(angular).toBeDefined()
    expect(angular).not.toBe(null)

  it 'should be at least v1.4', ->
    expect(versionCompare(angular.version.full, '1.4.0')).toBe(1)