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
          
          appBar: AppBar(
             backgroundColor: Colors.white,

            centerTitle: true,
            title: Text("Books",
            
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
            )
            
            
            ,
      
          ),
         
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
void _getBooksApi() {
    _provider?.showLoading();
    _provider?.getBooks();
  }
}
