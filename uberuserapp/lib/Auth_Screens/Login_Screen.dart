// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:uberuserapp/const/dep.dart';
import '../const/Button.dart';
import '../const/CustomTextfields.dart';
import 'Signup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              Customtextfields(hinttext: 'Email'),
              10.heightBox,
              Customtextfields(hinttext: 'Password'),
              20.heightBox,
              Buttons(onpress: () {}, title: 'Login'),
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
