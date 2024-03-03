// import 'package:flutter/material.dart';
//
// class ResumePreview extends StatefulWidget {
//   const ResumePreview({super.key});
//
//   @override
//   State<ResumePreview> createState() => _ResumePreviewState();
// }
//
// class _ResumePreviewState extends State<ResumePreview> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//           title: Text('Resume Preview'),
//           actions: [IconButton(onPressed: () {}, icon: Icon(Icons.download))],
//         ),
//         body: Column(children: []));
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:knovator/Pages/create.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PdfPreviewPage extends StatefulWidget {
  const PdfPreviewPage({super.key});

  @override
  State<PdfPreviewPage> createState() => _PdfPreviewPageState();
}

class _PdfPreviewPageState extends State<PdfPreviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Preview'),
      ),
      body: PdfPreview(
        build: (context) => makePdf(),
      ),
    );
  }

  Future<Uint8List> makePdf() async {
    final pdf = pw.Document();
    // final ByteData bytes = await rootBundle.load('assets/phone.png');
    // final Uint8List byteList = bytes.buffer.asUint8List();
    pdf.addPage(pw.Page(
        margin: const pw.EdgeInsets.all(10),
        pageFormat: PdfPageFormat.a4,
        build: (context) {
          return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text("${firstName.text} ${lastName.text}",
                          style: const pw.TextStyle(fontSize: 30)),
                      pw.Text("${designation.text}"),

                      // pw.Image(pw.MemoryImage(byteList),
                      // fit: pw.BoxFit.fitHeight, height: 100, width: 100)
                    ]),
                pw.SizedBox(height: 5),
                pw.Divider(
                  color: PdfColors.black,
                  thickness: 1,
                  height: 5,
                  endIndent: 10, // Adjust as needed
                  // indent: 10, // Adjust as needed
                ),
                pw.SizedBox(height: 5),
                pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Expanded(
                        child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text("Contact",
                                  style: const pw.TextStyle(fontSize: 20)),
                              pw.SizedBox(height: 5),
                              pw.Text("${mobileNumber.text}",
                                  style: const pw.TextStyle(fontSize: 14)),
                              pw.Text("${email.text}",
                                  style: const pw.TextStyle(fontSize: 14)),
                              pw.Text("${linkedIn.text}",
                                  style: const pw.TextStyle(fontSize: 14)),
                              pw.Text("${address.text}",
                                  style: const pw.TextStyle(fontSize: 14)),
                              pw.Text("${github.text}",
                                  style: const pw.TextStyle(fontSize: 14)),
                              pw.SizedBox(height: 5),
                              pw.Divider(
                                color: PdfColors.black,
                                thickness: 1,
                                height: 5,
                                endIndent: 10, // Adjust as needed
                                // indent: 10, // Adjust as needed
                              ),
                              pw.SizedBox(height: 5),
                              pw.Text("Skills",
                                  style: const pw.TextStyle(fontSize: 20)),
                              pw.SizedBox(height: 5),
                              pw.Wrap(
                                direction: pw.Axis.vertical,
                                // spacing: 8.0, // Adjust as needed
                                runSpacing: 8.0, // Adjust as needed
                                children: List.generate(
                                  skills.length,
                                  (index) => pw.Text(
                                    "${skills[index].text}",
                                    style: const pw.TextStyle(fontSize: 14),
                                    textAlign: pw.TextAlign.start,
                                  ),
                                ),
                              ),
                              pw.SizedBox(height: 5),
                              pw.Divider(
                                color: PdfColors.black,
                                thickness: 1,
                                height: 5,
                                endIndent: 10, // Adjust as needed
                                // indent: 10, // Adjust as needed
                              ),
                              pw.SizedBox(height: 5),
                              pw.Text("Languages",
                                  style: const pw.TextStyle(fontSize: 20)),
                              pw.SizedBox(height: 5),
                              pw.Wrap(
                                direction: pw.Axis.vertical,
                                // spacing: 8.0, // Adjust as needed
                                runSpacing: 8.0, // Adjust as needed
                                children: List.generate(
                                  languages.length,
                                  (index) => pw.Text(
                                    "${languages[index].text}",
                                    style: const pw.TextStyle(fontSize: 14),
                                    textAlign: pw.TextAlign.start,
                                  ),
                                ),
                              )
                            ]),
                      ),
                      pw.Expanded(
                          child: pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                            pw.Text("Work Experience",
                                style: const pw.TextStyle(fontSize: 20)),
                            pw.SizedBox(height: 5),
                            pw.Wrap(
                              direction: pw.Axis.vertical,
                              // spacing: 8.0, // Adjust as needed
                              runSpacing: 8.0, // Adjust as needed
                              children: List.generate(
                                  experience.length,
                                  (index) => pw.Column(
                                          mainAxisSize: pw.MainAxisSize.min,
                                          crossAxisAlignment:
                                              pw.CrossAxisAlignment.start,
                                          children: [
                                            pw.Text(
                                              "${experience[index].companyName.text}",
                                              style: const pw.TextStyle(
                                                  fontSize: 14),
                                              textAlign: pw.TextAlign.start,
                                            ),
                                            pw.Text(
                                              "${experience[index].title.text}",
                                              style: const pw.TextStyle(
                                                  fontSize: 14),
                                              textAlign: pw.TextAlign.start,
                                            ),
                                            pw.Text(
                                              "${experience[index].year.text}",
                                              style: const pw.TextStyle(
                                                  fontSize: 14),
                                              textAlign: pw.TextAlign.start,
                                            ),
                                          ])),
                            ),
                            pw.SizedBox(height: 5),
                            pw.Divider(
                              color: PdfColors.black,
                              thickness: 1,
                              height: 5,
                              endIndent: 10, // Adjust as needed
                              // indent: 10, // Adjust as needed
                            ),
                            pw.SizedBox(height: 5),
                            pw.Text("Education",
                                style: const pw.TextStyle(fontSize: 20)),
                            pw.SizedBox(height: 5),
                            pw.Wrap(
                              direction: pw.Axis.vertical,
                              // spacing: 8.0, // Adjust as needed
                              runSpacing: 8.0, // Adjust as needed
                              children: List.generate(
                                  education.length,
                                  (index) => pw.Column(
                                          mainAxisSize: pw.MainAxisSize.min,
                                          crossAxisAlignment:
                                              pw.CrossAxisAlignment.start,
                                          children: [
                                            pw.Text(
                                              "${education[index].schoolCollage.text}",
                                              style: const pw.TextStyle(
                                                  fontSize: 14),
                                              textAlign: pw.TextAlign.start,
                                            ),
                                            pw.Text(
                                              "${education[index].title.text}",
                                              style: const pw.TextStyle(
                                                  fontSize: 14),
                                              textAlign: pw.TextAlign.start,
                                            ),
                                            pw.Text(
                                              "${education[index].year.text}",
                                              style: const pw.TextStyle(
                                                  fontSize: 14),
                                              textAlign: pw.TextAlign.start,
                                            ),
                                          ])),
                            ),
                          ])),
                    ]),
                pw.Divider(
                  color: PdfColors.black,
                  thickness: 1,
                  height: 5,
                  endIndent: 10, // Adjust as needed
                  // indent: 10, // Adjust as needed
                ),
                pw.SizedBox(height: 5),
              ]);
        }));
    return pdf.save();
  }
}
