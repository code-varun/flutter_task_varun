import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:tudo_task/providers/charprovider.dart';
import 'package:tudo_task/views/detailspage/detailpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController? _scrollController;

  var item = 20;
  int limit = 10;
  int offset = 0;

  @override
  void initState() {
    final data = Provider.of<CharProvider>(context, listen: false);
    // TODO: implement initState
    _scrollController = ScrollController();
    _scrollController?.addListener(() {
      _onScrollUpdated(data);
    });
    data.fetchdata(context, limit.toString(), offset.toString());
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController!.dispose();
    super.dispose();
  }

  _onScrollUpdated(CharProvider data) async {
    var maxScroll = _scrollController?.position.maxScrollExtent;
    var currentPosition = _scrollController?.position.pixels;
    if (currentPosition == maxScroll) {
      print("Max scroll reached");
      item = item + 10;
      offset = offset + 10;
      if (offset < 60) {
        data.fetchdata(context, limit.toString(), offset.toString());
      } else {
        Fluttertoast.showToast(msg: "No More Characters found");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<CharProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Breaking Bad Characters "),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Container(
            child: Column(
              children: [
                Consumer<CharProvider>(
                    builder: ((context, value, child) => ListView.builder(
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemCount: data.temp.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              dense: true,
                              title: InkWell(
                                onTap:  () {
                                                      // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             DetailChar(data.temp, index)))),
                                  
                                },
            
                                
                                child: Card(
                                  elevation: 2.0,
                                  margin: new EdgeInsets.symmetric(
                                      horizontal: 4.0, vertical: 6.0),
                                  child: Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            colors: [
                                              Color.fromARGB(255, 57, 117, 113),
                                              Color.fromARGB(255, 62, 182, 226)
                                            ],
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter),
                                      ),
                                      child: ListTile(
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 20.0, vertical: 10.0),
                                        leading: Container(
                                            padding:
                                                EdgeInsets.only(right: 12.0),
                                            decoration: new BoxDecoration(
                                                border: new Border(
                                                    right: new BorderSide(
                                                        width: 1.0,
                                                        color:
                                                            Colors.white24))),
                                            child: Image.network(
                                              data.temp[index].img.toString(),
                                              width: 75,
                                              height: 100,
                                              fit: BoxFit.fill,
                                              loadingBuilder: (context, child,
                                                  loadingProgress) {
                                                if (loadingProgress == null)
                                                  return child;

                                                return CircularProgressIndicator();
                                              },
                                              errorBuilder: (context, error,
                                                      stackTrace) =>
                                                  const Text(
                                                      'Some errors occurred!'),
                                            )),
                                        title: Text(
                                          data.temp[index].name.toString(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        subtitle: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Text(
                                                data.temp[index].birthday
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Colors.white))
                                          ],
                                        ),
                                      )),
                                ),
                              ),
                            );
                          },
                        )))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
