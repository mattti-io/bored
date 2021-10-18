import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PillButton extends StatefulWidget {
  double tWidth = 160;
  double tHeight = 80;
  double tText = 20;
  String content;
  VoidCallback? callback;
  PillButton({Key? key, required this.content, this.callback}) : super(key: key);

  @override
  _PillButtonState createState() => _PillButtonState();
}

class _PillButtonState extends State<PillButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanDown: (value) {
        setState(() {
          widget.tHeight = widget.tHeight - 80 / 70;
          widget.tWidth = widget.tWidth - 160 / 70;
          widget.tText = widget.tText - 20 / 70;
        });
      },
      onPanEnd: (value) {
        setState(() {
          widget.tHeight = widget.tHeight + 80 / 70;
          widget.tWidth = widget.tWidth + 160 / 70;
          widget.tText = widget.tText + 20 / 70;
        });
        widget.callback!();
      },
      child: SizedBox(
        height: 80,
        width: 160,
        child: Center(
          child: Container(
            width: widget.tWidth,
            height: widget.tHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.0),
              color: const Color(0xFF456990),
            ),
            child: Center(
              child: Text(
                widget.content,
                style: GoogleFonts.montserrat(
                  fontSize: widget.tText,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
