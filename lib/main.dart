import 'package:flutter/material.dart';
import 'package:celenote_app/helper/navigation_helper.dart';
import 'package:celenote_app/routes/app_routes.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';

// await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
// );


void main() async {
  var widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseAuth.instance.idTokenChanges().listen((event) {
    if(event == null){
      Logger().e("User is currently signed out!");
    }else{
      Logger().e("User is signed in!");
    }});
  NavigationHelper.instance;
  runApp(
    const AppRouter(),
  );
  FlutterNativeSplash.remove();
}
