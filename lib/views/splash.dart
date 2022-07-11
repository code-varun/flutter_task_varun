import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tudo_task/views/buttomnavbar.dart';

class NewSplash extends StatefulWidget {
  const NewSplash({Key? Key}) : super(key: Key);

  @override
  _NewSplashState createState() => _NewSplashState();
}

class _NewSplashState extends State<NewSplash> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 3000), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => BottomNavBar()));
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: (screenHeight / 4),
            ),
            IconButton(
              icon: Image.network(
                  "https://www.hidoc.co/ad_campaign/pharma/sai_allergy/img/logo.png",
                  fit: BoxFit.contain),
              tooltip: "hidoc DR (https://hidoc.co/)",
              iconSize: 240,
              onPressed: () {},
            ),
            Container(
              height: 50,
              width: 50,
              child: buildSpinKit(),
            ),
            Container(
              height: (screenHeight / 4),
            ),
            Container(
              child: const Text(
                'https://hidoc.co/',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w800,
                  fontSize: 12,
                ),
              ),
            ),
            Container(
              child: Text(
                "Version :  1.0",
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w800,
                  fontSize: 9,
                ),
              ),
            ),
          ], //Children
        ),
      ),
    ); //Scaffold
  }

  SpinKitFadingCircle buildSpinKit() {
    SpinKitFadingCircle spinkit = SpinKitFadingCircle(color: Colors.blue);

    return spinkit;
  }
}
