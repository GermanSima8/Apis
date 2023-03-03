import 'package:flutter/material.dart';
import 'package:flutter_application_12/linear_charts.dart';
import 'line_chart.dart';
import 'linear_charts.dart';

class Api6 extends StatefulWidget {
  const Api6({super.key});

  @override
  State<Api6> createState() => _Api6State();
}

class _Api6State extends State<Api6> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material app',
      home: Scaffold(body: const LinearCharts()),
    );
  }
}
