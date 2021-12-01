// @dart=2.9
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_cycles/aboutus.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

FirebaseFirestore fsi = FirebaseFirestore.instance;


const magenta = const Color(0x8e3a59);
int _currentIndex = 0;
int _pageIndex = 0;
void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyCycles(),
    ),
  );
}

class MyCycles extends StatefulWidget {
  _MyCycleState createState() => _MyCycleState();
}

class _MyCycleState extends State<MyCycles> {
  CalendarController _controller;
  TextEditingController _textFieldController = TextEditingController();
  int _selectedIndex = 0;
  final List<Widget> _children = [
    MyCycles(),
    AboutUs()
  ];
  bool _initialized = false;
  bool _error = false;
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  _OnTap() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => _children[_currentIndex]));
  }

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
    initializeFlutterFire();
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
            "My Cycles",
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
              children: <Widget>[
                TableCalendar(
                  initialCalendarFormat: CalendarFormat.month,
                  calendarStyle: CalendarStyle(
                      weekendStyle: TextStyle(
                          color: Colors.pink[900], fontWeight: FontWeight.bold),
                      outsideStyle: TextStyle(color: Colors.pink[900]),
                      outsideWeekendStyle: TextStyle(color: Colors.pink[900]),
                      weekdayStyle: TextStyle(
                          color: Colors.pink[900], fontWeight: FontWeight.bold),
                      todayColor: Colors.pink[900],
                      selectedColor: Theme.of(context).primaryColor,
                      todayStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Colors.white)),
                  headerStyle: HeaderStyle(
                    centerHeaderTitle: true,
                    titleTextStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        fontSize: 22.0),
                    formatButtonDecoration: BoxDecoration(
                      color: Colors.pink[900],
                      borderRadius: BorderRadius.circular(22.0),
                    ),
                    formatButtonTextStyle: TextStyle(color: Colors.white),
                    formatButtonShowsNext: false,
                  ),
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  onDaySelected: (date, events, _) {
                    print(date.toUtc());
                  },
                  builders: CalendarBuilders(
                    selectedDayBuilder: (context, date, events) => Container(
                        margin: const EdgeInsets.all(5.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            // color: Theme.of(context).primaryColor,
                            color: Colors.pink[900],
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Text(
                          date.day.toString(),
                          style: TextStyle(color: Colors.white),
                        )),
                    todayDayBuilder: (context, date, events) => Container(
                        margin: const EdgeInsets.all(5.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.pink[900],
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Text(
                          date.day.toString(),
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                  calendarController: _controller,
                ),
                Divider(),
                Divider(),
                new Column(
                  children: [
                    Row(
                      children: <Widget>[
                        SizedBox(
                            height: 50,
                            width: 300,
                            child: Padding(
                                padding: EdgeInsets.fromLTRB(100, 10, 40, 10),
                                child: Text("Add Period",
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.pink[900],
                                        fontWeight: FontWeight.bold)))),
                        Divider(),
                        SizedBox(
                          child: FloatingActionButton(
                            onPressed: () {},
                            backgroundColor: Colors.pink[900],
                            child: Icon(Icons.add, color: Colors.pink[100]),
                          ),
                        )
                      ],
                    ),
                    Divider(),
                    Row(
                      children: <Widget>[
                        SizedBox(
                            height: 60,
                            width: 392,
                            child: Padding(
                                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                child: TextButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.pink[900]),
                                    ),
                                    onPressed: () {
                                      _displayTextInputDialog(context,
                                          "Temperature", "temperature");
                                    },
                                    child: Text(
                                      "TEMPERATURE",
                                      style: TextStyle(
                                          color: Colors.pink[200],
                                          fontWeight: FontWeight.bold),
                                    )))),
                      ],
                    ),
                    Divider(),
                    Row(
                      children: <Widget>[
                        SizedBox(
                            height: 60,
                            width: 392,
                            child: Padding(
                                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                child: TextButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.pink[900]),
                                    ),
                                    onPressed: () {
                                      _displayTextInputDialog(
                                          context, "Mood", "mood");
                                    },
                                    child: Text(
                                      "MOOD",
                                      style: TextStyle(
                                          color: Colors.pink[200],
                                          fontWeight: FontWeight.bold),
                                    )))),
                      ],
                    ),
                    Divider(),
                    Row(
                      children: <Widget>[
                        SizedBox(
                            height: 60,
                            width: 392,
                            child: Padding(
                                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                child: TextButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.pink[900]),
                                    ),
                                    onPressed: () {
                                      _displayTextInputDialog(
                                          context, "Weight", "weight");
                                    },
                                    child: Text(
                                      "WEIGHT",
                                      style: TextStyle(
                                          color: Colors.pink[200],
                                          fontWeight: FontWeight.bold),
                                    )))),
                      ],
                    ),
                  ],
                ),
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
                  icon: Icon(Icons.home), title: Text("Home")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.phone), title: Text("Contact")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), title: Text("About Us")),
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
                  style: TextStyle(color: Colors.pink[50]),
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
                child: Text('SUBMIT', style: TextStyle(color: Colors.pink[50])),
                onPressed: () {
                  DateTime now = new DateTime.now();
                  fsi.collection(collection_name).add({
                    "Value": valueText,
                    "Date": now,
                  }).then((value) {
                    print(value.id);
                  }).catchError((error) => print("Failed to add user: $error"));
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
