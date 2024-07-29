// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:uberuserapp/const/dep.dart';
import '../Screens/Home.dart';
import '../const/Button.dart';
import '../const/CustomTextfields.dart';
import 'Signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.asset(logo),
              "Welcome Back You've missed!".text.color(Vx.white).make(),
              20.heightBox,
              Customtextfields(controller: emailcontroller, hinttext: 'Email'),
              10.heightBox,
              Customtextfields(
                  controller: passwordcontroller, hinttext: 'Password'),
              20.heightBox,
              Buttons(
                  onpress: () {
                    var email = emailcontroller.text.trim();
                    var password = passwordcontroller.text.trim();

                    FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: email, password: password)
                        .then((value) {
                      Get.to(const HomeScreen());
                    });
                  },
                  title: 'Login'),
              15.heightBox,
              "Or Create your Account".text.color(Vx.white).make(),
              15.heightBox,
              Buttons(
                  onpress: () {
                    Get.to(() => const SignupScreen());
                  },
                  title: 'Signup'),
            ],
          ),
        ),
      ),
    );
  }
}
