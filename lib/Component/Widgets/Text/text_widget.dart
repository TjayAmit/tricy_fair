import 'package:faircomputation/packages.dart';

class TextWidget {
  static Widget widget(
      {String title = '',
      Color color = Colors.black,
      double fontSize = 12.0,
      FontWeight fontWeight = FontWeight.w400,
      TextAlign textAlgin = TextAlign.start}) {
    return Text(
      title,
      style: GoogleFonts.poppins(
          textStyle: TextStyle(
              color: color, fontSize: fontSize, fontWeight: fontWeight)),
      textAlign: textAlgin,
    );
  }
}
