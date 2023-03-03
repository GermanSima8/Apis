import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:flutter/material.dart';

class Pdf extends StatefulWidget {
  const Pdf({super.key});

  @override
  State<Pdf> createState() => _PdfState();
}

class _PdfState extends State<Pdf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 17, 173, 66),
        title: const Text("PDF"),
      ),
      body: Column(
        children: Document.doc_list
            .map((doc) => ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Reader(doc)));
                  },
                  title: Text(
                    doc.doc_title!,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text("${doc.page_num!} Paginass"),
                  trailing: Text(doc.doc_date!),
                  leading: Icon(
                    Icons.picture_as_pdf,
                    color: Colors.red,
                    size: 28.0,
                  ),
                ))
            .toList(),
      ),
    );
  }
}

class Reader extends StatefulWidget {
  Reader(this.doc, {Key? key}) : super(key: key);
  Document doc;
  @override
  State<Reader> createState() => _ReaderState();
}

class _ReaderState extends State<Reader> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 17, 173, 66),
        title: Text(widget.doc.doc_title!),
      ),
      body: Container(
        child: SfPdfViewer.network(widget.doc.doc_url!),
      ),
    );
  }
}

class Document {
  String? doc_title;
  String? doc_url;
  String? doc_date;
  int? page_num;

  Document(this.doc_title, this.doc_url, this.doc_date, this.page_num);

  static List<Document> doc_list = [
    Document("Semana1", "hhttp://bbeltran.cs.buap.mx/CSS.pdf", "12-01-2023", 2),
    Document(
        "Semana 2",
        "https://alternativascc.org/wp-content/uploads/2018/05/cosecha-y-postcosecha_web-1.pdf",
        "12-01-2023",
        23),
    Document(
        "Semana 4", "http://bbeltran.cs.buap.mx/CSS.pdf", "12-01-2023", 45),
    Document("Semana 4", "http://profesores.fi-b.unam.mx/cintia/Manualhtml.pdf",
        "13-04-2023", 2),
    Document(
        "Semana 5",
        "https://www.um.es/docencia/barzana/DAWEB/2017-18/daweb-NodeJS.pdf",
        "15-01-2023",
        42),
    Document("Semana 5", "http://bbeltran.cs.buap.mx/CSS.pdf", "15-01-2023", 12)
  ];
}
