import 'dart:developer';

import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool isObsucureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                CustomTextFormField(
                  hintText: "Full Name",
                  prefixIcon: Icons.person,
                ),
                SizedBox(height: 10),
                CustomTextFormField(
                  hintText: "Email",
                  prefixIcon: Icons.email,
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(height: 10),
                CustomTextFormField(
                  hintText: "Password",
                  prefixIcon: Icons.lock,
                  textInputType: TextInputType.visiblePassword,
                  isObsucured: isObsucureText,
                  suffixIcon: Icons.visibility,
                ),
                SizedBox(height: 10),
                CustomTextFormField(
                  hintText: "Confirm Password",
                  prefixIcon: Icons.lock,
                  textInputType: TextInputType.visiblePassword,
                  isObsucured: isObsucureText,
                  suffixIcon: Icons.visibility,
                ),
                SizedBox(height: 50),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFBB84E8),
                    ),
                    onPressed: () {
                      _formKey.currentState?.validate();
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

class CustomTextFormField extends StatefulWidget {
  final String hintText;
  final IconData prefixIcon;
  bool isObsucured;
  IconData? suffixIcon;
  TextInputType? textInputType;
  CustomTextFormField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    this.isObsucured = false,
    this.suffixIcon,
    this.textInputType,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // validator: (value) {
      //   if (value != null && value.isEmpty) {
      //     return "Please enter your ${widget.hintText}";
      //   } else {
      //     if (widget.hintText.toLowerCase() == "email" &&
      //         !value!.contains("@")) {
      //       return "Please enter correct email address";
      //     }
      //     if (widget.hintText != "Email" && value!.length < 6) {
      //       return "${widget.hintText} must contains at least 6 characters";
      //     }
      //   }

      //   return null;
      // },
      keyboardType: widget.textInputType,
      obscureText: widget.isObsucured,
      cursorHeight: 20,
      cursorColor: Color(0xFFB175FF),
      cursorWidth: 2,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(
              widget.isObsucured ? Icons.visibility_off : widget.suffixIcon),
          onPressed: () {
            setState(() {
              widget.isObsucured = !widget.isObsucured;
            });
            log("Is obsucure: ${widget.isObsucured}");
          },
        ),
        prefixIcon: Icon(
          widget.prefixIcon,
          color: Color(0xFFB175FF),
        ),
        hintText: widget.hintText,
        hintStyle: TextStyle(fontSize: 14),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Color(0xFFB175FF),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            width: 2,
            color: Color(0xFFB175FF),
          ),
        ),
      ),
    );
  }
}
