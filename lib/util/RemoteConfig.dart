class RemoteConfig {
  static final Map<dynamic, String> config = {
    "AuthorizationToken": "YOUR_API_KEY",
    "BASE_URL": "https://ultracoralaustralia.com",
    "BASE_PRODUCTS_URL": "/BASE_PRODUCTS_URL/products/categoryId=1",
    "Consumer Key": "ck_ace9c93b22be3230efae9fb9fa64d950c70f5635",
    "Consumer secret": "cs_d68d3cb4a179e522ee2ea0e66a234e03c8981c68"
  };

  /// Initialize the API
  static final wc_api = [
    "https://ultracoralaustralia.com",
    "ck_ace9c93b22be3230efae9fb9fa64d950c70f5635",
    "cs_d68d3cb4a179e522ee2ea0e66a234e03c8981c68"
  ];

//  final FirebaseApp app = await FirebaseApp.configure(
//  name: 'db2',
//  options: Platform.isIOS
//  ? const FirebaseOptions(
//  googleAppID: '1:297855924061:ios:c6de2b69b03a5be8',
//  gcmSenderID: '297855924061',
//  databaseURL: 'https://flutterfire-cd2f7.firebaseio.com',
//  )
//      : const FirebaseOptions(
//  googleAppID: '1:297855924061:android:669871c998cc21bd',
//  apiKey: 'AIzaSyD_shO5mfO9lhy2TVWhfo1VUmARKlG4suk',
//  databaseURL: 'https://flutterfire-cd2f7.firebaseio.com',
//  ),
//  );
}
