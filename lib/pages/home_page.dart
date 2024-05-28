import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/text_field.dart';
import 'package:flutter_application_1/components/wall_post.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void signOut() {
    FirebaseAuth.instance.signOut();
  }
  
  void postText() {
    if(textController.text.length>5){
  
      String day_month_year = Timestamp.now().toDate().day.toString()+"/"+Timestamp.now().toDate().month.toString()+"/"+Timestamp.now().toDate().year.toString();

      FirebaseFirestore.instance.collection("UserPosts").add({
        'UserEmail': currentUser.email,
        'Message': textController.text,
        'TimeStamp':day_month_year,
      }
      );
        textController.text = "";
    }
  }
  final currentUser = FirebaseAuth.instance.currentUser!;
  final textController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 5, 4, 27),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 3, 2, 19),
        foregroundColor: Colors.white,
        title: Text('ISTUN'),
        actions: [
          //sign out
          IconButton(onPressed: signOut, icon: Icon(Icons.exit_to_app))
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            //the wall

            Expanded(
                child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("UserPosts")
                  .orderBy("TimeStamp", descending: true,)
                  // .where('UserEmail', isEqualTo: "erayeray@gmail.com")
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        //get the message
                        final post = snapshot.data!.docs[index];

                        return WallPost(
                            message: post['Message'], user: post['UserEmail'], color: Color.fromARGB(36, 255, 255, 255), anonimColor: Colors.red, time: post['TimeStamp'].toString(),);
                      });
                } else if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                }

                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            )),

            //post message
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: MyTextField(
                          controller: textController,
                          hintText: "Share anonimously.. (min 5 letter)",
                          obscureText: false)),
                  IconButton(
                      onPressed: postText, icon: Icon(Icons.arrow_upward))
                ],
              ),
            ),

            //logged in as
          ],
        ),
      ),
    );
  }
}
