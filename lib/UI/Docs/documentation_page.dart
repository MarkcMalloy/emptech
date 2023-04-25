import 'dart:io';
import 'dart:async';
import 'package:emptech.app.emptech/Profile/Components/neumorphic_tile.dart';
import 'package:emptech.app.emptech/UI/Design/glass_overlay.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:path_provider/path_provider.dart';

import 'package:emptech.app.emptech/UI/Docs/Components/pdf_viewer_page.dart';
import 'package:emptech.app.emptech/Utils/emptech_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:google_fonts/google_fonts.dart';

class PdfDocument {
  final String filename;

  PdfDocument({required this.filename});
}

class PdfSearchPage extends StatefulWidget {
  final List<PdfDocument> documents;

  PdfSearchPage({required this.documents});

  @override
  _PdfSearchPageState createState() => _PdfSearchPageState();
}

class _PdfSearchPageState extends State<PdfSearchPage> {
  // TODO: Implement "Add customer notes" as a feedback structure that EmpTech
  List<PdfDocument> _searchResults = [];
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      _searchResults = widget.documents;
    });
    //doesPdfExist();
  }

  Future<void> doesPdfExist() async {
    File file = File("assets/documents/order_glove_guide.pdf");
    final directory = await getApplicationDocumentsDirectory();
    var doesExist = await file.exists();
    var filename = widget.documents.first.filename;
    // for a file
    /*
    await io.File(filename).exists();
    print("PDF $filename exists: ${io.File(filename).existsSync()}");

    // for a directory
    await io.Directory(filename).exists();
    io.Directory(filename).existsSync();
     */
  }

  void _onSearchChanged(String searchText) {
    setState(() {
      _searchResults = widget.documents
          .where((document) => document.filename
              .toLowerCase()
              .contains(searchText.toLowerCase()))
          .toList();
    });
  }

  void _onListItemTapped(PdfDocument document) {
    // Handle opening the PDF file here
    print('Opening PDF file: ${document.filename}');
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PdfViewerPage(pdfPath: document.filename),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            GlassOverlay(body: documentListView()),
            SafeArea(
              child: Center(
                child: topText(),
              ),
            )
          ],
        ));
  }

  Widget documentListView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 32),
          width: MediaQuery.of(context).size.width / 1.1,
          height: MediaQuery.of(context).size.height / 1.4,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: CustomColors.backgroundColor.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 6)
              ],
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(32.0),
                  topRight: Radius.circular(32.0)),
              color: const Color(0xfffafafa)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 4,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: _searchResults.length,
                  itemBuilder: (BuildContext context, int index) {
                    //return pdfListItem(index);
                    return Padding(
                      padding: const EdgeInsets.only(top: 4, bottom: 4, right: 4, left: 4),
                      child: Neumorphic(
                          style: const NeumorphicStyle(
                              shape: NeumorphicShape.concave,
                              depth: 2,
                              intensity: 0.7,
                              color: Colors.white,
                              lightSource: LightSource.topLeft),
                          child: pdfListItem(index)),
                    );
                  },
                ),
              ),
              Padding(
                child: searchTextField(),
                padding: const EdgeInsets.only(bottom: 20),
              )
            ],
          ),
        ),
      ],
    );
  }
  /*
     child: ListView.builder(
          itemCount: _searchResults.length,
          itemBuilder: (BuildContext context, int index) {
            return pdfListItem(index);
          },
        ),
   */

  Widget searchTextField() {
    return Neumorphic(
      style: const NeumorphicStyle(
          shape: NeumorphicShape.concave,
          depth: 2,
          intensity: 0.7,
          color: Color(0xfffafafa),
          lightSource: LightSource.topRight),
      child: TextField(
        textAlign: TextAlign.center,
        controller: _searchController,
        onChanged: _onSearchChanged,
        decoration: InputDecoration(
            hintText: 'Search for Documentation files...',
            hintStyle: GoogleFonts.roboto(
                fontSize: 18.0,
                color: CustomColors.foregroundColor,
                fontWeight: FontWeight.w600)),
      ),
    );
  }

  Widget pdfListItem(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      child: Container(
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Icon(
              Icons.picture_as_pdf,
              color: CustomColors.foregroundColor,
              size: 32,
            ),
            Text(
              _searchResults[index].filename,
              style: GoogleFonts.roboto(
                  //color: Color(0xfffafafa),
                  color: CustomColors.foregroundColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 15),
            ),
            IconButton(
              icon: const Icon(
                Icons.chevron_right,
                color: CustomColors.foregroundColor,
                size: 32,
              ),
              onPressed: () => _onListItemTapped(_searchResults[index]),
            ),
          ],
        ),
      ),
    );
  }

  Widget topText() {
    TextStyle _style1 = GoogleFonts.montserrat(
        fontSize: 20,
        color: const Color(0xfffafafa),
        fontWeight: FontWeight.w400);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Center(
            child: CircleAvatar(
              backgroundColor: const Color(0xfffafafa),
              radius: 28.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(32.0),
                child: const Icon(
                  Icons.document_scanner,
                  color: CustomColors.foregroundColor,
                  size: 42,
                ),
              ),
            ),
          ),
        ),
        Text(
          "EmpTech Documentation",
          style: _style1,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
