import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/button.dart';
import 'package:flutter_application_1/components/text_field.dart';

class SignUpPage extends StatefulWidget {
  final Function()? onTap;
  const SignUpPage({super.key,required this.onTap});

  @override
  State<SignUpPage> createState() => _SignUpState();
}

class _SignUpState extends State<SignUpPage> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  String sonuc ="";

  @override
  Widget build(BuildContext context) {

    Future<void> signUp() async {
      showDialog(context: (context), builder: (context) => const  Center(child: CircularProgressIndicator(),));

      try{
        await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailTextController.text, password: passwordTextController.text);
        if(context.mounted) Navigator.pop(context);
      } on FirebaseAuthException catch (e){
        Navigator.pop(context);
        setState(() {
          sonuc = e.code;
        });
      }

    }

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 41, 41, 45),
      body: ListView(
        children: [Center(
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
                  height: 10,
                ),
                Text(sonuc),
                SizedBox(
                  height: 10,
                ),
        
                //sign un button
                MyButton(text: "Sign UP", onTap: signUp),
                SizedBox(
                  height: 20,
                ),
        
                //register page
                GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.white70, fontWeight: FontWeight.w600),
                    ))
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
