import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget _creatCard(String t, IconData i, String sub, String tr) {
    return (Card(
      elevation: 0,

      margin: EdgeInsets.only(top: 10),

      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: ListTile(
        title: Text(
          t,
          style: GoogleFonts.aBeeZee(
            fontSize: 20,
            color: Colors.purple,
            fontWeight: FontWeight.w500,
          ),
          softWrap: true,
        ),

        subtitle: Text(sub),
        //trailing: Text(tr),
        leading: Icon(i),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.aBeeZeeTextTheme().copyWith(
          titleLarge: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.purple,
          titleTextStyle: GoogleFonts.aBeeZee(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: EdgeInsets.only(top: 2, bottom: 15),
            child: Text("Study Mate"),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 235, 230, 230),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: [
              SizedBox(
                height: 150,
                child: GridView.count(
                  crossAxisCount: 1,
                  childAspectRatio: .6,
                  shrinkWrap: true,
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 5,
                  scrollDirection: Axis.horizontal,
                  children: [
                    _creatCard(
                      "Artificial Intelligence",
                      Icons.smart_toy,
                      "Intro to ML & AI notes",
                      "",
                    ),
                    _creatCard(
                      "Cybersecurity",
                      Icons.security,
                      "Network & security basics",
                      "",
                    ),
                    _creatCard(
                      "Software Engineering",
                      Icons.build,
                      "Design patterns & docs",
                      "",
                    ),
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  "Todays Tasks",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Card(
                  child: ListTile(
                    title: Text(
                      "CS201",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "Web Development",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    leading: Icon(Icons.article, color: Colors.red),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Card(
                  child: ListTile(
                    title: Text(
                      "CE321",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "Operating Systems",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    leading: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 53, 6, 162),
                      foregroundColor: Colors.white,
                      child: Text(
                        "OS",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  "Upcoming",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Card(
                  child: ListTile(
                    title: Text(
                      "CE202",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "Computer Architecture",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    leading: Icon(
                      Icons.developer_board,
                      color: const Color.fromARGB(255, 59, 85, 255),
                    ),
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.all(10),
                child: Card(
                  child: ListTile(
                    title: Text(
                      "CE202",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "Data Structure",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    leading: Icon(
                      Icons.developer_board,
                      color: const Color.fromARGB(255, 59, 255, 95),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
