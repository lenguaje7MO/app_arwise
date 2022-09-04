import 'package:app_arwise/src/ui/pages/menu_page.dart';
import 'package:app_arwise/src/ui/pages/presentation_detail_page.dart';
import 'package:app_arwise/src/ui/pages/presentation_page.dart';
import 'package:app_arwise/src/ui/pages/sem_one_diptongo_ejem_page.dart';
import 'package:app_arwise/src/ui/pages/sem_one_diptongo_page.dart';
import 'package:app_arwise/src/ui/pages/sem_one_verbo_ejem_page.dart';
import 'package:app_arwise/src/ui/pages/sem_one_verbo_page.dart';
import 'package:app_arwise/src/ui/pages/unity_desc_page.dart';
import 'package:app_arwise/src/ui/pages/unity_page.dart';
import 'package:app_arwise/src/ui/pages/unity_week_page.dart';
import 'package:flutter/material.dart';

import 'src/ui/pages/unity_option_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PresentationPage(),
    );
  }
}
