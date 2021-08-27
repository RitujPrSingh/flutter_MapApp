import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:map_assignment/login_page/sign_in/sign_in_button.dart';
import 'package:map_assignment/login_page/sign_in/social_sign_in_button.dart';
import 'package:map_assignment/services/Auth.dart';

import 'email_sign_in_page.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key key, @required this.auth}) : super(key: key);
  final AuthBase auth;

  Future<void> _signInAnonymously() async {
    try {
      await auth.signInAnonymously();
    } catch (e) {
      print(e.toString());
    }
  }
  Future<void> _signInWithGoogle() async {
    try {
      await auth.signInWithGoogle();
    } catch (e) {
      print(e.toString());
    }
  }

  void _signInWithEmail(BuildContext context){
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        fullscreenDialog: true,
        builder: (context) => EmailSignInPage(auth: auth),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      

        body: _buildContent(context),
        backgroundColor: Colors.white
    );
  }

  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset("images/hey.png", fit: BoxFit.cover,),
          SizedBox(
            height: 90.0,
          ),
          Text(
            'Sign-In',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
            ),),


          SizedBox(height: 50.0),
          SocialSignInButton(
            assetName: 'images/google-logo.png',
            text: 'Sign in with google',
            textColor: Colors.black87,
            color: Colors.white,
            onPressed: _signInWithGoogle,
          ),
          SizedBox(height: 8.0),

          SignInButton(
            text: 'Sign in with email',
            textColor: Colors.white,
            color: Colors.teal[600],
            onPressed: () => _signInWithEmail(context),
          ),
          SizedBox(height: 8.0),
          Text(
            'or',
            style: TextStyle(fontSize: 14.0, color: Colors.black87),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.0),
          SignInButton(
            text: 'Guest Mode',
            textColor: Colors.black,
            color: Colors.lime[400],
            onPressed: _signInAnonymously,
          ),
        ],
      ),
    ),);
  }
}
