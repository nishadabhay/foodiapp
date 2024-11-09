import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foodies/HomeScreens/home_page.dart';

import '../Utils/Utilities.dart';

class Myregisterpage extends StatefulWidget {
  const Myregisterpage({super.key});

  @override
  State<Myregisterpage> createState() => _MyregisterpageState();
}

class _MyregisterpageState extends State<Myregisterpage> {
  // bool _isRememberMeChecked = false;
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;
@override
  void dispose() {

    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 70),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: _formKey,
                  child: Column(
                children: [
                  Image(image: AssetImage("assets/images/filed.png")),
                  Text(
                    "Register Page",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        labelText: "Name",
                        prefixIcon: Icon(Icons.sensor_occupied),
                        border: OutlineInputBorder(
          
                            borderRadius: BorderRadius.circular(10))),
                  ),
          
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    decoration:  InputDecoration(
                        labelText: "Email",
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    validator: (value){
                      if(value!.isEmpty){
                        return "Enter your email";
                      }else{
                        return null;
                      }
                    },
                  ),
          
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: "Password",
                        prefixIcon: Icon(Icons.password),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
// Validation---------------------------------------------
                    validator: (value){
                      if(value!.isEmpty){
                        return "Enter your password";
                      }else{
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: "ConfirmPassword",
                        prefixIcon: Icon(Icons.password),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        labelText: "PhoneNumber",
                        prefixIcon: Icon(Icons.phone),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if(_formKey.currentState!.validate()){
                        setState(() {
                          loading = true;
                        });
                        _auth.createUserWithEmailAndPassword(
                            email: _emailController.text.toString(),
// Error handling .then se ---------------all code in utils folder
                            password: _passwordController.text.toString()).then((value){

                        }).onError((error, stackTrace){
                          Utils().toastMessage(error.toString());
                          setState(() {
                            loading = false;
                          });
                        });

                      }

                    },
                    child: Center(

                        child: loading ?  CircularProgressIndicator(strokeWidth: 3, color: Colors.white,): Text(
                      "Register",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange),
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
