import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:textfield_darsi/home_screen.dart';
import 'package:textfield_darsi/sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObsucured = true;
  late TextEditingController nameController;
  late TextEditingController passswordController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    passswordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    passswordController.dispose();
    log("Dispose called in login screen");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text("Ismingizni kiriting"),
            // SizedBox(height: 5),
            TextField(
              controller: nameController,
              onSubmitted: (value) {
                log("OnSubmitted called: $value");
              },
              onChanged: (value) {
                log(value);
              },
              decoration: InputDecoration(
                hintText: "Login",
                prefixIcon: Icon(
                  Icons.person_2_rounded,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: passswordController,
              obscuringCharacter: "*",
              obscureText: isObsucured,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.lock,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    isObsucured ? Icons.visibility : Icons.visibility_off,
                    color: isObsucured ? Colors.grey : Colors.red,
                  ),
                  onPressed: () {
                    setState(() {
                      isObsucured = !isObsucured;
                    });
                  },
                ),
                // label: Text("Ism"),
                // labelText: "Ism",
                hintText: "Password",
                hintStyle: TextStyle(),
                // fillColor: Colors.black54,
                // filled: true,
                // border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 50),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(double.infinity, 50),
                ),
                onPressed: () {
                  log("Name value: ${nameController.text}");
                  log("Password value: ${passswordController.text}");
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(
                        name: nameController.text,
                        password: passswordController.text,
                      ),
                    ),
                  );
                },
                child: Text("Login"),
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => SignUpScreen(),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    "Don't have an account? Sign Up",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
