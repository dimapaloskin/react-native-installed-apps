'use strict';
const AppList = require('react-native').NativeModules.InstalledAppList;

module.exports = {
  getAll: AppList.getAll
};
