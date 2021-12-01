// @dart=2.9
import 'package:contactus/contactus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_cycles/aboutus.dart';
import 'package:my_cycles/community.dart';
import 'package:my_cycles/main.dart';

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
            style: TextStyle(fontFamily: 'Allura', fontSize: 30),
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
                    cardColor: Colors.pink[900],
                    companyFontSize: 30,
                    companyColor: Colors.pink,
                    taglineColor: Colors.pink,
                    email: "aditi.hk@somaiya.edu",
                    phoneNumber: '+91- 9820623217',
                    taglineFontWeight: FontWeight.normal,
                    logo: AssetImage('assets/aditi.jpeg'),
                    tagLine: " Student, KJSCE TY IT ",
                    dividerColor: Colors.black38,
                  ),
                  Divider(),
                  ContactUs(
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
                    tagLine: " Student, KJSCE TY IT ",
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
        drawer: Drawer(
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
                  color: Colors.pink[50],
                  size: 40,
                ),
                title: Text(
                  "Health Tips",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.pink[50],
                      fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                tileColor: Colors.pink[900],
                trailing: Icon(
                  Icons.plumbing,
                  color: Colors.pink[50],
                  size: 40,
                ),
                title: Text(
                  "Medicine",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.pink[50],
                      fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                tileColor: Colors.pink[900],
                trailing: Icon(
                  Icons.chat_bubble_rounded,
                  color: Colors.pink[50],
                  size: 40,
                ),
                title: Text(
                  "Ask For Help",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.pink[50],
                      fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                tileColor: Colors.pink[900],
                trailing: Icon(
                  Icons.email,
                  color: Colors.pink[50],
                  size: 40,
                ),
                title: Text(
                  "Feedback",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.pink[50],
                      fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.pop(context);
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
        ));

    // This trailing comma makes auto-formatting nicer for build methods.
  }
}
