import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:maintenance_app/screens/splashScreen.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // Replace with actual values
    options: kIsWeb
        ? const FirebaseOptions(
      apiKey: "AIzaSyBP34NxhJZjBO7VRB3MukicgO4yq1JWg8E",
      appId: "1:62131267051:android:2d71933854976c9080e5ae",
      messagingSenderId: "62131267051",
      projectId: "myapp-965420",
      storageBucket: "myapp-965420.appspot.com",
    ): null,
  );

  await FlutterDownloader.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MaterialApp(
        home: Wrapper(),
      ),
          );
  }


}

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }
}
