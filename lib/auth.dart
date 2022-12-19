import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:medical/forms/sign_in.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.blue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 30),
          const Text(
            "Welcome Back",
            style: TextStyle(
              fontSize: 30,
              color: Colors.white, //
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Lottie.asset("assets/images/doctor.json",
              repeat: true,
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width * 1),
          const Spacer(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: 60,
                vertical: 10,
              ),
              textStyle: const TextStyle(
                fontSize: 15,
              ),
              backgroundColor: Colors.blue,
              elevation: 0,
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>  SignIn(),
                ),
              );
            },
            child: const Text("Sign In"),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 60,
                  vertical: 10,
                ),
                textStyle: const TextStyle(
                  fontSize: 15,
                ),
                backgroundColor: Colors.blue,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(100))),
            onPressed: () {
              print("Sign up");
            },
            child: const Text("Sign Up"),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(elevation: 0),
            onPressed: () {
              print("Forgotten");
            },
            child: const Text("Forgot Password?"),
          ),
        ],
      ),
    );
  }
}
