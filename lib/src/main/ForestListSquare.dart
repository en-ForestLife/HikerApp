import 'package:flutter/material.dart';

class ForestListSquare extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        width: 450,
        height: 510,
        child:
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(
                    "https://a.cdn-hotels.com/gdcs/production1/d1156/f6d7ba6d-b1b2-4cc6-bc62-9cef6e70db29.jpg?impolicy=fcrop&w=800&h=533&q=medium",
                    width:450,
                    height:400,
                    fit: BoxFit.fill
                ),
              ),
              Column(

                children:<Widget> [
                Text('\n한라산', style:TextStyle(fontSize: 14, fontWeight: FontWeight.bold, letterSpacing: 2.0), textAlign: TextAlign.left,),
                Text('화산이 잉태한 남한 최고(最高)의 영산', style: TextStyle(fontSize: 14,)),
                Text('제주도 제주시, 서귀포시', style: TextStyle(fontSize: 14,)),
                Text('1947m', style: TextStyle(fontSize: 14,)),
              ]
              )
            ]
        ),
        ),
    );
  }
}
