import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tudo_task/providers/buttomnavbarprovider.dart';

import 'package:tudo_task/views/homepage/homepage.dart';
import 'package:tudo_task/views/maps/tudomaps.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late final user;
  @override
  void initState() {
    super.initState();
  }

  List<dynamic> data = [
    Icon(Icons.home),
    Icon(Icons.map),
  ];
  List<String> title = ["Homepage", "Explore"];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BottomNavigationBarProvider>(context);

    List<Widget> _widgetOptions = <Widget>[
      HomePage(),
      FlutterMap(),
    ];
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(provider.currentIndex),
      ),
      bottomNavigationBar: Material(
        color: Color.fromRGBO(22, 21, 26, 1),
        child: Container(
          height: 70,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: 2,
            itemExtent: MediaQuery.of(context).size.width / 2,
            itemBuilder: (ctx, i) => GestureDetector(
              onTap: () {
                provider.currentIndex = i;
              },
              child: AnimatedContainer(
                curve: Curves.bounceIn,
                duration: Duration(milliseconds: 100),
                decoration: BoxDecoration(
                  border: i == provider.currentIndex
                      ? Border(top: BorderSide(width: 3.0, color: Colors.white))
                      : null,
                  gradient: i == provider.currentIndex
                      ? LinearGradient(
                          colors: [
                              Color.fromARGB(255, 57, 117, 113),
                              Color.fromARGB(255, 62, 182, 226)
                            ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter)
                      : null,
                ),
                child: Column(
                  children: [
                    Container(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        width: MediaQuery.of(context).size.width / 6.5,
                        child: data[i]),
                    SizedBox(
                      height: 1.0,
                    ),
                    Text(
                      title[i],
                      style: i == provider.currentIndex
                          ? TextStyle(
                              color: Colors.white,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0)
                          : TextStyle(
                              color: Colors.white54,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0),
                    )
                  ],
                ),
              ),
            ),
            scrollDirection: Axis.horizontal,
          ),
        ),
      ),
    );
  }
}
