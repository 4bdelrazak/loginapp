import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/auth_controller.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  


  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    var logos = ["g.png", "t.png", "f.png"];
    var emailController = TextEditingController();
    var passWordController = TextEditingController();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              width: w,
              height: h * 0.3,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("img/signup.png"),
                fit: BoxFit.cover,
              )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.white70,
                    backgroundImage: AssetImage("img/profile.png"),
                  )
                ],
              ),
            ),
            Container(
              width: w,
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            spreadRadius: 7,
                            offset: Offset(1, 1),
                            color: Colors.grey.withOpacity(0.2),
                          )
                        ]),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                          hintText: "Email",
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.amber,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.white)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            spreadRadius: 7,
                            offset: Offset(1, 1),
                            color: Colors.grey.withOpacity(0.2),
                          )
                        ]),
                    child: TextField(
                      controller: passWordController,
                      decoration: InputDecoration(
                          hintText: "Password",
                          prefixIcon: Icon(
                            Icons.password,
                            color: Colors.amber,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.white)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.15,
                  ),
                  GestureDetector(
                    onTap: () {
                      print('hello');
                      // AuthController.instance.register(
                      //     emailController.text.trim(),
                      //     passWordController.text.trim());
                    },
                    child: GestureDetector(
                      onTap: () {
                        var email = emailController.text.trim();
                        var password = passWordController.text.trim();
                        AuthController.instance.register(email, password);
                      },
                      child: Container(
                        width: w * 0.5,
                        height: h * 0.08,
                        child: Center(
                          child: Text(
                            "Sign up",
                            style: TextStyle(
                              fontSize: 36,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            image: DecorationImage(
                              image: AssetImage("img/loginbtn.png"),
                              fit: BoxFit.cover,
                            )),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RichText(
                      text: TextSpan(
                          text: "already have an account? ",
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                          children: [
                        TextSpan(
                            text: "Login",
                            recognizer: TapGestureRecognizer()
                              ..onTap = (() => Get.back()),
                            style: TextStyle(
                                color: Colors.grey[800],
                                fontWeight: FontWeight.bold,
                                fontSize: 16))
                      ])),
                  SizedBox(
                    height: h * 0.08,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Sing up using one of the following methods",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Wrap(
                    children: List.generate(
                        3,
                        (index) => Padding(
                              padding: const EdgeInsets.all(10),
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.amber[100],
                                child: CircleAvatar(
                                  radius: 25,
                                  backgroundImage:
                                      (AssetImage("img/${logos[index]}")),
                                ),
                              ),
                            )),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
