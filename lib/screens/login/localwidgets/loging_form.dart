import 'package:book_club/screens/home/home.dart';
import 'package:book_club/screens/signup/signup.dart';
import 'package:book_club/states/currentUser.dart';
import 'package:book_club/widgets/our_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OurLoginForm extends StatefulWidget {
  const OurLoginForm({super.key});

  @override
  State<OurLoginForm> createState() => _OurLoginFormState();
}

class _OurLoginFormState extends State<OurLoginForm> {
  TextEditingController _emailContraller = TextEditingController();
  TextEditingController _passwordContraller = TextEditingController();

  void _loginUser(String email, String password, BuildContext context) async{
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);

    try {
      String _returnString = await _currentUser.loginUserWithEmail(email, password);
      if (_returnString == "Success") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(_returnString),
            duration: const Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
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
              "Login",
              style: TextStyle(
                fontSize: 25.0,
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
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
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 100), 
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              // backgroundColor: Colors.blue,
            ),
            onPressed: () {
              _loginUser(_emailContraller.text, _passwordContraller.text,context);
            },
            child: const Text(
              "Login",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TextButton(
            child: const Text("Don't have an account? Sign up"),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context)=>const OurSignup(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
