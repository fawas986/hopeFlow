import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopeflow/login/login.dart';
import 'package:hopeflow/login/signup.dart';

class Welcome_page extends StatefulWidget {
  const Welcome_page({super.key});

  @override
  State<Welcome_page> createState() => _Welcome_pageState();
}

class _Welcome_pageState extends State<Welcome_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFEDEDED),
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
              top: 200,
              left: 70,
              child: Text(
                "Hope Flow",
                style: GoogleFonts.aclonica(
                  textStyle: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
            ),
            Align(
                alignment: Alignment(1,-0.4),
                child: Image(
                  image: AssetImage("assets/images/bg2.png"),
                  fit: BoxFit.contain,
                )),
        Align(
          alignment: Alignment(0, 0.6),
          child: Container(
            height: 72,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildConext) {
                        return Login();
                      }));
                },
                style: ElevatedButton.styleFrom(
                  elevation: 8.0, // Controls shadow depth
                  shadowColor: Colors.red, // Custom shadow color
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  backgroundColor: Color(0xFF7E2124), // Button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0), // Rounded corners
                  ),
                ), child: Text("Login",style: TextStyle(color: Colors.white),),),
            ),
          ),
        ),
            Align(
              alignment: Alignment(0, 0.8),
              child: Container(
                height: 72,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildConext) {
                            return BloodDonationSignUpPage();
                          }));
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 8.0, // Controls shadow depth
                      shadowColor: Colors.red, // Custom shadow color
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      backgroundColor: Colors.blueGrey, // Button color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0), // Rounded corners
                      ),
                    ), child: Text("Signup",style: TextStyle(color: Colors.white),),),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
