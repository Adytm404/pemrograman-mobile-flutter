// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slicing_ui_praktikum/app/modules/home/controllers/home_controller.dart';
import 'package:slicing_ui_praktikum/app/modules/home/views/bottom_nav.dart';
import 'package:slicing_ui_praktikum/app/modules/home/views/profile_view.dart';

class PlayerView extends GetView<HomeController>{
  const PlayerView({key}) : super(key: key);
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProfileView(key: key,),)
                        );
                      },
                    child: Container(
                      width: 47,
                      height: 46,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Color(0xFFD9D9D9),
                      ),
                    ),
                    ),
                    Container(
                      width: 47,
                      height: 46,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Color(0xFFD9D9D9),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 238,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://m.media-amazon.com/images/I/91zzAMkVCUL._AC_UF894,1000_QL80_.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),

                child: Center(
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Icon(
                      Icons.play_arrow,
                      size: 40,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(30),
                child: Text(
                  "Avengers: End Game (2019)",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Genres",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            GenreTag("Action"),
                            GenreTag("Adventure"),
                            GenreTag("Drama"),
                            GenreTag("Sci-Fi"),
                          ],
                        ),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Prolog",
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "After the devastating events of Avengers: Infinity War (2018), the universe is in ruins. With the help of remaining allies, the Avengers assemble once more in order to reverse Thanos' actions and restore balance to the universe.",
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFFC2C2C2),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                margin: EdgeInsets.only(bottom: 100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "New Movies",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        MovieBox("Avengers: End Game"),
                        MovieBox("Avengers: End Game"),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppNav(),
      ),
    );
  }
}
class GenreTag extends StatelessWidget {
  final String text;

  GenreTag(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 5),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          color: Color(0xFF9BB7FF),
        ),
      ),
    );
  }
}

class MovieBox extends StatelessWidget {
  final String title;

  MovieBox(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 222,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage(
            'https://m.media-amazon.com/images/I/91zzAMkVCUL._AC_UF894,1000_QL80_.jpg',
          ),
          fit: BoxFit.cover,
        ),
      ),

      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: EdgeInsets.all(10),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            color: Colors.black.withOpacity(0.7),
          ),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

