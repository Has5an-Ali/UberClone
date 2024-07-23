import 'package:uberuserapp/const/dep.dart';
import '../const/Button.dart';
import '../const/CustomTextfields.dart';
import '../methods/checkinternet.dart';
import 'Login_Screen.dart';
import 'RegisterService.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController fullname = TextEditingController();
    TextEditingController email = TextEditingController();

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
              Customtextfields(controller: fullname, hinttext: 'Full Name'),
              10.heightBox,
              Customtextfields(controller: email, hinttext: 'Email'),
              10.heightBox,
              Customtextfields(hinttext: 'Password'),
              10.heightBox,
              Customtextfields(hinttext: 'Confirm Password'),
              20.heightBox,
              Buttons(
                  onpress: () {
                    checkInternet(context);
                    SignUp();
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
