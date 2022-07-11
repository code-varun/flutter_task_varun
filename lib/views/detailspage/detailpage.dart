import 'package:flutter/material.dart';
import 'package:tudo_task/models/bookmodel.dart';

class DetailChar extends StatefulWidget {
  DetailChar(this.data, this.index, {Key? key}) : super(key: key);

  final BookModel data;
  final String? index;

  @override
  State<DetailChar> createState() => _DetailCharState();
}

class _DetailCharState extends State<DetailChar> {
  late var position = widget.index;
  late var data = widget.data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.data.title.toString()),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Container(
                // width: double.infinity,
                child: Image.network(widget.data.thumbnail.toString()),
              ),
            ),
            Container(
              child: widget.data.subtitle == null
                  ? Text(
                      "NO SUBTITILE",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 35),
                    )
                  : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(widget.data.subtitle.toString(),
                    
                      style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),),
                  ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                child: Text(widget.data.description.toString(),

                style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18)
                
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
