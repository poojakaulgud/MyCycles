// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

// ignore: must_be_immutable
class MyInfo extends StatelessWidget {
  String text;
  MyInfo({Key key, @required this.text}) : super(key: key);

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
            "My Logs",
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
              children: <Widget>[
                Divider(),
                Divider(),
                Text(text, style: TextStyle(color: Colors.pink[900], fontWeight: FontWeight.bold, letterSpacing: 2,fontSize: 25),textAlign: TextAlign.center,),
                Divider(),
                Divider(thickness: 3,color: Colors.pink[900],),
        new ListTile(
          leading: Icon(Icons.fiber_manual_record, color: Colors.pink[900],),
          title: new Text('Date: 11/03/01 Temperature: 99', style: TextStyle(color: Colors.pink[900],fontWeight: FontWeight.w600)),
        ),
        new ListTile(
          leading: Icon(Icons.fiber_manual_record, color: Colors.pink[900],),
          title: new Text('Date: 12/03/01 Temperature: 109', style: TextStyle(color: Colors.pink[900],fontWeight: FontWeight.w600)),
        ),
        
        new ListTile(
          leading: Icon(Icons.fiber_manual_record, color: Colors.pink[900],),
          title: new Text('Date: 12/03/01 Temperature: 89', style: TextStyle(color: Colors.pink[900],fontWeight: FontWeight.w600)),
        ),
        new ListTile(
          leading: Icon(Icons.fiber_manual_record, color: Colors.pink[900],),
          title: new Text('Date: 13/03/01 Temperature: 99', style: TextStyle(color: Colors.pink[900],fontWeight: FontWeight.w600)),
        ),
      ],
              

            ),


        ),),
    );
      
  }
}


