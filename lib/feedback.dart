// @dart=2.9
import 'package:flutter/material.dart';
import 'package:my_cycles/main.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

void main() async {
  runApp(
    MaterialApp(debugShowCheckedModeBanner: false, home: MyCycles()),
  );
}

class FeedbackForm extends StatefulWidget {
  @override
  _FeedbackFormState createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
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
          "Feedback",
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
                // key: _key,
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
  String name = 'user';
  String temp = '';
  int age = 0;
  int rate = 0;
  String reason = 'lorem ipsum';
  String comments = 'shuwbjqndqscisqmcqpmxqwmxiw';

  _sendData() async {
    fsi.collection('feedback').add({
      "Name": name,
      "Age": age,
      "Rate": rate,
      "Reason": reason,
      "Comments": comments,
    }).then((value) {
      print(value.id);
      final snackBar = SnackBar(
        margin: EdgeInsets.all(20),
        behavior: SnackBarBehavior.floating,
        content: Text('Thankyou for your Feedback!',
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
                  temp = value;
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
                    if (heading == 'Name') {
                      name = temp;
                    } else if (heading == 'Age') {
                      age = int.parse(temp);
                    } else if (heading == 'Reason') {
                      reason = temp;
                    } else if (heading == 'Comments') {
                      comments = temp;
                    } else {
                      print('Invalid request.');
                    }
                    temp = '';
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          );
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
          title: Text('Name',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.pink[100],
                  fontWeight: FontWeight.bold)),
          subtitle: Text(name,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.pink[50],
                  fontWeight: FontWeight.bold)),
          tileColor: Colors.pink[900].withOpacity(0.7),
          trailing: IconButton(
            onPressed: () {
              _displayTextInputDialog(context, 'Name');
            },
            icon: Icon(
              Icons.perm_identity,
              color: Colors.pink[100],
              size: 40,
            ),
          ),
        )),
        Material(
            child: ListTile(
          title: Text('Age',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.pink[100],
                  fontWeight: FontWeight.bold)),
          subtitle: Text(age.toString(),
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.pink[50],
                  fontWeight: FontWeight.bold)),
          tileColor: Colors.pink[900].withOpacity(0.7),
          trailing: IconButton(
            onPressed: () {
              _displayTextInputDialog(context, 'Age');
            },
            icon: Icon(
              Icons.escalator_warning,
              color: Colors.pink[100],
              size: 40,
            ),
          ),
        )),
        Material(
            child: ListTile(
          title: Text('Rate',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.pink[100],
                  fontWeight: FontWeight.bold)),
          subtitle: Text(rate.toString(),
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.pink[50],
                  fontWeight: FontWeight.bold)),
          tileColor: Colors.pink[900].withOpacity(0.7),
          trailing: SizedBox(
              width: 170,
              child: RatingBar.builder(
                unratedColor: Colors.pink[100],
                itemSize: 30,
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.pink[300],
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                  setState(() {
                    rate = rating.toInt();
                  });
                },
              )),
        )),
        Material(
            child: ListTile(
          title: Text('Reason for rating',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.pink[100],
                  fontWeight: FontWeight.bold)),
          subtitle: Text(reason,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.pink[50],
                  fontWeight: FontWeight.bold)),
          tileColor: Colors.pink[900].withOpacity(0.7),
          trailing: IconButton(
            onPressed: () {
              _displayTextInputDialog(context, 'Reason');
            },
            icon: Icon(
              Icons.help,
              color: Colors.pink[100],
              size: 40,
            ),
          ),
        )),
        Material(
            child: ListTile(
          title: Text('Additional Comments',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.pink[100],
                  fontWeight: FontWeight.bold)),
          subtitle: Text(comments,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.pink[50],
                  fontWeight: FontWeight.bold)),
          tileColor: Colors.pink[900].withOpacity(0.7),
          trailing: IconButton(
            onPressed: () {
              _displayTextInputDialog(context, 'Comments');
            },
            icon: Icon(
              Icons.comment_sharp,
              color: Colors.pink[100],
              size: 40,
            ),
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
