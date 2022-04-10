import 'package:flutter/material.dart';
import 'package:tudo_task/models/charmodel.dart';

class DetailChar extends StatefulWidget {
  DetailChar(this.data, this.index, {Key? key}) : super(key: key);

  final List<Users> data;
  final int index;

  @override
  State<DetailChar> createState() => _DetailCharState();
}

class _DetailCharState extends State<DetailChar> {
  late var position = widget.index;
  late var data = widget.data;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(data[position].name.toString()),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.network(
            data[position].img.toString(),
            height: MediaQuery.of(context).size.height / 1.6,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fitWidth,
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Nickname: ${data[position].nickname}"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Portrayed: ${data[position].portrayed}"),
          ),
        ],
      ),
    ));
  }
}
