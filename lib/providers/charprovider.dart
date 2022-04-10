import 'package:flutter/cupertino.dart';
import 'package:tudo_task/models/charmodel.dart';
import 'package:tudo_task/services/apiservices.dart';

class CharProvider extends ChangeNotifier {
  bool loadinglist = false;
  bool listfinished = true;
  List<Users> temp = [];
  List<Users> char = [];
  fetchdata(context, String limit, String offset) async {
    loadinglist = true;
    char = await GetData().fetchChardata(limit, offset);
    
    for (int i = 0; i < char.length; i++) {
      temp.add(char[i]);
    }
    print("temp length is : ${temp.length}");
    // print(char.length.toString() + "*1");
    // print(temp.length.toString());
    // if (char.length == 0) {
    //   listfinished = false;
    //   notifyListeners();
    // }
    print("hello");
    loadinglist = false;
    notifyListeners();
  }
}
