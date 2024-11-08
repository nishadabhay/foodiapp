import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodies/user_auth/firbase_auth_implementation/firebase_auth_service.dart';

class Myregisterpage extends StatefulWidget {
  const Myregisterpage({super.key});

  @override
  State<Myregisterpage> createState() => _MyregisterpageState();
}

class _MyregisterpageState extends State<Myregisterpage> {
  final FirebaseAuthService _auth = FirebaseAuthService();

  bool _isRememberMeChecked = false;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose

    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Container(
          
          child: Padding(
            padding: const EdgeInsets.only(left: 30,right: 30,top: 70),
            child: Column(
            
              children: [
                Image(image: AssetImage("assets/images/filed.png")),
                Text("Register Page",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.deepOrange),),
                SizedBox(height: 30,),
            
                TextField(
                  controller: _nameController,
            
                  decoration: InputDecoration(
                      labelText: "Name",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),),
                SizedBox(height: 20,),
            
                TextField(
            controller: _emailController,
                  decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),),
                SizedBox(height: 20,),
            
                TextField(
                  controller: _passwordController,
                  obscureText: true,
            
                  decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),),
                SizedBox(height: 20,),
                TextField(
                  obscureText: true,

                  decoration: InputDecoration(
                      labelText: "ConfirmPassword",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),),
                SizedBox(height: 20,),
            
                TextField(
            
                  decoration: InputDecoration(
                      labelText: "PhoneNumber",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),),
                SizedBox(height: 20,),
            
            
              ElevatedButton(onPressed: _register, child: Center(child: Text("Register",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),)),style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange),),
            
            
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _register()async{
    String name = _nameController.text;
    String email = _emailController.text;
    String password = _passwordController as String;

    User? user = await _auth.signUpWithEmailandPassword(email, password);

    if(user != null){

      print("User is successfully created");
      Navigator.pushNamed(context, "/home");
    }else{
      print("Some error happen");
    }

  }
}
