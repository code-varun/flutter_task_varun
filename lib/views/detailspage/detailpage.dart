import 'package:flutter/material.dart';
import 'package:tudo_task/models/charmodel.dart';

class DetailChar extends StatefulWidget {
  DetailChar(this.data, this.index, {Key? key}) : super(key: key);

  final List<Users> data;
  int index;

  @override
  State<DetailChar> createState() => _DetailCharState();
}

class _DetailCharState extends State<DetailChar> {
  late var position = widget.index;
  late var data = widget.data;
  @override
  Widget build(BuildContext context) {
    print(widget.data[0].name);
    return widget.data != null
        ? SafeArea(
            child: Scaffold(
            appBar: AppBar(
              title: Text(data[position].name.toString()),
            ),
            body: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height - 210,
                  width: double.maxFinite,
                  child: Image.network(data[position].img.toString()),
                ),
                Text("Nickname: ${data[position].nickname}"),
                Text("Birthday : ${data[position].birthday}"),
                Text("Portrayed: ${data[position].portrayed}"),
                Text("Status  : ${data[position].status}"),
                // Text(""data[position].birthday.toString()),
              ],
            ),
          ))
        : Container();
  }
}
