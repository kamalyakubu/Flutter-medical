import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:intl/intl.dart';
import 'package:medical/forms/sign_in.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _dateController = TextEditingController();

  String? gender = "male";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        elevation: 0,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(
                  height: 70,
                ),
                const Text(
                  "Create Account",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    decoration: TextDecoration.underline
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Provide Name";
                    }
                    return null;
                  },
                  controller: _nameController,
                  maxLines: 1,
                  keyboardType: TextInputType.name,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Your FullName",
                    labelStyle: const TextStyle(color: Colors.white60),
                    suffixIcon: const Icon(
                      Icons.person,
                      color: Colors.white70,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),


                CSCPicker(
                  layout: Layout.vertical,
                  onCountryChanged: (value) {
                    
                  },

                  onStateChanged: (value) {

                  },

                  onCityChanged: (value) {
                    
                  },
                ),

                const SizedBox(height: 20,),


                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Provide Date of Birth";
                    }
                    return null;
                  },
                  //Get Calender to select birth date
                  onTap: () async{
                    DateTime? selectedDate = await showDatePicker(
                      context: context, 
                      initialDate: DateTime.now(), 
                      firstDate: DateTime(1920), 
                      lastDate: DateTime(2099));

                      if(selectedDate != null){
                        setState(() {
                          _dateController.text = DateFormat("dd/MM/yyyy").format(selectedDate);
                        });
                      }
                  },
                  controller: _dateController,
                  keyboardType: TextInputType.name,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Date of Birth",
                    labelStyle: const TextStyle(color: Colors.white60),
                    suffixIcon: const Icon(
                      Icons.calendar_today,
                      color: Colors.white70,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),


                 const Text("What is your gender?", style: TextStyle( 
                    fontSize: 18
                ),),

                const Divider(),
                
                ListTile(
                  leading: Radio(
                  value: "male", 
                  groupValue: gender, 
                  onChanged: (value) {
                    setState(() {
                      gender = value;
                    });
                  },
                  ),
                  title: Text("Male"),
                ),

                ListTile(
                  leading: Radio(
                  value: "female", 
                  groupValue: gender, 
                  onChanged: (value) {
                    setState(() {
                      gender = value;
                    });
                  },
                  ),
                  title: Text("Female"),
                ),

                

                const SizedBox(
                  height: 20,
                ),


                TextFormField(
                  validator: (value) {
                    String exp =
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

                    RegExp regExp = RegExp(exp);

                    if (value!.isEmpty || !regExp.hasMatch(value)) {
                      return "Provide Valid Email Address";
                    }
                    return null;
                  },
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: const TextStyle(color: Colors.white60),
                    suffixIcon: const Icon(
                      Icons.mail,
                      color: Colors.white70,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password cannot be empty";
                    }
                    return null;
                  },
                  controller: _passwordController,
                  obscureText: true,
                  maxLength: 16,
                  maxLines: 1,
                  minLines: 1,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    counterStyle: const TextStyle(color: Colors.white),
                    labelText: "Password",
                    labelStyle: const TextStyle(color: Colors.white60),
                    suffixIcon: const Icon(
                      Icons.security,
                      color: Colors.white70,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 80,
                      vertical: 15,
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
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        backgroundColor: Colors.green,
                        duration: Duration(seconds: 3),
                        content: Text("Processing. Please wait"),
                      ));
                    }
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?",
                        style: TextStyle(color: Colors.white70)),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(elevation: 0),
                      onPressed: () {
                        print("Already have account");
                      },
                      child: GestureDetector(
                        onTap:() {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SignIn()));
                        },
                        child: const Text(
                          "Sign In",
                          style: TextStyle(
                              fontSize: 12,
                              decoration: TextDecoration.underline,
                              color: Colors.yellowAccent),
                        ),
                      ),
                    ),
                  ],
                ),
                const Text(
                  "Sign up with:",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: FlutterSocialButton(
                        mini: true,
                        buttonType: ButtonType.facebook,
                        onTap: () {},
                      ),
                    ),
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: FlutterSocialButton(
                        mini: true,
                        buttonType: ButtonType.google,
                        onTap: () {},
                      ),
                    ),
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: FlutterSocialButton(
                        mini: true,
                        buttonType: ButtonType.linkedin,
                        onTap: () {},
                      ),
                    ),
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: FlutterSocialButton(
                        mini: true,
                        buttonType: ButtonType.twitter,
                        onTap: () {},
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
