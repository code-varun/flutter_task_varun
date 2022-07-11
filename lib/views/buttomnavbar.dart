import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tudo_task/providers/buttomnavbarprovider.dart';
import 'package:tudo_task/views/homepage/homescreen.dart';
import 'package:tudo_task/views/newspage/homepage.dart';




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
    Icon(Icons.menu_book_rounded),
    Icon(Icons.newspaper_outlined)
  ];
  List<String> title = ["Books", "News "];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BottomNavigationBarProvider>(context);

    List<Widget> _widgetOptions = <Widget>[
      // HomePage(),
      // HomepageGyt(),
      // FlutterMap(),
      // New Screens for Infedis Infotech LLP task 
      // list of books homescreen
       HomeScreen(),
// Top news Screen for Infedis Infotech LLP task
// Newspage()
HomePage()


     

    ];
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(provider.currentIndex),
      ),
      bottomNavigationBar: Material(
        color: Colors.grey,
        // Color.fromRGBO(22, 21, 26, 1),
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
                            Colors.blue,
                            Colors.blueAccent
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
