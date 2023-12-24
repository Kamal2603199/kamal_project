import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


import 'Models/PostsModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  
  List<PostsModel> postList = [];
  @override
  void initState() {
    super.initState();
    // Call getPostApi when the widget is initialized
    getPostApi();
  }


  Future<List<PostsModel>> getPostApi () async {
    print("function calling");
    Map<String, String> headers = {
      'Authorization': 'kamaldeepthakur96@gmail.com',
      // Add more headers if needed
    };

    final response = await http.get(Uri.parse('http://flutter.dev.emotorad.com/get_routes'), headers: headers);
    if(response.statusCode == 200){
      print('Status Code: ${response.statusCode}');
      var responseList = jsonDecode(response.body) as List;
    setState(() {
      postList = responseList.map((e) => PostsModel.fromJson(e)).toList();
    });
    return postList;
    }else{
          return postList;
        }
  }

  Widget getSingleColumn(singleRow) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('From: ${singleRow.startLoc ?? ''}', style: TextStyle(color: Colors.green[200]),),
        Text('From: ${singleRow.endLoc ?? ''}', style: TextStyle(color: Colors.red[200])),
         // Image.network(singleRow.image)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ride Tracker'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
          children: postList.map((e) =>
          getSingleColumn(e)).toList(),
      )

            ,
            // child: FutureBuilder(
            //     future: getPostApi(),
            //     builder: (context , snapshot) {
            //       if(!snapshot.hasData){
            //         return Text('Loading');
            //       }else {
            //         return ListView.builder(
            //             itemCount: postList.length,
            //             itemBuilder: (context , index){
            //           return Text(postList[index].toString());
            //
            //         });
            //       }
            //
            //     }),
          )

        ],
      ),
    );
  }
}
