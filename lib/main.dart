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
                    todayColor: Colors.blue,
                    selectedColor: Theme.of(context).primaryColor,
                    todayStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22.0,
                        color: Colors.white)),
                headerStyle: HeaderStyle(
                  centerHeaderTitle: true,
                  formatButtonDecoration: BoxDecoration(
                    color: Colors.brown,
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
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Text(
                        date.day.toString(),
                        style: TextStyle(color: Colors.white),
                      )),
                  todayDayBuilder: (context, date, events) => Container(
                      margin: const EdgeInsets.all(5.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.blue,
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
                      Expanded(
                          child: TextButton(
                        onPressed: () {},
                        child: Text("Add Period"),
                        style: TextButton.styleFrom(
                          primary: Colors.pink[900],
                        ),
                      )),
                      Expanded(
                        child: FloatingActionButton(
                          onPressed: () {},
                          child: Icon(Icons.add),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
