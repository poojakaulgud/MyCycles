import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'tips.dart';
class HealthTipCard  extends StatelessWidget {
  HealthTip healthTip;
  HealthTipCard ({required this.healthTip });

  @override
  Widget build(BuildContext context) {
    return Card(
      
      margin: EdgeInsets.all(10),
      color: Colors.pink[900]!.withOpacity(0.9),
      child: Padding(padding: EdgeInsets.all(12),
      
      child: Column(
        
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:<Widget>[
          Padding(padding: const EdgeInsets.all(16.0),
          child: Text(
            healthTip.tip + "\n" + "-" + healthTip.author,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15, fontFamily: 'Poppins'),
        

          ),),
          
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: ReadMoreText(
                   healthTip.content ,
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  colorClickableText: Colors.white,
                  trimCollapsedText: '...SHOW MORE',
                  trimExpandedText: ' SHOW LESS',
                  style: TextStyle(color: Colors.pink[100], fontFamily: 'Poppins'),
                ),
              ),
              
            ],
             

       
      

      
      ),),
      
    );
  }
}

