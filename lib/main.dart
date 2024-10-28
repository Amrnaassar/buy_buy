import 'package:buy_buy/screens/home_screen.dart';
import 'package:buy_buy/screens/login_screen.dart';
import 'package:buy_buy/screens/signup_screen.dart';
import 'package:buy_buy/utils/constants.dart';
import 'package:buy_buy/utils/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/product/views/product_details_screen.dart';
import 'package:buy_buy/utils/models/product_model.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: LogintScreen.id,
      routes: {
        LogintScreen.id:(context)=>LogintScreen(),
        SignupScreen.id:(context)=>SignupScreen(),
        HomeScreen.id:(context)=>HomeScreen(),

      },

      themeMode: ThemeMode.system,
      theme:TApptheme.lightTheme ,
      darkTheme:TApptheme.darkTheme ,
      home:LogintScreen()
    );
  }
}
