import 'package:uberuserapp/const/dep.dart';

Widget Buttons({onpress, title}) {
  return SizedBox(
    height: 50,
    width: 280,
    child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Vx.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
        onPressed: onpress,
        child: Text(
          title,
          style: const TextStyle(fontSize: 18, color: Vx.gray500),
        )),
  );
}


