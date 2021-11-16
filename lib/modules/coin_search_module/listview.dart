import 'package:coinkoi/data/model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class SearchList extends StatefulWidget {
  @override
  _SearchListState createState() => new _SearchListState();
}

class _SearchListState extends State<SearchList> {
  @override
  void initState() {
    super.initState();
    readJson();
  }
  List<Coin> _coins=[];
  List filteredNames = [];
  List filteredSymbols =[];


  // Fetch content from the json file
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/jsonfiles/coinmarketcap.json');
    final data = await json.decode(response);
    //final List keyList = data['data'].keys.toList();


    Map<String, dynamic> myMap = data['data'];
    myMap.forEach((key, value){
      _coins.add(Coin.fromJson(value));
      filteredNames.add(Coin.fromJson(value).name);
      filteredSymbols.add(Coin.fromJson(value).symbol);
    });

    print(_coins[0]);

  }



  // Widget appBarTitle = new Text(
  //   "Search Example",
  //   style: new TextStyle(color: Colors.white),
  // );
  // Icon icon = new Icon(
  //   Icons.search,
  //   color: Colors.white,
  // );
  // final globalKey = new GlobalKey<ScaffoldState>();
  // final TextEditingController _controller = new TextEditingController();
  // List<dynamic> _list;
  // bool _isSearching;
  // String _searchText = "";
  // List searchresult = List();
  //
  // _SearchListExampleState() {
  //   _controller.addListener(() {
  //     if (_controller.text.isEmpty) {
  //       setState(() {
  //         _isSearching = false;
  //         _searchText = "";
  //       });
  //     } else {
  //       setState(() {
  //         _isSearching = true;
  //         _searchText = _controller.text;
  //       });
  //     }
  //   });
  // }
  //
  // @override
  // void initState() {
  //   super.initState();
  //   _isSearching = false;
  //   values();
  // }
  //
  // void values() {
  //   _list = List();
  //   _list.add("Indian rupee");
  //   _list.add("United States dollar");
  //   _list.add("Australian dollar");
  //   _list.add("Euro");
  //   _list.add("British pound");
  //   _list.add("Yemeni rial");
  //   _list.add("Japanese yen");
  //   _list.add("Hong Kong dollar");
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("sd"),
        // key: globalKey,
        // body: new Container(
        //   child: new Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     mainAxisSize: MainAxisSize.min,
        //     children: <Widget>[
        //       new Flexible(
        //           child: searchresult.length != 0 || _controller.text.isNotEmpty
        //               ? new ListView.builder(
        //             shrinkWrap: true,
        //             itemCount: searchresult.length,
        //             itemBuilder: (BuildContext context, int index) {
        //               String listData = searchresult[index];
        //               return new ListTile(
        //                 title: new Text(listData.toString()),
        //               );
        //             },
        //           )
        //               : new ListView.builder(
        //             shrinkWrap: true,
        //             itemCount: _list.length,
        //             itemBuilder: (BuildContext context, int index) {
        //               String listData = _list[index];
        //               return new ListTile(
        //                 title: new Text(listData.toString()),
        //               );
        //             },
        //           ))
        //     ],
        //   ),
        // )
        //
        );
  }

  // Widget buildAppBar(BuildContext context) {
  //   return new AppBar(centerTitle: true, title: appBarTitle, actions: <Widget>[
  //     new IconButton(
  //       icon: icon,
  //       onPressed: () {
  //         setState(() {
  //           if (this.icon.icon == Icons.search) {
  //             this.icon = new Icon(
  //               Icons.close,
  //               color: Colors.white,
  //             );
  //             this.appBarTitle = new TextField(
  //               controller: _controller,
  //               style: new TextStyle(
  //                 color: Colors.white,
  //               ),
  //               decoration: new InputDecoration(
  //                   prefixIcon: new Icon(Icons.search, color: Colors.white),
  //                   hintText: "Search...",
  //                   hintStyle: new TextStyle(color: Colors.white)),
  //               onChanged: searchOperation,
  //             );
  //             _handleSearchStart();
  //           } else {
  //             _handleSearchEnd();
  //           }
  //         });
  //       },
  //     ),
  //   ]);
  // }
  //
  // void _handleSearchStart() {
  //   setState(() {
  //     _isSearching = true;
  //   });
  // }
  //
  // void _handleSearchEnd() {
  //   setState(() {
  //     this.icon = new Icon(
  //       Icons.search,
  //       color: Colors.white,
  //     );
  //     this.appBarTitle = new Text(
  //       "Search Sample",
  //       style: new TextStyle(color: Colors.white),
  //     );
  //     _isSearching = false;
  //     _controller.clear();
  //   });
  // }
  //
  // void searchOperation(String searchText) {
  //   searchresult.clear();
  //   if (_isSearching != null) {
  //     for (int i = 0; i < _list.length; i++) {
  //       String data = _list[i];
  //       if (data.toLowerCase().contains(searchText.toLowerCase())) {
  //         searchresult.add(data);
  //       }
  //     }
  //   }
  // }
}