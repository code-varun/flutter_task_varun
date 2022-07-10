import 'package:flutter/material.dart';
import 'package:tudo_task/models/book_model.dart';
import 'package:tudo_task/models/charmodel.dart';

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
    print(data.title);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
                  padding: EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // characterInfo(
                      //     'portrayed : ', data[position].portrayed.toString()),
                      // buildDivider(300),
                      // characterInfo(
                      //     'Nickname : ', data[position].nickname.toString()),
                      // buildDivider(300),
                      // characterInfo('Appeared in : ',
                      //     data[position].appearance!.join(', ')),
                      // buildDivider(250),
                      // buildDivider(280),
                      // characterInfo('Actor/Actress : ',
                      //     data[position].nickname.toString()),
                      // buildDivider(235),
                      // characterInfo(
                      //     'Job : ', data[position].occupation!.join(',')),
                      buildDivider(315),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 500,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  buildSliverAppBar() {
    return SliverAppBar(
        // expandedHeight: 600,
        // pinned: true,
        // stretch: true,
        // // backgroundColor: MyColors.dark_100,
        // flexibleSpace: FlexibleSpaceBar(
        //   title: Text(
        //     data[position].name.toString(),
        //     // style: TextStyle(color: MyColors.white),
        //   ),
        //   background: Hero(
        //     tag: data[position].charId.toString(),
        //     child: Image.network(
        //       data[position].img.toString(),
        //       fit: BoxFit.cover,
        //     ),
        //     ),
        //   ),
        );
  }

  characterInfo(String title, String join) {
    return RichText(
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: join,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      height: 30,
      endIndent: endIndent,
      color: Colors.yellow,
      thickness: 2,
    );
  }

  Widget showProgressIndicator() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
