// @dart=2.9
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_cycles/aboutus.dart';
import 'package:my_cycles/addPeriod.dart';
import 'package:my_cycles/feedback.dart';
import 'package:my_cycles/community.dart';
import 'package:my_cycles/healthtips.dart';
import 'package:my_cycles/logs.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'main.dart';
import 'package:contactus/contactus.dart';
import 'package:google_fonts/google_fonts.dart';

const magenta = const Color(0x8e3a59);
void main() async {
  runApp(
    MaterialApp(debugShowCheckedModeBanner: false, home: MyCycles()),
  );
}

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  int _currentIndex = 2;
  int _pageIndex = 2;
  CalendarController _controller;
  DateFormat formatter = DateFormat('yyyy-MM-dd');
  TextEditingController _textFieldController = TextEditingController();
  final List<Widget> _children = [
    Community(),
    MyCycles(),
    AboutUs(),
  ];

  // ignore: non_constant_identifier_names
  _OnTap() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => _children[_currentIndex]));
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            new SizedBox(
              height: 100.0,
              width: 80.0,
              child: new IconButton(
                  icon: Image.asset('assets/logo.png'), onPressed: () => {}),
            ),
          ],
          title: Text(
            "About Us",
            style: TextStyle(
              fontFamily: 'Allura',
              fontSize: 30,
            ),
          ),
          backgroundColor: Colors.pink[900],
          centerTitle: true,
          elevation: 5.0,
        ),
        body: SingleChildScrollView(
          child: new Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(-1.0, 0.0),
                end: Alignment(1.0, 0.0),
                stops: [
                  0.0,
                  0.1,
                  0.1,
                  0.2,
                  0.2,
                  0.3,
                  0.3,
                  0.4,
                  0.4,
                  0.5,
                  0.5,
                  0.6,
                  0.6,
                  0.7,
                  0.7,
                  0.8,
                  0.8,
                  0.9,
                  0.9,
                  1
                ],
                colors: [
                  Colors.pink[100],
                  Colors.pink[100],
                  Colors.pink[50],
                  Colors.pink[50],
                  Colors.pink[100],
                  Colors.pink[100],
                  Colors.pink[50],
                  Colors.pink[50],
                  Colors.pink[100],
                  Colors.pink[100],
                  Colors.pink[50],
                  Colors.pink[50],
                  Colors.pink[100],
                  Colors.pink[100],
                  Colors.pink[50],
                  Colors.pink[50],
                  Colors.pink[100],
                  Colors.pink[100],
                  Colors.pink[50],
                  Colors.pink[50],
                ],
                tileMode: TileMode.repeated,
              ),
            ),
            child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(),
                  ContactUs(
                    companyName: "Aditi Kulkarni",
                    textColor: Colors.white,
                    textFont: 'Poppins',
                    cardColor: Colors.pink[900],
                    companyFontSize: 30,
                    companyColor: Colors.pink,
                    taglineColor: Colors.pink,
                    taglineFont: 'Poppins',
                    email: "aditi.hk@somaiya.edu",
                    phoneNumber: '+91- 9820623217',
                    taglineFontWeight: FontWeight.normal,
                    logo: AssetImage('assets/aditi.jpeg'),
                    tagLine: " Student, KJSCE TY IT ",
                    dividerColor: Colors.black38,
                  ),
                  Divider(),
                  ContactUs(
                    textFont: 'Poppins',
                    taglineFont: 'Poppins',
                    companyName: "Pooja Kaulgud",
                    companyFontSize: 30,
                    textColor: Colors.white,
                    cardColor: Colors.pink[900],
                    companyColor: Colors.pink,
                    taglineColor: Colors.pink,
                    email: "pooja.kaulgud@somaiya.edu",
                    phoneNumber: '+91- 9619105432',
                    logo: AssetImage('assets/pooja.jpeg'),
                    taglineFontWeight: FontWeight.normal,
                    tagLine: " KJSCE TY IT ",
                    dividerColor: Colors.black38,
                  )
                ]),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.pink[50],
            selectedItemColor: Colors.pink[900],
            unselectedItemColor: Colors.black,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.escalator_warning),
                  title: Text("Community")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), title: Text("Home")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.people), title: Text("About Us")),
            ],
            type: BottomNavigationBarType.shifting,
            currentIndex: _pageIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
              _OnTap();
            },
            elevation: 5),
        drawer: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Colors
                  .pink[100], //This will change the drawer background to blue.
              //other styles
            ),
            child: Drawer(
              child: ListView(
                children: [
                  DrawerHeader(
                    padding: const EdgeInsets.fromLTRB(0, 2, 20, 2),
                    decoration: BoxDecoration(
                      color: Colors.pink[900],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            iconSize: 100,
                            padding: EdgeInsets.fromLTRB(0.1, 2, 2, 2),
                            icon: Image.asset('assets/logo.png'),
                            onPressed: () => {}),
                        Text(
                          "My Cycles",
                          style: TextStyle(
                              fontFamily: 'Allura',
                              fontSize: 40,
                              color: Colors.pink[50]),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    tileColor: Colors.pink[900],
                    trailing: Icon(
                      Icons.add_box,
                      color: Colors.pink[100],
                      size: 40,
                    ),
                    title: Text(
                      "Health Tips",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.pink[100],
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins'),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HealthTips()));
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    tileColor: Colors.pink[900],
                    trailing: Icon(
                      Icons.plumbing,
                      color: Colors.pink[100],
                      size: 40,
                    ),
                    title: Text(
                      "Medicine",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.pink[100],
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins'),
                    ),
                    onTap: () {
                      _displayTextInputDialog(context, "Medicine", "medicine");
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    tileColor: Colors.pink[900],
                    trailing: Icon(
                      Icons.chat_bubble_rounded,
                      color: Colors.pink[100],
                      size: 40,
                    ),
                    title: Text(
                      "My Logs",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.pink[100],
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins'),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Logs()));
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    tileColor: Colors.pink[900],
                    trailing: Icon(
                      Icons.email,
                      color: Colors.pink[100],
                      size: 40,
                    ),
                    title: Text(
                      "Feedback",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.pink[100],
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins'),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FeedbackForm()),
                      );
                    },
                  ),
                  // SizedBox(
                  //   height: 190,
                  // ),
                  Expanded(
                      child: Align(
                    alignment: Alignment.bottomCenter,
                    child: ListTile(
                      leading: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                        size: 40,
                      ),
                      title: Text(
                        "Back",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                        ),
                        textAlign: TextAlign.right,
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ))
                ],
              ),
            )));

    // This trailing comma makes auto-formatting nicer for build methods.
  }

  String codeDialog;
  String valueText;
  _displayTextInputDialog(
      BuildContext context, String heading, String collection_name) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(heading),
            backgroundColor: Colors.pink[50],
            content: TextField(
              onChanged: (value) {
                setState(() {
                  valueText = value;
                });
              },
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "Enter your " + heading),
            ),
            actions: <Widget>[
              TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.pink[900]),
                ),
                child: Text(
                  'CANCEL',
                  style:
                      TextStyle(color: Colors.pink[50], fontFamily: 'Poppins'),
                ),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
              ),
              TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.pink[900]),
                ),
                child: Text('SUBMIT',
                    style: TextStyle(
                        color: Colors.pink[50], fontFamily: 'Poppins')),
                onPressed: () {
                  DateTime now = new DateTime.now();
                  String dateValue = formatter.format(now);
                  FirebaseFirestore.instance.collection(collection_name).add({
                    "Value": valueText,
                    "Date": dateValue,
                  }).then((value) {
                    print(value.id);
                  }).catchError((error) => print("Failed to add data: $error"));
                  setState(() {
                    codeDialog = valueText;
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          );
        });
  }
}
