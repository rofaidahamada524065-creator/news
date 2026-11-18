import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:randumuser/Provider/auth_provider.dart';
import 'package:randumuser/Screen/news_screen.dart';
import 'package:randumuser/Screen/signup.dart';
import 'package:randumuser/Widget/signup_custom.dart';

class Login extends StatelessWidget {
  new({super.key});
  TextEditingController password = TextEditingController();
  final GlobalKey<FormState> key = GlobalKey();
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final object = context.read<AuthProvider>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 216, 112, 146),
        centerTitle: true,
        title: Text(
          "Login",
          style: TextStyle(color: Colors.white, fontWeight: .bold),
        ),
      ),
      body: Consumer<AuthProvider>(
        builder: (context, value, child) => Form(
          key: key,
          child: Column(
            crossAxisAlignment: .center,
            mainAxisAlignment: .center,
            children: [
              Text(
                "Login",
                style: TextStyle(
                  color: const Color.fromARGB(255, 218, 32, 94),
                  fontSize: 50,
                ),
              ),
              SignupCustom(icon: Icons.email, text: "email", controler: email),
              SignupCustom(
                icon: Icons.lock,
                text: "Password",
                controler: password,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (key.currentState!.validate()) {
                    await value.Requestlogin(
                      password: password.text,
                      email: email.text,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Center(
                          child: Text(
                            "${object.user!.Massege}",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        backgroundColor: const Color.fromARGB(
                          255,
                          230,
                          133,
                          165,
                        ),
                      ),
                    );
                    if (value.user!.statuse == true) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NewsScreen()),
                      );
                    }
                  }
                },
                child: Text("Login"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 223, 105, 144),
                ),
              ),
              Row(
                crossAxisAlignment: .center,
                mainAxisAlignment: .center,
                children: [
                  Text("Don't have account"),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Signup()),
                      );
                    },
                    child: Text("SignUp", style: TextStyle(color: Colors.pink)),
                    style: TextButton.styleFrom(
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(20),
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
