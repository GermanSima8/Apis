import 'package:flutter/material.dart';
import 'package:flutter_application_12/Api7.dart';
import 'package:flutter_application_12/login_page.dart';
import 'package:flutter_application_12/Api1.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_application_12/Services/notification.dart';
import 'line_chart.dart';
import 'linear_charts.dart';
import 'package:flutter_application_12/linear_charts.dart';
import 'package:flutter_application_12/Api8.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initNotification();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: LoginPage.id,
      routes: {
        LoginPage.id: (context) => LoginPage(),
      },
    );
  }
}
