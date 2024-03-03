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
import 'package:knovator/Models/resume_model.dart';
import 'package:knovator/Pages/create.dart';
import 'package:knovator/Pages/home.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PdfPreviewPage extends StatefulWidget {
  const PdfPreviewPage({super.key});

  @override
  State<PdfPreviewPage> createState() => _PdfPreviewPageState();
}

class _PdfPreviewPageState extends State<PdfPreviewPage> {
  void initState() {
    // Call the superclass initState() method
    super.initState();
    fonts();
    // Perform initialization tasks here
    // For example, you can load data from a database, initialize variables, etc.
    // This code will be executed only once when the widget is first inserted into the widget tree
  }

  Uint8List? fontBytes;
  ByteData? fontByteData;
  Future<void> fonts() async {
    fontByteData = await rootBundle.load('images/Helvetica.ttf');
    fontBytes = fontByteData?.buffer.asUint8List();

    // final ByteData pdfByteData = await generatePdf(fontBytes);
    // final Uint8List pdfBytes = pdfByteData.buffer.asUint8List();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('PDF Preview'),
        actions: [
          IconButton(
              onPressed: () async {
                getResumeList.add(UserData(
                    firstName: firstName,
                    lastName: lastName,
                    bio: bio,
                    designation: designation,
                    mobileNumber: mobileNumber,
                    email: email,
                    github: github,
                    linkedIn: linkedIn,
                    address: address,
                    skills: skills,
                    languages: languages,
                    education: education,
                    experience: experience));
                await saveResumeList(getResumeList).then((value) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyHomePage(),
                      ),
                      (route) => false);
                });
              },
              icon: Icon(
                Icons.save,
              ))
        ],
      ),
      body: PdfPreview(
        build: (context) => makePdf(),
      ),
    );
  }

  ///1d990e
  Future<Uint8List> makePdf() async {
    var screenSize = MediaQuery.of(context).size;

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
                      pw.Text(
                        "${firstName.text} ${lastName.text}",
                        style: pw.TextStyle(
                          font: pw.Font.ttf(fontByteData!),
                          fontSize: 20,
                        ),
                      ),
                      pw.Text(
                        "${designation.text}",
                        style: pw.TextStyle(
                            font: pw.Font.ttf(fontByteData!),
                            fontSize: 16,
                            color: PdfColors.grey),
                      ),
                      pw.Text(
                        "${bio.text}",
                        style: pw.TextStyle(
                          font: pw.Font.ttf(fontByteData!),
                          fontSize: 14,
                        ),
                      ),
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
                              pw.Container(
                                padding: pw.EdgeInsets.symmetric(
                                    vertical: screenSize.height * 0.003,
                                    horizontal: screenSize.height * 0.009),
                                decoration: pw.BoxDecoration(
                                    color: PdfColor.fromHex('1d990e')),
                                child: pw.Text("Contact",
                                    style: const pw.TextStyle(
                                        fontSize: 16, color: PdfColors.white)),
                              ),
                              pw.SizedBox(height: 5),
                              // pw.SizedBox(height: 5),
                              // pw.Wrap(
                              //   direction: pw.Axis.vertical,
                              //   // spacing: 8.0, // Adjust as needed
                              //   runSpacing: 8.0, // Adjust as needed
                              //   children: List.generate(
                              //     contacts.length,
                              //     (index) => pw.Text(
                              //       "${contacts[index].text}",
                              //       style: const pw.TextStyle(fontSize: 14),
                              //       textAlign: pw.TextAlign.start,
                              //     ),
                              //   ),
                              // ),
                              pw.Text("${contacts[0].text}",
                                  style: const pw.TextStyle(fontSize: 14)),
                              pw.Text("${contacts[1].text}",
                                  style: const pw.TextStyle(fontSize: 14)),
                              pw.Text("${contacts[2].text}",
                                  style: const pw.TextStyle(fontSize: 14)),
                              pw.Text("${contacts[3].text}",
                                  style: const pw.TextStyle(fontSize: 14)),
                              pw.Text("${contacts[4].text}",
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
                              pw.Container(
                                padding: pw.EdgeInsets.symmetric(
                                    vertical: screenSize.height * 0.003,
                                    horizontal: screenSize.height * 0.009),
                                decoration: pw.BoxDecoration(
                                    color: PdfColor.fromHex('1d990e')),
                                child: pw.Text("Skills",
                                    style: const pw.TextStyle(
                                        fontSize: 16, color: PdfColors.white)),
                              ),
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
                              pw.Container(
                                padding: pw.EdgeInsets.symmetric(
                                    vertical: screenSize.height * 0.003,
                                    horizontal: screenSize.height * 0.009),
                                decoration: pw.BoxDecoration(
                                    color: PdfColor.fromHex('1d990e')),
                                child: pw.Text("Languages",
                                    style: const pw.TextStyle(
                                        fontSize: 16, color: PdfColors.white)),
                              ),
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
                            pw.Container(
                              padding: pw.EdgeInsets.symmetric(
                                  vertical: screenSize.height * 0.003,
                                  horizontal: screenSize.height * 0.009),
                              decoration: pw.BoxDecoration(
                                  color: PdfColor.fromHex('1d990e')),
                              child: pw.Text("Work Experience",
                                  style: const pw.TextStyle(
                                      fontSize: 16, color: PdfColors.white)),
                            ),
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
                                              style: pw.TextStyle(
                                                  font: pw.Font.ttf(
                                                      fontByteData!),
                                                  fontSize: 14),
                                              textAlign: pw.TextAlign.start,
                                            ),
                                            pw.Text(
                                              "${experience[index].title.text}",
                                              style: pw.TextStyle(
                                                  font: pw.Font.ttf(
                                                      fontByteData!),
                                                  fontSize: 14),
                                              textAlign: pw.TextAlign.start,
                                            ),
                                            pw.Text(
                                              "${experience[index].year.text}",
                                              style: pw.TextStyle(
                                                  font: pw.Font.ttf(
                                                      fontByteData!),
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
                            pw.Container(
                              padding: pw.EdgeInsets.symmetric(
                                  vertical: screenSize.height * 0.003,
                                  horizontal: screenSize.height * 0.009),
                              decoration: pw.BoxDecoration(
                                  color: PdfColor.fromHex('1d990e')),
                              child: pw.Text("Education",
                                  style: const pw.TextStyle(
                                      fontSize: 16, color: PdfColors.white)),
                            ),
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
                                              style: pw.TextStyle(
                                                  font: pw.Font.ttf(
                                                      fontByteData!),
                                                  fontSize: 14),
                                              textAlign: pw.TextAlign.start,
                                            ),
                                            pw.Text(
                                              "${education[index].title.text}",
                                              style: pw.TextStyle(
                                                  font: pw.Font.ttf(
                                                      fontByteData!),
                                                  fontSize: 14),
                                              textAlign: pw.TextAlign.start,
                                            ),
                                            pw.Text(
                                              "${education[index].year.text}",
                                              style: pw.TextStyle(
                                                  font: pw.Font.ttf(
                                                      fontByteData!),
                                                  fontSize: 14),
                                              textAlign: pw.TextAlign.start,
                                            ),
                                          ])),
                            ),
                          ])),
                    ]),
                pw.SizedBox(height: 5),
              ]);
        }));
    return pdf.save();
  }
}
