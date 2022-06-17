import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tik_tok_flutter/constants.dart';
import 'package:tik_tok_flutter/controllers/auth_controller.dart';
import 'package:tik_tok_flutter/views/screens/auth/login_screen.dart';
import 'package:tik_tok_flutter/views/widgets/text_input_field.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _usernameController = TextEditingController();

  File? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "Tik Tok",
            style: TextStyle(
                fontSize: 35, color: buttonColor, fontWeight: FontWeight.w900),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Register",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
          ),
          const SizedBox(
            height: 15,
          ),
          Stack(
            children: [
              CircleAvatar(
                radius: 64,
                backgroundImage: NetworkImage(
                    "https://logo-all.ru/uploads/posts/2016-05/0_real_madrid_cf_symbol.jpg"),
              ),
              Positioned(
                  bottom: -10,
                  left: 80,
                  child: IconButton(
                    onPressed: () {
                      authController.pickImage();
                    },
                    icon: Icon(Icons.add_a_photo_sharp),
                  ))
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: TextInputField(
                controller: _usernameController,
                labelText: "Username",
                icon: Icons.person),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: TextInputField(
              controller: _emailController,
              labelText: "Email",
              icon: Icons.email,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: TextInputField(
              controller: _passwordController,
              labelText: "Password",
              icon: Icons.lock,
              isObscure: true,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: (() {
              authController.registerUser(
                  _usernameController.text,
                  _emailController.text,
                  _passwordController.text,
                  authController.ProfilePhoto);
            }),
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width - 40,
              height: 50,
              decoration: BoxDecoration(
                  color: buttonColor,
                  borderRadius: const BorderRadius.all(Radius.circular(5))),
              child: const Text(
                "Register",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account ? ",
                style: TextStyle(fontSize: 20),
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  " Login",
                  style: TextStyle(fontSize: 18, color: buttonColor),
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}
