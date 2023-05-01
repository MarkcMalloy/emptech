import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PdfViewerPage extends StatefulWidget {
  final String pdfPath;

  PdfViewerPage({required this.pdfPath});

  @override
  _PdfViewerPageState createState() => _PdfViewerPageState();
}

class _PdfViewerPageState extends State<PdfViewerPage> {
  late PDFViewController _pdfViewController;
  int _currentPage = 0;
  int _totalPages = 0;

  void _onPdfViewCreated(PDFViewController pdfViewController) {
    _pdfViewController = pdfViewController;
    _pdfViewController.getPageCount().then((value) {
      setState(() {
        _totalPages = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Viewer'),
      ),
      body: Column(
        children: [
          Expanded(
            child: PDFView(
              filePath: widget.pdfPath,
              onViewCreated: _onPdfViewCreated,
              /*
              onPageChanged: (int page, int total) {
                setState(() {
                  _currentPage = page + 1;
                  _totalPages = total;
                });
              },
              onPageError: (dynamic error) {
                print('Error: $error');
              },
               */
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Page $_currentPage of $_totalPages'),
                SizedBox(width: 16.0),
                ElevatedButton(
                  onPressed: () {
                    _pdfViewController.setPage(_currentPage - 1);
                  },
                  child: Text('Previous'),
                ),
                SizedBox(width: 16.0),
                ElevatedButton(
                  onPressed: () {
                    _pdfViewController.setPage(_currentPage + 1);
                  },
                  child: Text('Next'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
