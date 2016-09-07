# react-native-installed-apps

[![npm version](https://badge.fury.io/js/react-native-installed-apps.png)](http://badge.fury.io/js/react-native-installed-apps)

[React Native](https://github.com/facebook/react-native) module which provides list of installed IOS applications.


## Install

```shell
npm install --save react-native-installed-apps
```

## Linking

```shell
react-native link react-native-installed-apps
```

## Usage

```js
import AppList from 'react-native-installed-apps';

AppList.getAll((apps) => {
  console.log(apps); // array of objects [{ app: 'AppName.app', appPath: '/path/of/the/app', info: plistInfoObject }]
});
```

MIT © [Dmitry Pavlovsky](http://paloskin.me)
