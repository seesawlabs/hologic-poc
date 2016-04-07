/**
 * React Static Boilerplate
 * https://github.com/koistya/react-static-boilerplate
 * Copyright (c) Konstantin Tarkus (@koistya) | MIT license
 */

import React, { Component } from 'react';
import Video from '../components/video/Video';

export default class extends Component {

  render() {
    return (
      <div>
        <h1>Video Page</h1>
        <Video />
      </div>
    );
  }

}
