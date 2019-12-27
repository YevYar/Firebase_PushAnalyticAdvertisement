// @flow
import {AsyncStorage} from 'react-native';
import firebase from 'react-native-firebase';

export default async message => {
  // handle your message
  // console.warn(`score: ${message._data.score}`);
  await AsyncStorage.setItem('lastScore', '0');

  return Promise.resolve();
};
