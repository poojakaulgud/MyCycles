// @dart=2.9
// import 'package:contactus/contactus.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:my_cycles/aboutus.dart';
// import 'package:my_cycles/community.dart';
import 'package:my_cycles/main.dart';
import 'package:my_cycles/tips.dart';
import 'package:my_cycles/tips_card.dart';


const magenta = const Color(0x8e3a59);
void main()async {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyCycles()
      
    ),
  );
}

class HealthTips extends StatefulWidget {
  

  @override
  _HealthTipsState createState() => _HealthTipsState();
}

class _HealthTipsState extends State<HealthTips> {
  List<HealthTip> health_tips=[
    HealthTip(tip: 'Attitudes & healthy periods',
     author: 'Aditi',
      content:'It’s thought that the attitude women develop towards their period can affect their experience of it.You may have developed a particular way of thinking about your period from women around you. early experiences of having your period may also affect your experiences into the future' ),
     HealthTip(tip:'Exercise, diet & periods', author: 'Pooja', content: "Diet and exercise bring a range of health benefits as well as improving your experience of having periods. Studies have found that women who exercise regularly are less likely to suffer menstrual pain, cramps and mood disturbance. We are not certain why exercise is helpful for PMS but studies demonstrate that exercise can release ‘happy’ hormones such as serotonin and endorphins, which may explain the benefit."),
      HealthTip(tip:'Sleep, sunshine & vitamin D', author: 'Bhavik', content: "Sleep, sunshine and vitamin D play a vital role in our general health and may help to improve our menstrual health as well.Studies have found that sleep disturbance is common in women who suffer severe PMS. Poor sleep can also contribute to mood disturbance, hormone irregularities and disturbed menstrual cycles"),
       HealthTip(tip: 'Physical therapies', author: 'Harsh', content: "There are many alternative approaches that aim to improve the experience of menstruation. Some are supported by good evidence while others may simply improve women's sense of wellbeing.Research suggests some physical therapies such as local heat application (heat packs), TENS (transcutaneous electrical nerve stimulation), acupuncture and acupressure are helpful for reducing menstrual pain and cramps"),
        HealthTip(tip: 'Yoga and mindfulness meditation', author: 'Chaitanya', content: "If you are stressed, you are more likely to suffer severe symptoms of PMS and experience poorer quality of life. Regular relaxation may be helpful in reducing severe PMS. Yoga has been used for thousands of years as a wholistic approach to health and wellbing. Some women may find yoga helpful in easing menstrual pain."),
        HealthTip(tip: 'Herbal remedies and Massage', author: 'Malay', content: "Some herbal remedies may have benefits for women with PMS. It's very important to check with your doctor that it is safe to use herbal remedies and treatments, particularly if you are taking other medication.A small study found that weekly massages over five weeks improved the level of pain and mood disorders and reduced fluid retention experienced by women during their menstrual cycle."),

  ];
    
  
  // ignore: non_constant_identifier_names
   

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
            "Health Tips",
            style: TextStyle(fontFamily: 'Allura', fontSize: 30),
          ),
          backgroundColor: Colors.pink[900],
          centerTitle: true,
          elevation: 5.0,
        ),
        body: Center(
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
            child: ListView(
            children: health_tips
                .map((healthTip) => HealthTipCard(
                      healthTip: healthTip,
                      
                    ))
                .toList()) ,
            ),


        ),
        
        
    );
      
      // This trailing comma makes auto-formatting nicer for build methods.
    
  }
   

  }


