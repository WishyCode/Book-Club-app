import 'package:book_club/screens/login/login.dart';
import 'package:book_club/states/currentUser.dart';
import 'package:book_club/widgets/our_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OurSignupForm extends StatefulWidget {
  const OurSignupForm({super.key});

  @override
  State<OurSignupForm> createState() => _OurSignupFormState();
}

class _OurSignupFormState extends State<OurSignupForm> {
  TextEditingController _fullNameContraller = TextEditingController();
  TextEditingController _emailContraller = TextEditingController();
  TextEditingController _passwordContraller = TextEditingController();
  TextEditingController _confirmPasswordContraller = TextEditingController();

  void _signUpUser(String email, String password, BuildContext context) async{
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);  

    try{
      if (await _currentUser.signUpUser(email, password)) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const OurLogin()),
        );
      }
    } catch(e) {
      print(e);
    }

   }
  @override
  Widget build(BuildContext context) {
    return OurContainer(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 8.0,
            ),
            child: Text(
              "Signup",
              style: TextStyle(
                fontSize: 25.0,
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TextFormField(
            controller: _fullNameContraller,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.person_outline),
              hintText: "Full Name",
            ),
          ),
          const SizedBox(height: 20.0),
          TextFormField(
            controller: _emailContraller,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.alternate_email),
              hintText: "Email",
            ),
          ),
          const SizedBox(height: 20.0),
          TextFormField(
            controller: _passwordContraller,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.lock_outline),
              hintText: "Password",
            ),
            obscureText: true,
          ),
          const SizedBox(height: 20.0),
          TextFormField(
            controller: _confirmPasswordContraller,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.lock_outline),
              hintText: "Confirm Password",
            ),
            obscureText: true,
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 100), 
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              // backgroundColor: Colors.blue,
            ),
            
            child: const Text(
              "Signup",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              // Check if passwords match
              if (_passwordContraller.text != _confirmPasswordContraller.text) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Passwords do not match"),
                    duration: Duration(seconds: 2),
                  ),
                );
              } 
              // Check password length
              else if (_passwordContraller.text.length < 6) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Password must be at least 6 characters long"),
                    duration: Duration(seconds: 2),
                  ),
                );
              } 
              // If password is valid, attempt signup
              else {
                _signUpUser(_emailContraller.text, _passwordContraller.text, context);
              }
            },
          ),
         
        ],
      ),
    );
  }
}
