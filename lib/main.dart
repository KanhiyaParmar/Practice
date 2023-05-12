import 'package:elredtask/Screens/splashScreen.dart';
import 'package:elredtask/provider/loginProvider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ConsumerModel.dart';
import 'firebase_options.dart';

void main() async {
// ...
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GoogleSignInProvider()),
        ChangeNotifierProvider(create: (_) => TaskModel()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.green,
        ),
        debugShowCheckedModeBanner: false,
        title: 'My App',
        home: const SplashScreen(),
      ),
    );
  }
}
