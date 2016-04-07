/**
 * React Starter Kit (https://www.reactstarterkit.com/)
 *
 * Copyright © 2014-2016 Kriasoft, LLC. All rights reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE.txt file in the root directory of this source tree.
 */

import React, { PropTypes } from 'react';

function Video() {
  return (
    <div>
      <iframe src="https://player.vimeo.com/video/161365217?autoplay=true" width="500" height="281" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen>
      </iframe>
    </div>
  );
}

export default Video;
