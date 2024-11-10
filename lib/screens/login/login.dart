import 'package:book_club/screens/login/localwidgets/loging_form.dart';
import 'package:flutter/material.dart';

class OurLogin extends StatelessWidget {
  const OurLogin({super.key});

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
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child:Image.asset("assets/Logo.png") 
                ),
                const SizedBox(height: 20.0,),
                const OurLoginForm(),
            ],
          ))
        ],
      ),
    );
  }

}