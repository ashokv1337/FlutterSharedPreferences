/*
*
* Created Dated Feb 23,2021
*
*Created By: Ashok Verma
*
* */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences_flutter/helper/preferences_helper.dart';
import 'package:shared_preferences_flutter/screens/dashboard_page.dart';
import 'package:shared_preferences_flutter/screens/main_page.dart';

PreferencesHelper preferencesHelper = PreferencesHelper();
bool isFirstRun;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initializePreferencesHelper();
  runApp(PreferencesApp());
}

_initializePreferencesHelper() async {
  await preferencesHelper.init();

  print(
      "PreferencesHelper.sharedPreferences = ${PreferencesHelper.sharedPreferences}");

  isFirstRun = await preferencesHelper.isFirstRun();

  if (isFirstRun) {
    print("B=B _initializePreferencesHelper isFirstRun =  true");
  } else {
    print("B=B _initializePreferencesHelper isFirstRun =  false");
  }
}

class PreferencesApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PreferencesAppScreenState();
  }
}

class PreferencesAppScreenState extends State<PreferencesApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(
      title: "Shared Preferences",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SafeArea(
        child: isFirstRun ? MainAppPage() : DashboardPage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
