/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */

import React, {Component} from 'react';

import {
  Button,
  SafeAreaView,
  StyleSheet,
  ScrollView,
  View,
  Text,
  StatusBar,
} from 'react-native';

import {Colors, Header} from 'react-native/Libraries/NewAppScreen';

import firebase from 'react-native-firebase';

import {initPushNotifications} from './NotifService';

class App extends Component {
  async componentDidMount() {
    const onNotificationCallback = () => {
      this.setState({bgColor: '#1e90ff55', text: 'on notification'});
    };
    const onInitialNotificationCallback = () => {
      this.setState({bgColor: '#F55', text: 'get Initial Notification'});
    };
    const onNotificationOpenedCallback = () => {
      this.setState({bgColor: '#0F55', text: 'on Notification Opened'});
    };
    initPushNotifications(
      onNotificationCallback,
      onInitialNotificationCallback,
      onNotificationOpenedCallback,
    );
  }

  state = {
    bgColor: 'white',
    text: 'Initial',
  };

  render() {
    return (
      <View style={{backgroundColor: this.state.bgColor, flex: 1}}>
        <StatusBar barStyle="dark-content" />
        <SafeAreaView>
          <ScrollView
            contentInsetAdjustmentBehavior="automatic"
            style={styles.scrollView}>
            <Header />
            <Button
              title="SEND EVENT"
              onPress={async () => {
                await firebase.analytics().logEvent('product_view', {
                  id: '123456789',
                  color: 'red',
                  via: 'ProductCatalog',
                });
              }}
            />
            <Text style={styles.text}>{this.state.text}</Text>
          </ScrollView>
        </SafeAreaView>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  scrollView: {
    backgroundColor: Colors.lighter,
  },
  text: {fontSize: 30, color: 'red', alignSelf: 'center', marginTop: 30},
});

export default App;
