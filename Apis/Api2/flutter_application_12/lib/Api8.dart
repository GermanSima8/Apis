import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'api_rest.dart';
import 'package:flutter_application_12/main.dart';

class Api8 extends StatefulWidget {
  const Api8({super.key});

  @override
  State<Api8> createState() => _Api8State();
}

class _Api8State extends State<Api8> {
  SpeechToText speechToText = SpeechToText();
  var text = "Manten presionado el boton y habla";
  var respuesta = "";
  var escuchando = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CircleAvatar(
          backgroundColor: Color(0xFF301FCC),
          radius: 35,
          child: Stack(
            children: [
              Center(
                child: Icon(escuchando ? Icons.mic : Icons.mic_none,
                    color: Colors.white),
              ),
              GestureDetector(
                onTapDown: ((details) async {
                  if (!escuchando) {
                    var disponible = await speechToText.initialize();
                    if (disponible) {
                      setState(() {
                        escuchando = true;
                        speechToText.listen(onResult: (result) {
                          setState(() {
                            text = result.recognizedWords;
                          });
                        });
                      });
                    }
                  }
                }),
                onTapUp: ((details) async {
                  setState(() {
                    escuchando = false;
                  });
                  speechToText.stop();
                  var msg = await ApiServices.sendMessage(text);
                  setState(() {
                    respuesta = msg;
                  });
                }),
              ),
            ],
          )),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(text),
            SizedBox(height: 20),
            Text(respuesta),
          ],
        ),
      ),
    );
  }
}
