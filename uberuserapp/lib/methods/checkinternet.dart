// ignore_for_file: unrelated_type_equality_checks

import 'package:uberuserapp/const/dep.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

Future<void> checkInternet(BuildContext context) async {
  var internetresult = Connectivity().checkConnectivity();
  if (internetresult != ConnectivityResult.mobile &&
      internetresult != ConnectivityResult.wifi) {
    const snackBar = SnackBar(
      content: Text(
        "Please connect your device with internet ",
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
