 import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:uneed/get/provider.dart';
import 'package:uneed/layouts/mobile.dart';
import 'package:uneed/layouts/responsive.dart';
import 'package:uneed/layouts/web.dart';
import 'package:uneed/pages/login.dart';
import 'package:uneed/material/colors.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyBReEuOqnYIwbZZFZRKQbq02h8cUd2KuZ8",
  authDomain: "uneed-a722e.firebaseapp.com",
  projectId: "uneed-a722e",
  storageBucket: "uneed-a722e.appspot.com",
  messagingSenderId: "609815355166",
  appId: "1:609815355166:android:73a3cc56392f1eb7d0730f",  
  measurementId: "G-JM8EXNRTKL"
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Uneed_Care',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: mbColor,
        ),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {       
              if (snapshot.hasData) {
                return const TheResponse(
                  mobileScreenLayout: ForMobile(),
                  webScreenLayout: ForWeb(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('${snapshot.error}'),
                );
              }
            }            
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return const LoginScreen();
          },
        ),
      ),
    );
  }
}
