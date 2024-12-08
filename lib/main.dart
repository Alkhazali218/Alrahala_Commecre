import 'package:alrahala_commecre/core/utils/helper/constant.dart';
import 'package:alrahala_commecre/core/utils/helper/routes.dart';
import 'package:alrahala_commecre/features/login/Presentation/login_view.dart';
import 'package:alrahala_commecre/features/splash/Presentation/splash_view.dart';
import 'package:alrahala_commecre/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  bool isFirstLaunch = await checkFirstLaunch();

  runApp(MyApp(isFirstLaunch: isFirstLaunch));
}

Future<bool> checkFirstLaunch() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isFirstLaunch = prefs.getBool('first_launch') ?? true;

  if (isFirstLaunch) {
    await prefs.setBool('first_launch', false);
  }

  return isFirstLaunch;
}

class MyApp extends StatelessWidget {
  final bool isFirstLaunch;
  const MyApp({super.key, required this.isFirstLaunch});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: kprimaryColor),
      routes: routes,
      initialRoute: isFirstLaunch ? splashView.id : loginView.id,
    );
  }
}
