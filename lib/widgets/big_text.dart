
import 'package:flutter/cupertino.dart';

import '../generated/fonts.gen.dart';

class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overflow;
  FontWeight fontWeight;
  TextDecoration textDecoration;
  int maxLine;
  TextAlign textAlign;

  BigText(
      {Key? key,
        this.color = const Color(0xFF332b2b),
        required this.text,
        this.overflow = TextOverflow.ellipsis,
        this.fontWeight = FontWeight.normal,
        this.size = 0,
        this.maxLine = 500,
        this.textAlign = TextAlign.left,
        this.textDecoration = TextDecoration.none})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLine,
      overflow: overflow,
      style: TextStyle(
        fontFamily: FontFamily.poppins,
        color: color,
        fontWeight: fontWeight,
        decoration: textDecoration,
        fontSize: size == 0 ? MediaQuery.of(context).size.height / 42.2 : size,
      ),
    );
  }
}
