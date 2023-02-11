import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:openai_test/screens/chat.dart';
import 'package:openai_test/screens/sign_in.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('OpenAI Test'),
      //   systemOverlayStyle: const SystemUiOverlayStyle(
      //     statusBarColor: Colors.red,
      //     statusBarBrightness: Brightness.light,
      //     statusBarIconBrightness: Brightness.dark,
      //   ),
      // ),
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if (!snapshot.hasData) {
            return const SignIn();
          } else {
            return Center(
              child: Chat(imagePath: snapshot.data!.photoURL!),
              // Column(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Text("${snapshot.data!.displayName}님 반갑습니다."),
              //     TextButton(
              //       child: const Text("로그아웃"),
              //       onPressed: () {
              //         // FirebaseAuth.instance.signOut();
              //         _googleService.signOutWithGoogle();
              //       },
              //     ),
              //   ],
              // ),
            );
          }
        },
      ),
    );
  }
}
