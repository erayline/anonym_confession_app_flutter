import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/components/button.dart';
import 'package:flutter_application_1/components/text_field.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  String sonuc="";
  Future<void> signIn() async {
    showDialog(context: context, builder: (context) => const Center(child: CircularProgressIndicator(),));

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailTextController.text,
          password: passwordTextController.text);

      //pop dialog
      if(context.mounted) Navigator.pop(context);
        
    } on FirebaseAuthException catch (e) {
      if(context.mounted) Navigator.pop(context);
      print(e.code);
      setState(() {
        sonuc = "Please try again.";
      });
    }
  }

  void displayMessage(String message) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 41, 41, 45),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              //logo
              Icon(
                Icons.lock_person,
                size: 70,
              ),
              SizedBox(
                height: 20,
              ),

              //text
              Text(
                'Hi, so you want to speak freely too?',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: 20,
              ),

              //email
              MyTextField(
                  controller: emailTextController,
                  hintText: 'email',
                  obscureText: false),
              SizedBox(
                height: 10,
              ),

              //password
              MyTextField(
                  controller: passwordTextController,
                  hintText: 'Password',
                  obscureText: true),
              SizedBox(
                height: 12,
              ),
              Text(sonuc.toString(),style: TextStyle(color: Colors.red),),
              
              SizedBox(
                height: 12,
              ),

              //sign in button
              MyButton(
                  text: "Log In",
                  onTap: () {
                    signIn();
                  }),

              SizedBox(
                height: 20,
              ),

              //register page
              GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    'Sign UP',
                    style: TextStyle(
                        color: Colors.white70, fontWeight: FontWeight.w600),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
