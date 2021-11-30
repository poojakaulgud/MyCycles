// @dart=2.9
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

const magenta = const Color(0x8e3a59);
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

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
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
      body: Center(
        child: new Container(
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
                                  onPressed: () {},
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
                                  onPressed: () {},
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
                                  onPressed: () {},
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
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.phone), title: Text("Contact")),
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text("About Us")),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
