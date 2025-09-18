import 'package:flutter/material.dart';

class Calender extends StatefulWidget {
  const Calender({super.key});
  @override
  State<Calender> createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "EduQLDHand",
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.purple,

          titleTextStyle: TextStyle(
            color: Colors.white,
            fontFamily: "EduQLDHand",
            fontSize: 30,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),

      home: Scaffold(
        appBar: AppBar(title: Text("data $i")),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "$i",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  fontSize: 30,
                ),
              ),
              Text(
                "Calender3",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  fontSize: 30,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          shape: CircleBorder(),
          backgroundColor: Colors.purple,
          foregroundColor: Colors.white,
          onPressed: () {
            setState(() {
              ++i;
            });
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
