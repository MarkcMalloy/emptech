import 'package:emptech.app.emptech/UI/Docs/Components/pdf_viewer_page.dart';
import 'package:emptech.app.emptech/Utils/emptech_colors.dart';
import 'package:flutter/material.dart';
import 'dart:io' as io;

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
  List<PdfDocument> _searchResults = [];
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    doesPdfExist();
  }

  Future<void> doesPdfExist() async {
    var syncPath = widget.documents.first.filename;

    // for a file
    await io.File(syncPath).exists();
    print(
        "PDF ${widget.documents.first.filename} exists: ${io.File(syncPath).existsSync()}");

    // for a directory
    await io.Directory(syncPath).exists();
    io.Directory(syncPath).existsSync();
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
        title: TextField(
          controller: _searchController,
          onChanged: _onSearchChanged,
          decoration: InputDecoration(
            hintText: 'Search for PDF files...',
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: _searchResults.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Icon(Icons.picture_as_pdf),
            title: Text(
              _searchResults[index].filename,
              style: GoogleFonts.roboto(color: Colors.black),
            ),
            trailing: IconButton(
              icon: Icon(Icons.chevron_right),
              onPressed: () => _onListItemTapped(_searchResults[index]),
            ),
          );
        },
      ),
    );
  }
}
