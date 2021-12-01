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

class Community extends StatefulWidget {
  @override
  _CommunityState createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  int _currentIndex = 0;
  int _pageIndex = 0;
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
            "Community",
            style: TextStyle(fontFamily: 'Allura', fontSize: 30),
          ),
          backgroundColor: Colors.pink[900],
          centerTitle: true,
          elevation: 5.0,
        ),
        body: SingleChildScrollView(
          child: new Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
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
                Text(
                  "Get In touch With Most Recommended Gynecologists",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.pink[900],
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                Divider(),
                Material(
                  child: ListTile(
                    trailing: CircleAvatar(
                      backgroundImage: AssetImage('assets/user1.jpg'),
                      radius: 30,
                      child: GestureDetector(onTap: () {}),
                    ),
                    tileColor: Colors.pink[900].withOpacity(0.6),
                    leading: Icon(
                      Icons.enhanced_encryption_sharp,
                      color: Colors.pink[50],
                      size: 40,
                    ),
                    title: (Text(
                      "Doctor 1:",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )),
                    subtitle: (Text(
                      "Country: India \nPhone Number: 999999999 \nGender: Female \nemail: xyz@gmail.com",
                      style: TextStyle(color: Colors.pink[100], fontSize: 15),
                    )),
                  ),
                ),
                Divider(),
                Divider(),
                Material(
                  child: ListTile(
                    trailing: CircleAvatar(
                      backgroundImage: AssetImage('assets/user2.jpg'),
                      radius: 30,
                      child: GestureDetector(onTap: () {}),
                    ),
                    tileColor: Colors.pink[900].withOpacity(0.6),
                    leading: Icon(
                      Icons.enhanced_encryption_sharp,
                      color: Colors.pink[50],
                      size: 40,
                    ),
                    title: (Text(
                      "Doctor 2:",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )),
                    subtitle: (Text(
                      "Country: India \nPhone Number: 9988888999 \nGender: Male \nemail: abc@gmail.com",
                      style: TextStyle(color: Colors.pink[100], fontSize: 15),
                    )),
                  ),
                ),
                Divider(),
                Divider(),
                Material(
                  child: ListTile(
                    trailing: CircleAvatar(
                      backgroundImage: AssetImage('assets/user1.jpg'),
                      radius: 30,
                      child: GestureDetector(onTap: () {}),
                    ),
                    tileColor: Colors.pink[900].withOpacity(0.6),
                    leading: Icon(
                      Icons.enhanced_encryption_sharp,
                      color: Colors.pink[50],
                      size: 40,
                    ),
                    title: (Text(
                      "Doctor 3:",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )),
                    subtitle: (Text(
                      "Country: India \nPhone Number: 999999999 \nGender: Female \nemail: xyz@gmail.com",
                      style: TextStyle(color: Colors.pink[100], fontSize: 15),
                    )),
                  ),
                ),
                Divider(),
                Divider(),
                Material(
                  child: ListTile(
                    trailing: CircleAvatar(
                      backgroundImage: AssetImage('assets/user2.jpg'),
                      radius: 30,
                      child: GestureDetector(onTap: () {}),
                    ),
                    tileColor: Colors.pink[900].withOpacity(0.6),
                    leading: Icon(
                      Icons.enhanced_encryption_sharp,
                      color: Colors.pink[50],
                      size: 40,
                    ),
                    title: (Text(
                      "Doctor 4:",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )),
                    subtitle: (Text(
                      "Country: India \nPhone Number: 9988888999 \nGender: Male \nemail: abc@gmail.com",
                      style: TextStyle(color: Colors.pink[100], fontSize: 15),
                    )),
                  ),
                )
              ],
            ),
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
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        );

    // This trailing comma makes auto-formatting nicer for build methods.
  }
}
