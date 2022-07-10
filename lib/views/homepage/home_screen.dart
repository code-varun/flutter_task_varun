import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tudo_task/models/index.dart';
import 'package:tudo_task/providers/index.dart';
import 'package:tudo_task/utils/book_widget.dart';
import 'package:tudo_task/views/detailspage/detailpage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  HomeProvider? _provider;

  @override
  void initState() {
    super.initState();
    _provider = Provider.of<HomeProvider>(context, listen: false);
    _provider?.getBooks();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getBooksApi();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, widget) => SafeArea(
        top: true,
        child: Scaffold(
          drawer: Drawer(
            // Add a ListView to the drawer. This ensures the user can scroll
            // through the options in the drawer if there isn't enough vertical
            // space to fit everything.
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Text('Drawer Header'),
                ),
                ListTile(
                  title: const Text('Item 1'),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
                ListTile(
                  title: const Text('Item 2'),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
              ],
            ),
          ),
          appBar: AppBar(
            centerTitle: true,
            title: Text("Books"),
            actions: [IconButton(onPressed: null, icon: Icon(Icons.search))],
          ),
          // floatingActionButton: _floatingActionWidget(),
          body: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      child: ListView.builder(
                        primary: false,
                        shrinkWrap: true,
                        controller: _scrollController,
                        scrollDirection: Axis.vertical,
                        itemCount: provider.books.length,
                        itemBuilder: (context, position) {
                          final book = provider.books[position];
                          return InkWell(
                            onTap: () {
                              // _openBookDetail(book);
                             Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  DetailChar( book,book.id)));
                            },
                            child: BookWidget(
                                book.title,
                                book.subtitle ?? book.description,
                                book.thumbnail),
                          );
                        },
                      ),
                    ),
                    provider.isLoading
                        ? Center(child: CircularProgressIndicator())
                        : SizedBox(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget _toolbar() {
  //   return Container(
  //     width: double.infinity,
  //     color: Colors.blue,
  //     child: Padding(
  //       padding: EdgeInsets.all(16),
  //       child: Text(
  //         "Book Library",
  //         textAlign: TextAlign.center,
  //         style: TextStyle(color: Colors.white, fontSize: 20),
  //       ),
  //     ),
  //   );
  // }

  void _openSearchBottomSheet() {
    showModalBottomSheet(
        context: context,
        barrierColor: Colors.transparent,
        elevation: 10,
        isScrollControlled: true,
        builder: (ctx) {
          return FractionallySizedBox(
              heightFactor:
                  MediaQuery.of(context).viewInsets.bottom == 0 ? 0.3 : 0.7,
              child: Container()

              // BottomSheetWidget(),
              );
        }).then((value) {
      if (value != null) {
        _provider?.query = value;
        _provider?.books.clear();
        _getBooksApi();
      }
    });
  }

  // Widget _floatingActionWidget() {
  //   return Container(
  //     child: RawMaterialButton(
  //       shape: CircleBorder(),
  //       padding: EdgeInsets.all(16),
  //       elevation: 2,
  //       fillColor: Colors.blue,
  //       child: Icon(
  //         Icons.search_outlined,
  //         size: 38,
  //         color: Colors.white,
  //       ),
  //       onPressed: () {
  //         _openSearchBottomSheet();
  //       },
  //     ),
  //   );
  // }

  void _getBooksApi() {
    _provider?.showLoading();
    _provider?.getBooks();
  }
}
