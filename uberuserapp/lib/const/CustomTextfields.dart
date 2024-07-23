import 'package:uberuserapp/const/dep.dart';

Widget Customtextfields({controller, String? hinttext}) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      border: InputBorder.none,
      filled: true,
      fillColor: Vx.gray300,
      hintText: hinttext,
    ),
  );
}
