import 'package:challenge1/E-comm/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/auth_controller.dart';
import '../../widgets/button.dart';
import '../../widgets/rounded_contaianer.dart';
import '../../widgets/text_input.dart';
import '../../widgets/glitch.dart';
import '../auth/sign_up_screen.dart';


class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xFFF4F8FB),
      body: Center(
        child: TRoundedContainer(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          radius: 12,
          backgroundColor: Color(0xFFE9F2F9),
          showBorder: true,
          borderColor: Colors.black12,
          width: MediaQuery.of(context).size.width * 0.9,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// Title
              const SizedBox(height: 10),
              GlithEffect(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Get ",
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "Started",
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Please enter your Email & Password to continue",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black87, fontSize: 14,fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 25),

              /// Email Input
              Container(
                child: TextInputField(
                  controller: _emailController,
                  myLabelText: "Email",
                  myIcon: Icons.email,
                ),
              ),

              const SizedBox(height: 20),

              /// Password Input
              Container(
                child: TextInputField(
                  controller: _passwordController,
                  myLabelText: "Password",
                  myIcon: Icons.lock,
                  toHide: true,
                ),
              ),

              const SizedBox(height: 25),

              /// Login Button
              TButton(
                width: double.infinity,
                height: 48,
                text: "LOGIN",
                onTap: () {
                  AuthController.instance.login(
                    _emailController.text,
                    _passwordController.text,
                  );
                },
                backgroundColor: Colors.blueGrey.shade200,
                textColor: Colors.black,
                fontWeight: FontWeight.w900,
                radius: 8,
              ),

              const SizedBox(height: 15),
              const Text(
                "By Confirming, you agree to Terms & Conditions and Privacy Policy.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xFF7A7A7A),
                    fontSize: 11,fontWeight: FontWeight.w800),
              ),

              const SizedBox(height: 20),

              /// Signup Text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Not have any account??"),
                  TextButton(
                    onPressed: () => Get.to(() => SignUpScreen()),
                    child: const Text(
                      "Signup",
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
