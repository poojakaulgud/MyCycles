// @dart=2.9
import 'package:contactus/contactus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_cycles/aboutus.dart';
import 'package:my_cycles/main.dart';

int _currentIndex=0;
int _pageIndex=0;
const magenta = const Color(0x8e3a59);
void main()async {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyCycles()
      
    ),
  );
}

class AboutUs extends StatefulWidget {
  

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
   int _selectedIndex = 0;  
  final List<Widget> _children= [
    MyCycles(),
    AboutUs()
    
  ];    
  
  _OnTap(){
    Navigator.of(context)
    .push(MaterialPageRoute(builder: (BuildContext context)=>_children[_currentIndex]));
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
          "My Cycles",
          style: TextStyle(fontFamily: 'Allura', fontSize: 30),
        ),
        backgroundColor: Colors.pink[900],
        centerTitle: true,
        elevation: 5.0,
      ),
      body: SingleChildScrollView(
        
        child: ContactUs(
          cardColor: Colors.white,
            textColor: Colors.teal.shade900,
            
            email: 'aditi.hk@somaiya.edu',
            companyName: 'Aditi Kulkarni',
            
            companyColor: Colors.teal.shade100,
            dividerThickness: 2,
            phoneNumber: '+919820623217',
            tagLine: 'KJ Somaiya College of Engineering',
            taglineColor: Colors.teal.shade100,
        ),
       
      ),
       bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.pink[50],
        selectedItemColor: Colors.pink[900],
        unselectedItemColor: Colors.black,
        items: const <BottomNavigationBarItem> [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(icon: Icon(Icons.phone), title: Text("Contact")),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text("About Us")),
        ],
          type: BottomNavigationBarType.shifting,  
        currentIndex: _pageIndex,   
        onTap: (index){
          setState(() {
            _currentIndex=index;
          });
          _OnTap();
        },  
        elevation: 5
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              padding: const EdgeInsets.fromLTRB(0, 2, 20, 2),
              decoration: BoxDecoration(
                color: Colors.pink[900],
              ),
              child: Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    iconSize: 100,
                    padding:EdgeInsets.fromLTRB(0.1, 2, 2, 2),
                  icon: Image.asset('assets/logo.png'), onPressed: () => {}),
                  Text("My Cycles",
          style: TextStyle(fontFamily: 'Allura', fontSize: 40, color: Colors.pink[50]),),
                  
                ],),
              ),
              SizedBox(
                  height: 20,

                ),
                
                ListTile(
                  
                  tileColor: Colors.pink,
                  
                  trailing: Icon(Icons.add_box,color: Colors.pink[50],size: 40,),
                  title: Text("Health Tips",
                  style: TextStyle(fontSize: 20,color: Colors.pink[50], fontWeight: FontWeight.bold),)
                  ,
                  onTap: (){
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  height: 20,

                ),
                
                ListTile(
                  
                  tileColor: Colors.pink,
                  
                  trailing: Icon(Icons.plumbing, color: Colors.pink[50],size: 40,),
                  title: Text("Medicine",
                  style: TextStyle(fontSize: 20,color: Colors.pink[50], fontWeight: FontWeight.bold),)
                  ,
                  onTap: (){
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                ListTile(
                  
                  tileColor: Colors.pink,
                  
                  trailing: Icon(Icons.chat_bubble_rounded, color: Colors.pink[50],size: 40,),
                  title: Text("Ask For Help",
                  style: TextStyle(fontSize: 20,color: Colors.pink[50], fontWeight: FontWeight.bold),)
                  ,
                  onTap: (){
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                ListTile(
                  
                  tileColor: Colors.pink,
                  
                  trailing: Icon(Icons.email, color: Colors.pink[50],size: 40,),
                  title: Text("Feedback",
                  style: TextStyle(fontSize: 20,color: Colors.pink[50], fontWeight: FontWeight.bold),)
                  ,
                  onTap: (){
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  height: 190,
                ),
                ListTile(
                  leading: Icon(Icons.arrow_back, color: Colors.black,size: 40,),
                  title: Text("Back",
                  style: TextStyle(fontSize: 20,color: Colors.black, fontWeight: FontWeight.bold,),textAlign: TextAlign.right,),
                  onTap: (){
                    Navigator.pop(context);
                  },
                ),
          ],
          
        ),
        
        

        
        )
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
   

  }


