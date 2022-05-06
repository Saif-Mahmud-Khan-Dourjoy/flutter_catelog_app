// ignore_for_file: prefer_const_constructors, unnecessary_null_comparison

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/catelog.dart';
import 'package:flutter_application_2/widgets/drawer.dart';
import 'package:flutter_application_2/widgets/item_widget.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catelogJson =
        await rootBundle.loadString("assets/files/catelog.json");
    final decodeCatelog = jsonDecode(catelogJson);
    var productJson = decodeCatelog['products'];
    CatelogModel.items =
        List.from(productJson).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
    // ignore: avoid_print
  }

  // const ({ Key? key }) : super(key: key);
  // final dummyList = List.generate(10, (index) => CatelogModel.items[0]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Catelog App',
        ),
        toolbarTextStyle: Theme.of(context).textTheme.titleLarge,
        titleTextStyle: Theme.of(context).textTheme.titleLarge,
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: (CatelogModel.items != null && CatelogModel.items.isNotEmpty)
            ? ListView.builder(
                itemCount: CatelogModel.items.length,
                itemBuilder: (context, index) {
                  return ItemWidget(
                    item: CatelogModel.items[index],
                  );
                },
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      // Center(
      //   child: Container(
      //     alignment: Alignment.center,
      //     padding: const EdgeInsets.all(8),
      //     decoration: BoxDecoration(
      //       color: Colors.teal,
      //       gradient:
      //           const LinearGradient(colors: [Colors.yellow, Colors.blue]),
      //       borderRadius: BorderRadius.circular(10),
      //       boxShadow: const [
      //         BoxShadow(
      //           color: Colors.red,
      //           spreadRadius: 2,
      //           blurRadius: 10,
      //           offset: Offset(5, 5),
      //         ),
      //       ],
      //     ),
      //     height: 100,
      //     width: 100,
      //     child: Text(
      //       'From $days Box',
      //       textAlign: TextAlign.center,
      //       // ignore: prefer_const_constructors
      //       style: TextStyle(
      //           color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20),
      //     ),
      //   ),
      // ),
      drawer: MyDrawer(),
    );
  }
}
