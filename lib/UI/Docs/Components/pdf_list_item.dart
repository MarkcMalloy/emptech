import 'package:emptech.app.emptech/UI/Docs/documentation_page.dart';
import 'package:emptech.app.emptech/Utils/emptech_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PDFListItem extends StatelessWidget {
  final Function function;
  final int index;
  final PdfDocument document;

  const PDFListItem({Key? key, required this.function, required this.index, required this.document}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              document.filename,
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
              onPressed: () => function(document),
            ),
          ],
        ),
      ),
    );
  }
}
