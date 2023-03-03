import 'package:flutter/material.dart';
import 'package:flutter_application_12/ApiControl/controlador.dart';
import 'package:get/get.dart';

class Api3 extends StatefulWidget {
  const Api3({super.key});

  @override
  State<Api3> createState() => _Api3State();
}

class _Api3State extends State<Api3> {
  final ImagenController _imagenController = Get.put(ImagenController());
  final TextEditingController _imageTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: TextField(
                    controller: _imageTextController,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Escribe aquí',
                        contentPadding: EdgeInsets.symmetric(horizontal: 10.0)),
                  ),
                )),
                const SizedBox(
                  width: 15.0,
                ),
                Obx(() {
                  return _imagenController.isLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(elevation: 0),
                          onPressed: () async {
                            await _imagenController.getImage(
                              imageText: _imageTextController.text.trim(),
                            );
                          },
                          child: const Text("crear"));
                })
              ],
            ),
            const SizedBox(height: 30.0),
            Obx(() {
              return _imagenController.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Container(
                      width: double.infinity,
                      height: 300,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: _imagenController.data.value.isNotEmpty
                                  ? NetworkImage(_imagenController.data.value)
                                  : NetworkImage(
                                      'https://cdn.pixabay.com/photo/2016/04/04/14/12/monitor-1307227_960_720.jpg'))),
                    );
            })
          ],
        ),
      ),
    );
  }
}
