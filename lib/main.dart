import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'cameraAccess/homescreen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const Homepage(),
      //   home: ChangeNotifierProvider(
      //     create: (_) => Itembutton(),
      //     child: const PageOne(),
      //   ),
      //   home: ChangeNotifierProvider(
      //     create: (_) => Itembutton2(),
      //     child: const PageTwo(),
      //   ),
    );
  }
}
