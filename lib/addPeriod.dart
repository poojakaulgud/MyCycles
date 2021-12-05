// @dart=2.9
import 'package:flutter/material.dart';
import 'package:my_cycles/main.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  runApp(
    MaterialApp(debugShowCheckedModeBanner: false, home: MyCycles()),
  );
}

class AddPeriod extends StatefulWidget {
  @override
  _AddPeriodState createState() => _AddPeriodState();
}

class _AddPeriodState extends State<AddPeriod> {
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
          "My Period",
          style: TextStyle(fontFamily: 'Allura', fontSize: 30),
        ),
        backgroundColor: Colors.pink[900],
        centerTitle: true,
        elevation: 5.0,
      ),
      body: SingleChildScrollView(
          child: new Container(
              width: MediaQuery.of(context).size.width,
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
              child: Container(
                  child: Form(
                child: FormUI(),
              )))),
    );
  }
}

class FormUI extends StatefulWidget {
  @override
  _FormUIState createState() => _FormUIState();
}

class _FormUIState extends State<FormUI> {
  TextEditingController _textFieldController = TextEditingController();
  DateTime currentDate = DateTime.now();
  DateTime startDate = new DateTime(2021, 12, 1);
  DateFormat formatter = DateFormat('yyyy-MM-dd');
  int duration = 0;
  int temp;
  int cycleLength = 0;
  int flow = 0;

  _selectDate(BuildContext context) async {
    DateTime pickedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(2015),
      lastDate: DateTime(2050),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(
              primary: Colors.pink[900],
              onPrimary: Colors.pink[100],
              surface: Colors.pink[100],
              onSurface: Colors.pink[900],
            ),
            dialogBackgroundColor: Colors.pink[100],
          ),
          child: child,
        );
      },
    );
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        startDate = pickedDate;
      });
  }

  _displayTextInputDialog(BuildContext context, String heading) async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(heading),
            backgroundColor: Colors.pink[50],
            content: TextField(
              onChanged: (value) {
                setState(() {
                  temp = int.parse(value);
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
                child: Text('OK', style: TextStyle(color: Colors.pink[50])),
                onPressed: () {
                  setState(() {
                    if (heading == 'Duration') {
                      duration = temp;
                    } else if (heading == 'Cycle Length') {
                      cycleLength = temp;
                    } else if (heading == 'Flow') {
                      flow = temp;
                    } else {
                      print('Invalid request.');
                    }
                    temp = 0;
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          );
        });
  }

  _sendData() async {
    DateTime endDate = startDate.add(Duration(days: duration));
    FirebaseFirestore.instance.collection('periodinfo').add({
      "Cycle Length": cycleLength,
      "Duration": duration,
      "Flow": flow,
      "Selected Date": {
        "start": formatter.format(startDate),
        "end": formatter.format(endDate),
      }
    }).then((value) {
      print(value.id);
      final snackBar = SnackBar(
        margin: EdgeInsets.all(20),
        behavior: SnackBarBehavior.floating,
        content: Text('Your Period Info was addded!',
            textAlign: TextAlign.center,
            style:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.pink[50])),
        backgroundColor: Colors.pink[200],
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }).catchError((error) {
      final snackBar = SnackBar(
        margin: EdgeInsets.all(20),
        behavior: SnackBarBehavior.floating,
        content: Text('Error in submitting!',
            textAlign: TextAlign.center,
            style:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.pink[50])),
        backgroundColor: Colors.pink[200],
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Material(
            child: ListTile(
          title: Text('Period Start',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.pink[100],
                  fontWeight: FontWeight.bold)),
          subtitle: Text(formatter.format(startDate),
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.pink[50],
                  fontWeight: FontWeight.bold)),
          tileColor: Colors.pink[900].withOpacity(0.7),
          trailing: IconButton(
            onPressed: () {
              _selectDate(context);
            },
            icon: Icon(
              Icons.calendar_view_day_rounded,
              color: Colors.pink[100],
              size: 40,
            ),
          ),
        )),
        Material(
            child: ListTile(
          title: Text('Duration',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.pink[100],
                  fontWeight: FontWeight.bold)),
          subtitle: Text(duration.toString(),
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.pink[50],
                  fontWeight: FontWeight.bold)),
          tileColor: Colors.pink[900].withOpacity(0.7),
          trailing: IconButton(
            onPressed: () {
              _displayTextInputDialog(context, 'Duration');
            },
            icon: Icon(
              Icons.calendar_view_month,
              color: Colors.pink[100],
              size: 40,
            ),
          ),
        )),
        Material(
            child: ListTile(
          title: Text('Cycle Length',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.pink[100],
                  fontWeight: FontWeight.bold)),
          subtitle: Text(cycleLength.toString(),
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.pink[50],
                  fontWeight: FontWeight.bold)),
          tileColor: Colors.pink[900].withOpacity(0.7),
          trailing: IconButton(
            onPressed: () {
              _displayTextInputDialog(context, 'Cycle Length');
            },
            icon: Icon(
              Icons.alarm,
              color: Colors.pink[100],
              size: 40,
            ),
          ),
        )),
        Material(
            child: ListTile(
          title: Text('Flow',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.pink[100],
                  fontWeight: FontWeight.bold)),
          subtitle: Text(flow.toString(),
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.pink[50],
                  fontWeight: FontWeight.bold)),
          tileColor: Colors.pink[900].withOpacity(0.7),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  width: 200,
                  child: SliderTheme(
                      data: SliderThemeData(
                          thumbColor: Colors.pink[200],
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 10)),
                      child: Slider(
                        value: flow.toDouble(),
                        min: 0,
                        max: 10,
                        divisions: 10,
                        label: flow.round().toString(),
                        activeColor: Colors.pink[50],
                        inactiveColor: Colors.pink[100],
                        onChanged: (double value) {
                          setState(() {
                            flow = value.round().toInt();
                          });
                        },
                      ))),
              IconButton(
                onPressed: () {
                  _displayTextInputDialog(context, 'Flow');
                },
                icon: Icon(
                  Icons.water,
                  color: Colors.pink[100],
                  size: 40,
                ),
              ),
            ],
          ),
        )),
        Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 40),
            child: TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.pink[900]),
                ),
                onPressed: () {
                  _sendData();
                },
                child: Text(
                  "Submit",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.pink[100],
                      fontWeight: FontWeight.bold),
                ))),
      ],
    );
  }
}
