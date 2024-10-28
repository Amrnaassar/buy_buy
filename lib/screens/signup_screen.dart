
import 'package:buy_buy/screens/login_screen.dart';
import 'package:buy_buy/utils/components/custom_logo.dart';
import 'package:buy_buy/utils/components/round_button.dart';
import 'package:buy_buy/utils/constants.dart';
import 'package:buy_buy/utils/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignupScreen extends StatelessWidget {
   SignupScreen({super.key});
  static String id ='SignupScreen';
   final _globalKey = GlobalKey<FormState>();
   final _auth=FirebaseAuth.instance;
  late String email , password;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: kSecondColor,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: h * 0.2),
          child: Form(
            key: _globalKey,
            child: ListView(
              //   mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CustomLogo(),
                SizedBox(height: h * .05),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.1),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter  Name';
                      }
                      return null;
                    },
                    decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your Name',
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                ),
                SizedBox(height: h * .03),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.1),
                  child: TextFormField(
                    onChanged: (value){
                      email=value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter  email';
                      }
                      return null;
                    },
                    decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your email',
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                ),
                SizedBox(height: h * .03),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.1),
                  child: TextFormField(
                    obscureText: true,
                    onChanged: (value){
                      password=value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter  password';
                      }
                      return null;
                    },
                    decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your password',
                      prefixIcon: Icon(Icons.lock),
                    ),
                  ),
                ),
                SizedBox(height: h * .03),
                RoundButton(
                  colour: Colors.black,
                  text: 'Sign Up',
                  onpressed: () async {

                    if (_globalKey.currentState?.validate() == true) {
                      try{
                        final newUser=await _auth.createUserWithEmailAndPassword(email: email
                            , password: password);
                        if(newUser!=null)
                        {
                          Navigator.pushNamed(context, LogintScreen.id);
                        }
                       ;
                      }
                     on FirebaseAuthException catch(e){
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.white,
                            content: Text(e.message.toString(),style: TextStyle(color: Colors.red),),
                            duration: Duration(seconds: 2),

                          ),
                        );
                      }


                    }
                  },
                ),
                SizedBox(height: h * .03),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
