import 'package:flutter/material.dart';
import 'package:hopeflow/dashboard.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formkey=GlobalKey<FormState>();
  TextEditingController nameclr=TextEditingController();
  TextEditingController passclr=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formkey,
        child: Stack(
          children: [
            Container(
              color: Colors.black.withOpacity(0.3),
            ),
            Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome Back',
                      style: TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 40.0),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Username',
                        labelStyle: TextStyle(color: Colors.white70),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.1),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.white70,
                        ),
                      ),
                      validator: (value) {
                        if (value!.length == 0) {
                          return "must fill";
                        } else {
                          return null;
                        }
                      },
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.white70),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.1),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.white70,
                        ),
                      ),
                      validator: (value) {
                        if (value!.length == 0) {
                          return "must fill";
                        } else {
                          return null;
                        }
                      },
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 10,),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Text("Forgot Password ?",style: TextStyle(color: Color(0xFF7E2124)),)),
                    SizedBox(height: 10.0),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (BuildConext) {
                                return HomePage();
                              }));}
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF7E2124),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 15.0),
                        ),
                        child: Text(
                          'Log In',
                          style: TextStyle(fontSize: 18.0,color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Dont have account ?",style: TextStyle(color: Colors.white),),
                        SizedBox(width: 10,),
                        InkWell(

                            child: Text("Sign up",style: TextStyle(color: Color(0xFF7E2124)),))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
