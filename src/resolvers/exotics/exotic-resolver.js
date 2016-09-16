/* @flow */

import BaseResolver from '../base-resolver.js';

const _ = require('lodash');

export default class ExoticResolver extends BaseResolver {
  static protocol: string;

  static isVersion(pattern: string): boolean {
    const proto = this.protocol;
    if (proto) {
      return _.startsWith(pattern, `${proto}:`);
    } else {
      throw new Error('No protocol specified');
    }
  }
}
