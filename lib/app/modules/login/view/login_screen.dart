import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:machine_test/app/modules/login/controller/login_controller.dart';
import 'package:machine_test/app/modules/login/widget/button_widget.dart';
import 'package:provider/provider.dart';

import '../../../utils/app_message.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  bool _isPasswordVisible = false;

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final logincontroller = Provider.of<LoginController>(
      context,
      listen: false,
    );

    return Scaffold(
      body: Consumer<LoginController>(
        builder: (context, loginController, child) {
          return Container(
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/image/login.jpg"),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  height: 410,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Text(
                        "Welcome Back !",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 36,
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Email",
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(height: 5),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: TextFormField(
                                style: TextStyle(color: Colors.white),
                                controller: email,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "Email",
                                  labelStyle: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white60),
                                  prefixIcon:
                                      Icon(Icons.person, color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Password",
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(height: 5),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: TextFormField(
                                style: TextStyle(color: Colors.white),
                                controller: password,
                                obscureText: !_isPasswordVisible,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "Password",
                                  labelStyle: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white60),
                                  prefixIcon:
                                      Icon(Icons.key_off, color: Colors.white),
                                       suffixIcon: IconButton( // Add suffix icon
                                    icon: Icon(
                                      _isPasswordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.white60,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _isPasswordVisible = !_isPasswordVisible;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Spacer(),
                      ButtonWidget(
                        onPressed: () async {
                          if (email.text.trim().isEmpty ||
                              password.text.trim().isEmpty) {
                            AppMessage.showMessage(
                              backgroundColor: Colors.red,
                              text: 'Please fill in both email and password.',
                            );
                            return;
                          }

                          await logincontroller.login(context, email, password);
                        },
                        buttonText: "Sign In",
                        horizontal: 100,
                        vertical: 14,
                        buttonTextColor: Colors.white,
                        color: Colors.black,
                        color1: Colors.blue.shade900,
                        color2: Color(0xff314CA3),
                        color3: Color(0xff314CA3),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
