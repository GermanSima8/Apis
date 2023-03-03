import 'package:flutter/material.dart';
import 'package:flutter_application_12/model.dart';
import 'package:flutter_application_12/reader.dart';

class Api7 extends StatefulWidget {
  const Api7({super.key});

  @override
  State<Api7> createState() => _Api7State();
}

class _Api7State extends State<Api7> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Documentos de Estadisticas",
                  style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold),
                ),
                Column(
                  children: Document.doc_list
                      .map((doc) => ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Reader(doc)));
                            },
                            title: Text(
                              doc.doc_title!,
                              overflow: TextOverflow.ellipsis,
                            ),
                            subtitle: Text("${doc.page_num!} Paginass"),
                            trailing: Text(doc.doc_date!),
                            leading: Icon(
                              Icons.picture_as_pdf,
                              color: Color.fromARGB(255, 62, 8, 133),
                              size: 28.0,
                            ),
                          ))
                      .toList(),
                )
              ],
            ),
          )),
    );
  }
}
