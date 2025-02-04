// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:uberuserapp/Screens/Home.dart';
// import 'package:uberuserapp/const/dep.dart';
// import '../const/Button.dart';
// import '../const/CustomTextfields.dart';
// import '../methods/checkinternet.dart';
// import 'Login_Screen.dart';
// import 'RegisterService.dart';

// class SignupScreen extends StatelessWidget {
//   const SignupScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     TextEditingController fullnamecontroller = TextEditingController();
//     TextEditingController emailcontroller = TextEditingController();
//     TextEditingController passwordcontroller = TextEditingController();
//     TextEditingController conpasswordcontroller = TextEditingController();

//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(12),
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               SizedBox(height: 250, width: 250, child: Image.asset(logo)),
//               "Welcome  Create your account here ".text.color(Vx.white).make(),
//               20.heightBox,
//               Customtextfields(
//                   controller: fullnamecontroller, hinttext: 'Full Name'),
//               10.heightBox,
//               Customtextfields(controller: emailcontroller, hinttext: 'Email'),
//               10.heightBox,
//               Customtextfields(
//                   controller: passwordcontroller, hinttext: 'Password'),
//               10.heightBox,
//               Customtextfields(
//                   controller: conpasswordcontroller,
//                   hinttext: 'Confirm Password'),
//               20.heightBox,
//               Buttons(
//                   onpress: () {
//                     var name = fullnamecontroller.text.trim();
//                     var email = emailcontroller.text.trim();
//                     var password = passwordcontroller.text.trim();
//                     var confirmpass = conpasswordcontroller.text.trim();

//                     final auth = FirebaseAuth.instance;

//                     auth
//                         .createUserWithEmailAndPassword(
//                             email: email, password: password)
//                         .then((value) => {
//                               FirebaseFirestore.instance
//                                   .collection('userdata')
//                                   .doc()
//                                   .set({
//                                 'Username': name,
//                                 'Email': email,
//                               }),
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                   const SnackBar(
//                                       content: Text(
//                                           "Your Account are Successfully Register"))),
//                               Get.to(const HomeScreen())
//                             });
//                   },
//                   title: 'Signup'),
//               15.heightBox,
//               "Or Login your Account".text.color(Vx.white).make(),
//               15.heightBox,
//               Buttons(
//                   onpress: () {
//                     Get.to(() => const LoginScreen());
//                   },
//                   title: 'Login'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uberuserapp/Screens/Home.dart';
import 'package:uberuserapp/const/dep.dart';
import '../const/Button.dart';
import '../const/CustomTextfields.dart';
import '../methods/checkinternet.dart';
import 'Login_Screen.dart';
import 'RegisterService.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController fullnamecontroller = TextEditingController();
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();
    TextEditingController conpasswordcontroller = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 250, width: 250, child: Image.asset(logo)),
              "Welcome  Create your account here ".text.color(Vx.white).make(),
              20.heightBox,
              Customtextfields(
                  controller: fullnamecontroller, hinttext: 'Full Name'),
              10.heightBox,
              Customtextfields(controller: emailcontroller, hinttext: 'Email'),
              10.heightBox,
              Customtextfields(
                  controller: passwordcontroller, hinttext: 'Password'),
              10.heightBox,
              Customtextfields(
                  controller: conpasswordcontroller,
                  hinttext: 'Confirm Password'),
              20.heightBox,
              Buttons(
                  onpress: () async {
                    var name = fullnamecontroller.text.trim();
                    var email = emailcontroller.text.trim();
                    var password = passwordcontroller.text.trim();
                    var confirmpass = conpasswordcontroller.text.trim();

                    final auth = FirebaseAuth.instance;

                    try {
                      UserCredential userCredential =
                          await auth.createUserWithEmailAndPassword(
                        email: email,
                        password: password,
                      );

                      await FirebaseFirestore.instance
                          .collection('userdata')
                          .doc(userCredential.user?.uid)
                          .set({
                        'Username': name,
                        'Email': email,
                      });

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.green,
                          content: Text(
                            "Your Account is Successfully Registered",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      );

                      // Delay before navigating to the HomeScreen
                      await Future.delayed(const Duration(seconds: 2));

                      Get.to(const HomeScreen());
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Error: ${e.toString()}"),
                        ),
                      );
                    }
                  },
                  title: 'Signup'),
              15.heightBox,
              "Or Login your Account".text.color(Vx.white).make(),
              15.heightBox,
              Buttons(
                  onpress: () {
                    Get.to(() => const LoginScreen());
                  },
                  title: 'Login'),
            ],
          ),
        ),
      ),
    );
  }
}
