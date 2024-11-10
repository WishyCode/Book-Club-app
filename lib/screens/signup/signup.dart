import 'package:book_club/screens/signup/localwidgets/signup_form.dart';
import 'package:flutter/material.dart';

class OurSignup extends StatelessWidget {
  const OurSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20.0),
              children: <Widget>[
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    BackButton(),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child:Image.asset("assets/Logo.png",width: 150,height: 150,)                   
                ),
                const OurSignupForm(),
            ],
          ))
        ],
      ),
    );
  }
}