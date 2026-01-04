import 'package:flutter/material.dart';
import 'package:practices101/pages/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final username = TextEditingController();
  final password = TextEditingController();

  bool isObscure = true;
  String Message = '';

  void showMessage(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 1),
        content: Text(message),
        backgroundColor: color,
      ),
    );
  }

  void ValidateLogin() {
    setState(() {
      if (username.text.isEmpty || password.text.isEmpty) {
        showMessage("Please fill all the fields", Colors.red);
      } else if (username.text != "admin" || password.text != "admin") {
        showMessage("Invalid Credentials!", Colors.red);
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return Home();
            },
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    username.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // LOGO
            Image(image: AssetImage('assets/flutter-logo.png'), height: 100),
            // Input Fields
            SizedBox(height: 20),
            // Username Field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: TextField(
                controller: username,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: 'Username',
                  hintText: 'Enter your username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            // Password Field
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 10,
              ),
              child: TextField(
                obscureText: isObscure,
                controller: password,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                    icon: Icon(
                      isObscure ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            // Container(
            //   padding: const EdgeInsets.symmetric(
            //     horizontal: 40.0,
            //     vertical: 2,
            //   ),
            //   alignment: Alignment.topLeft,
            //   child: Text(
            //     Message,
            //     style: TextStyle(color: Colors.red, fontSize: 18),
            //   ),
            // ),
            // Login Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: ValidateLogin,
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
