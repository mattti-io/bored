import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectableItem extends StatefulWidget {
  String emoji;
  String text;
  bool enabled;
  VoidCallback? onChange;
  VoidCallback? onUnselect;
  SelectableItem({Key? key, required this.emoji, required this.text, required this.enabled, this.onChange, this.onUnselect}) : super(key: key);

  @override
  Unselected createState() => Unselected();
}

class Unselected extends State<SelectableItem> {

  late bool enbl;

  @override
  Widget build(BuildContext context) {

    enbl = widget.enabled;
    void _toggleEnbl() {
      if(enbl){
        setState(() {
          widget.enabled = false;

        });
        widget.onUnselect!();
      }
      if(!enbl){
        setState(() {
          widget.enabled = true;

        });

        widget.onChange!();
      }

    }

    return UnconstrainedBox(
      child: GestureDetector(
        onTap: _toggleEnbl,
        child: Container(
          height: 60.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40.0),
            boxShadow: [
              (enbl
              ? BoxShadow(color: const Color(0xFF0C2F3B).withOpacity(0.19), offset: Offset(0, 3.0),blurRadius: 10.0,)
              : BoxShadow(color: Colors.transparent, offset: Offset(0, 3.0),blurRadius: 10.0,)
              )
            ],
            color: (enbl
            ? const Color(0xFF456990)
            : const Color(0xFFE2E2E2)
            ),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(widget.emoji, style: TextStyle(
                    fontSize: 20
                  ),),
                  SizedBox(width: 10,),
                  Text(
                    widget.text,
                    style: GoogleFonts.montserrat(
                      fontSize: 15.0,
                      color: (enbl
                          ? const Color(0xFFE2E2E2)
                          : const Color(0xFF456990)
                      ),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
