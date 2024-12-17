import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/pages/login/login_screen.dart';
import 'package:news/pages/register/dialog_utils.dart';

import '../../model/validation.dart';
import 'custom_form_field.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = "register";

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmpasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  String? selectedGender; // To store the selected gender (Male or Female)

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      alignment: Alignment.topCenter,
      decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage("assets/images/pattern.png"),
            fit: BoxFit.fill,
          )),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff39A552),
          title: Text("Register",
              style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const Image(image: AssetImage("assets/images/logo.png")),
                  SizedBox(
                    height: height * 0.07,
                  ),
                  CustomFormField(
                    controller: nameController,
                    Validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return "Please Enter Your Name";
                      }
                      return null;
                    },
                    title: "Name",
                    textInputType: TextInputType.name,
                  ),
                  CustomFormField(
                    controller: emailController,
                    Validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return "Please Enter E-mail Address";
                      }
                      if (!Validation.isvalid(text)) {
                        return "Please enter a valid email";
                      }
                      return null;
                    },
                    title: "E-mail Address",
                    textInputType: TextInputType.emailAddress,
                  ),
                  CustomFormField(
                    controller: passwordController,
                    Validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return "Please Enter password";
                      }
                      if (text.length < 8) {
                        return "Password must be at least 8 characters";
                      }
                      return null;
                    },
                    title: "Password",
                    textInputType: TextInputType.text,
                    isSecure: true,
                  ),
                  CustomFormField(
                    controller: confirmpasswordController,
                    Validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return "Please confirm password";
                      }
                      if (passwordController.text != text) {
                        return "Passwords do not match";
                      }
                      return null;
                    },
                    title: "Confirm Password",
                    textInputType: TextInputType.text,
                    isSecure: true,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Gender:",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 20),
                      Row(
                        children: [
                          Radio<String>(
                            activeColor: const Color(0xff39A552),
                            value: "Male",
                            groupValue: selectedGender,
                            onChanged: (value) {
                              setState(() {
                                selectedGender = value;
                              });
                            },
                          ),
                          const Text("Male"),
                        ],
                      ),
                      Row(
                        children: [
                          Radio<String>(
                            activeColor: const Color(0xff39A552),
                            value: "Female",
                            groupValue: selectedGender,
                            onChanged: (value) {
                              setState(() {
                                selectedGender = value;
                              });
                            },
                          ),
                          const Text("Female"),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff39A552),
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 100),
                    ),
                    onPressed: () {
                      register();
                    },
                    child: Text(
                      "Register",
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, LoginScreen.routeName);
                      },
                      child: const Text("Already have an account?"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  FirebaseAuth authservice = FirebaseAuth.instance;

  void register() async {
    if (formKey.currentState?.validate() == false) {
      return;
    }
    if (selectedGender == null) {
      DialogUtils.ShowMessage(context, "Please select your gender");
      return;
    }
    DialogUtils.ShowLoadingDialog(context, 'Loading...');
    try {
      await authservice.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      DialogUtils.hideDialog(context);
      DialogUtils.ShowMessage(context, 'Success');
      Navigator.pushNamed(context, LoginScreen.routeName);
    } on FirebaseAuthException catch (e) {
      DialogUtils.hideDialog(context);
      String errorMessage = 'Something went wrong.';
      if (e.code == 'weak-password') {
        errorMessage = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'The account already exists for that email.';
      }
      DialogUtils.ShowMessage(context, errorMessage, postActionName: 'OK');
    } catch (e) {
      DialogUtils.hideDialog(context);
      DialogUtils.ShowMessage(
        context,
        'Something went wrong.',
        postActionName: 'Cancel',
        nagActionName: 'Try Again',
        nagAction: () {
          register();
        },
      );
    }
  }
}
