import 'dart:io';
import 'dart:async';
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
      backgroundColor: CustomColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Color(0xfffafafa),
        title: TextField(
          controller: _searchController,
          onChanged: _onSearchChanged,
          decoration: InputDecoration(
              hintText: 'Search for Documentation files...',
              hintStyle: GoogleFonts.roboto(
                  fontSize: 18,
                  color: CustomColors.foregroundColor,
                  fontWeight: FontWeight.w600)),
        ),
      ),
      body: ListView.builder(
        itemCount: _searchResults.length,
        itemBuilder: (BuildContext context, int index) {
          return pdfListItem(index);
        },
      ),
    );
  }

  Widget pdfListItem(int index) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      child: Container(
        decoration: BoxDecoration(
            color: CustomColors.foregroundColor.withOpacity(0.6),
            borderRadius: BorderRadius.circular(12.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.picture_as_pdf,
              color: Color(0xfffafafafa),
              size: 32,
            ),
            Text(
              _searchResults[index].filename,
              style: GoogleFonts.roboto(
                  //color: Color(0xfffafafa),
                color: Color(0xfffafafafa),
                  fontWeight: FontWeight.w700,
                  fontSize: 15),
            ),
            IconButton(
              icon: Icon(Icons.chevron_right, color: Color(0xfffafafafa), size: 32,),
              onPressed: () => _onListItemTapped(_searchResults[index]),
            ),
          ],
        ),
      ),
    );
  }
}
