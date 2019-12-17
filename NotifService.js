import firebase from 'react-native-firebase';
import {Platform} from 'react-native';

export const initPushNotifications = async (
  onNotificationCallback,
  onInitialNotificationCallback,
  onNotificationOpenedCallback,
) => {
  // steps to receive notifications: https://rnfirebase.io/docs/v5.x.x/notifications/receiving-notifications
  // must create channel. https://rnfirebase.io/docs/v5.x.x/notifications/android-channels
  const channel = new firebase.notifications.Android.Channel(
    'insider',
    'insider channel',
    firebase.notifications.Android.Importance.Max,
  );
  firebase.notifications().android.createChannel(channel);

  await checkPermission();
  await createNotificationListeners(
    onNotificationCallback,
    onInitialNotificationCallback,
    onNotificationOpenedCallback,
  );
};

export const getToken = async () => {
  const fcmToken = await firebase.messaging().getToken();
  const apnsToken = await firebase.messaging().ios.getAPNSToken();
  console.log('APNS ============', apnsToken);
  if (fcmToken) {
    console.log(fcmToken);
    return fcmToken;
  }
  throw new Error('empty token');
};

export const checkPermission = async () => {
  try {
    const enabled = await firebase.messaging().hasPermission();
    if (enabled) {
      getToken();
    } else {
      requestPermission();
    }
  } catch (error) {
    console.log('checking permission error', error);
  }
};

export const requestPermission = async () => {
  try {
    await firebase.messaging().requestPermission();
    firebase
      .messaging()
      .ios.registerForRemoteNotifications()
      .then(() => {
        firebase
          .messaging()
          .ios.getAPNSToken()
          .then(token => {
            console.log('APNS ============', token);
          });
      });
    /* if (!firebase.messaging().isRegisteredForRemoteNotifications) {
      await firebase.messaging().ios.registerForRemoteNotifications();
    }*/

    getToken();
  } catch (error) {
    console.log('permission rejected', error);
  }
};

export const createNotificationListeners = async (
  onNotificationCallback,
  onInitialNotificationCallback,
  onNotificationOpenedCallback,
) => {
  firebase.messaging().onTokenRefresh(async fcmToken => {
    if (fcmToken) {
      console.log('New FCM Token:', fcmToken);
      const apnsToken = await firebase.messaging().ios.getAPNSToken();
      console.log('APNS ============', apnsToken);
    }
  });

  firebase.notifications().onNotification(notification => {
    handleNotification(notification);
    onNotificationCallback();
  });

  firebase.notifications().onNotificationDisplayed(notification => {});

  firebase
    .notifications()
    .getInitialNotification()
    .then(notification => {
      if (notification) {
        handleInitialNotification(notification);
        onInitialNotificationCallback();
      }
    });

  firebase.notifications().onNotificationOpened(notification => {
    handleNotificationOpened(notification);
    onNotificationOpenedCallback();
  });
};

const handleNotification = notification => {
  console.log('notification', notification);
  console.log('notification.android._actions', notification.android._actions);
  notification.setSound('bell.mp3');
  notification.android.setVibrate([500]);
  notification.android.setAutoCancel(true);
  notification.android.setChannelId('insider');
  firebase.notifications().displayNotification(notification);
};

const handleNotificationOpened = notificationData => {};

const handleInitialNotification = notification => {
  console.log(notification);
  console.log(notification.notification);
  notification.notification.android.setChannelId('insider').setSound('default');
  // firebase.notifications().displayNotification(notification.notification);
  firebase.notifications().setBadge(0);
  firebase.notifications().removeAllDeliveredNotifications();
};
