// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hopeflow/dbhealper.dart';
import 'package:hopeflow/intro.dart';
import 'package:hopeflow/register.dart';
import 'package:hopeflow/user.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Dbhealper dbhealper = Dbhealper();
  List<String> images = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSiNphxhS5pgc5xDpcXlQscwfKSFBWG8Wk0yg&s",
    "https://img.freepik.com/free-vector/world-blood-donor-day-realistic-banner_23-2149393884.jpg?semt=ais_hybrid",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ846r8eix0CtVBCe69v6ZBpGCx-CNIx_lwog&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ67RoGCkjo_qDysf2TUa1zIGa8H9jxnEO4oA&s",

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF7E2124),
        title: Text(
          "Hope Flow",
          style: GoogleFonts.aBeeZee(
            textStyle: TextStyle(color: Colors.white, letterSpacing: .5),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext) {
                  return Intro();
                }));
              },
              icon: Icon(Icons.help,color: Colors.white,))
        ],
      ),
      body: Column(
        children: [
          // SizedBox(
          //   height: 20,
          // ),
          CarouselSlider.builder(
            itemCount: 4,
            options: CarouselOptions(
              height: 300,
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              scrollDirection: Axis.horizontal,
            ),
            itemBuilder: (BuildContext context, int index, int realIndex) =>
                Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              child: Image(
                image: NetworkImage("${images[index]}"),
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text("Available Doners",
              style: GoogleFonts.albertSans(
                textStyle: TextStyle(
                  color: Color(0xFF050622),
                  letterSpacing: .5,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              )),
          Mylist(),
          Container(
              width: 100,
              height: 50,
              child: ElevatedButton(style: ButtonStyle(
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Color(0xFF7E2124))
                      )
                  )
              ),

                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildConext) {
                      return Register();
                    }));
                  },
                  child: Icon(Icons.add))),
          SizedBox(height: 20,)
        ],
      ),
    );
  }
}

class Mylist extends StatefulWidget {
  const Mylist({super.key});

  @override
  State<Mylist> createState() => _MylistState();
}

class _MylistState extends State<Mylist> {
  Dbhealper dbhealper = Dbhealper();
  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: FutureBuilder(
      future: dbhealper.getall(),
      builder: (BuildContext context, AsyncSnapshot<List<User>?> snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text("${snapshot.error}"),
          );
        } else if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(3.0),

                decoration:
                    BoxDecoration(border: Border.all(color: Color(0xFF7E2124),width: 2),borderRadius: BorderRadius.circular(20)),
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text("${snapshot.data![index].blood}"),
                  ),
                  title: Text("${snapshot.data![index].name}"),
                  subtitle: Text("${snapshot.data![index].ph}"),
                  trailing:
                      IconButton(onPressed: () {}, icon: Icon(Icons.call)),
                ),
              );
            },
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    ));
  }
}
