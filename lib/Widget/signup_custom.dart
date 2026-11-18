import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:provider/provider.dart';
import 'package:randumuser/Provider/auth_provider.dart';

class SignupCustom extends StatelessWidget {
  final IconData icon;
  final String text;
  IconButton? suficon;
  TextEditingController controler = TextEditingController();

  new({
    super.key,
    required this.icon,
    required this.text,
    required this.controler,
    this.suficon,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: .center,
        width: 400,
        height: 75,
        child: Consumer<AuthProvider>(
          builder: (context, value, child) => TextFormField(
            obscureText: text == "Password" ? value.isblasabl : false,

            controller: controler,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              prefixIcon: Icon(icon),
              label: Text(text),
              suffixIcon: suficon,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Enter the ${text}";
              }
              if (text == "Password" && value.length < 8) {
                return "Password must be at least 8 characters";
              }
              if (text == "email" && !value.contains("@")) {
                return "Emale must contains @ ";
              }
            },
          ),
        ),
      ),
    );
  }
}
