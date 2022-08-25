// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String name = "";
  late SharedPreferences preferences;

  @override
  void initState() {
    super.initState();
    storedata();
  }

  storedata() async {
    preferences = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Shared Preferences"),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            SizedBox(
              height: 35,
            ),
            ElevatedButton(
                onPressed: () async {
                  preferences.setString("name", "Izhan");
                },
                child: Text("STORE DATA")),
            SizedBox(
              height: 25,
            ),
            ElevatedButton(
                onPressed: () async {
                  String? name = preferences.getString("name");
                  if (name == null) return;
                  setState(() => this.name = name);
                },
                child: Text("LOAD DATA"))
          ],
        )),
      ),
    );
  }
}
