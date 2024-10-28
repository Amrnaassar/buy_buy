import 'package:buy_buy/screens/signup_screen.dart';
import 'package:buy_buy/screens/Home_screen.dart';

import 'package:buy_buy/utils/components/round_button.dart';
import 'package:buy_buy/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/components/custom_logo.dart';

class LogintScreen extends StatelessWidget {
   LogintScreen({super.key});
  static String id = 'LoginScreen';
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
                    onChanged: (value){email=value;},
                    validator: emaildValidator.call,

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
                    onChanged: (value){password=value;},
                    validator: passwordValidator.call,

                    decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your password',
                      prefixIcon: Icon(Icons.lock),
                    ),
                  ),
                ),
                SizedBox(height: h * .03),
                RoundButton(
                  colour: Colors.black,
                  text: 'Login',
                  onpressed: ()async {

                    Navigator.pushNamed(context, HomeScreen.id);

                    if (_globalKey.currentState?.validate() == true) {
                      try{
                        final newUser =await _auth.signInWithEmailAndPassword(
                            email: email, password: password);
                        if(newUser!=null)
                        {
                          //Navigator.pushNamed(context, SignupScreen.id);
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Dont have an account? ',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, SignupScreen.id);
                        },
                        child: const Text(
                          'Sing Up',
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 18),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
