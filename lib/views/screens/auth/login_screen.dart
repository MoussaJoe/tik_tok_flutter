import 'package:flutter/material.dart';
import 'package:tik_tok_flutter/constants.dart';
import 'package:tik_tok_flutter/views/screens/auth/signup_screen.dart';
import 'package:tik_tok_flutter/views/widgets/text_input_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
          height: 25,
        ),
        Text(
          "Login",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
        ),
        const SizedBox(
          height: 25,
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
          height: 25,
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
          height: 25,
        ),
        InkWell(
          onTap: (() {
            authController.loginUSer(
                _emailController.text, _passwordController.text);
          }),
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width - 40,
            height: 50,
            decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: const BorderRadius.all(Radius.circular(5))),
            child: const Text(
              "Login",
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
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SignupScreen(),
                ));
              },
              child: Text(
                " register",
                style: TextStyle(fontSize: 18, color: buttonColor),
              ),
            )
          ],
        )
      ]),
    ));
  }
}
