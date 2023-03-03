import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Api2 extends StatefulWidget {
  const Api2({super.key});

  @override
  State<Api2> createState() => _Api2State();
}

class _Api2State extends State<Api2> {
  var temp;
  Future getWeather() async {
    final url = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=Halacho&appid=155dc13db0e85cbfee61ec6b86fc7c84&units=metrics");
    http.Response response = await http.get(url);
    var results = jsonDecode(response.body);
    setState(() {
      this.temp = results['main']['temp'];
    });
  }

  @override
  void initState() {
    super.initState();
    this.getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(temp != null ? temp.toString() : "Buscando"),
    );
  }
}
