import 'dart:io';
import 'dart:async';
import 'package:clay_containers/clay_containers.dart';
import 'package:emptech.app.emptech/UI/Design/glass_overlay.dart';
import 'package:emptech.app.emptech/UI/Docs/Components/pdf_list_item.dart';
//import 'package:flutter_neumorphic/flutter_neumorphic.dart';
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

  void onListItemTapped(PdfDocument document) {
    // Handle opening the PDF file here
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
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            GlassOverlay(body: Container()),
            Positioned(top: 60, right: 12, left: 12, child: topText()),
            Positioned(
              child: documentListView(),
              right: 6,
              left: 6,
              bottom: 0,
            )
          ],
        ));
  }

  Widget documentListView() {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: bottom),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 32),
            width: MediaQuery.of(context).size.width / 1.1,
            height: MediaQuery.of(context).size.height / 1.5,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: CustomColors.backgroundColor.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 6,
                ),
              ],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(32.0),
                topRight: Radius.circular(32.0),
              ),
              color: const Color(0xfffafafa),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                searchTextField(),
                Container(
                  height: 2,
                  decoration: const BoxDecoration(
                    color: CustomColors.foregroundColor,
                  ),
                  width: MediaQuery.of(context).size.width,
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: _searchResults.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            top: 8, bottom: 4, right: 4, left: 4),
                        child: ClayContainer(
                          borderRadius: 12.0,
                          child: PDFListItem(function: onListItemTapped, index: index, document: _searchResults[index]),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget searchTextField() {
    return ClayContainer(
        borderRadius: 12.0,
        child: TextField(
          cursorColor: CustomColors.foregroundColor.withOpacity(0.5),
            style: GoogleFonts.roboto(
                color: CustomColors.foregroundColor,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
            controller: _searchController,
            onChanged: _onSearchChanged,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: CustomColors.foregroundColor.withOpacity(0.5),
                    width: 2.0),
              ),
              hintText: 'Search for Documentation files...',
              hintStyle: GoogleFonts.roboto(
                  fontSize: 18.0,
                  color: CustomColors.foregroundColor,
                  fontWeight: FontWeight.w600),
            )));
  }

  Widget topText() {
    TextStyle _style1 = GoogleFonts.montserrat(
        fontSize: 20,
        color: const Color(0xfffafafa),
        fontWeight: FontWeight.w400);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 12, bottom: 6),
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
