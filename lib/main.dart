import 'package:bake_house/Admin/Pages/AdminPage.dart';
import 'package:bake_house/Admin/Pages/LoginPage.dart';
import 'package:bake_house/Admin/Providers/OrderProvider.dart';
import 'package:bake_house/Admin/Providers/PopUpProvider.dart';
import 'package:bake_house/Admin/Services/AdminAuthentication.dart';
import 'package:bake_house/Components/CustomAppBar.dart';
import 'package:bake_house/Pages/CartPage.dart';
import 'package:bake_house/Pages/CustomisationPage.dart';
import 'package:bake_house/Pages/HomePage.dart';
import 'package:bake_house/Pages/LoginPage.dart';
import 'package:bake_house/Pages/MapPage.dart';
import 'package:bake_house/Pages/SignUpPage.dart';
import 'package:bake_house/Provider/AuthenticationProvider.dart';
import 'package:bake_house/Provider/ReschedulePopProvider.dart';
import 'package:bake_house/Services/Authentication.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Admin/Providers/OrderBoxProvider.dart';
import 'Admin/Providers/OrderstateProvider.dart';
import 'Components/PermissionAlert.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseOptions options = const FirebaseOptions(
      apiKey: "AIzaSyC8Nlb4co7zKkvhCyOyyxz7nyuAzen1AOw",
      appId: "1:326763879630:web:cce377debf2aad585fc49f",
      messagingSenderId: "326763879630",
      projectId: "bakehouse-98631",
      storageBucket: "bakehouse-98631.appspot.com",
      databaseURL: "https://bakehouse-98631-default-rtdb.firebaseio.com");
  final FirebaseApp firebaseApp =
      await Firebase.initializeApp(options: options);
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<AuthenticationProvider>(
        create: (_) => AuthenticationProvider()),
    ChangeNotifierProvider<PopUpProvider>(
      create: (_) => PopUpProvider(),
    ),
    ChangeNotifierProvider<OrderProvider>(
      create: (_) => OrderProvider(),
    ),
    ChangeNotifierProvider<OrderBoxProvider>(
      create: (_) => OrderBoxProvider(),
    ),
    ChangeNotifierProvider<ReschedulePopProvider>(
      create: (_) => ReschedulePopProvider(),
    ),
     ChangeNotifierProvider<OrderStateProvider>(
      create: (_) => OrderStateProvider(),
    ),

  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'roboto',
          textTheme: const TextTheme(
              headline1: TextStyle(
                  fontSize: 26,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              headline2: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 219, 184, 86),
                  fontWeight: FontWeight.w800),
              headline5: TextStyle(fontSize: 14, color: Colors.grey),
              headline6: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.w900),
              headline4: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  fontWeight: FontWeight.w900)),
          primarySwatch: Colors.blue,
        ),
        home: FutureBuilder(
          future: AdminAuthentication().LoginChecker(),
          builder: (context, AsyncSnapshot snap) {
            if (snap.data == true) {
              return AdminPage();
            } else {
              return BakerLoginPage();
            }
          },
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  initState() {}

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void Refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () => {ShowAlert(context, Refresh)});
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.food_bank),
          actions: [
            Padding(
              padding: EdgeInsets.all(12),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CartPage()));
                },
                child: const Icon(
                  Icons.shopping_cart,
                  size: 30,
                ),
              ),
            )
          ],
          elevation: 0,
          backgroundColor: Colors.grey[50],
          foregroundColor: Colors.amber,
        ),
        body: HomePage());
  }
}
