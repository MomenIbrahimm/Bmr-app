import 'package:flutter/material.dart';

Color b = Colors.black38;
Color w = Colors.white70;
Color g = Colors.green;

Widget defaultContainer({text, required IconData icon, color, size,required Function onTap}) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 45.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: color
        ),
        child: GestureDetector(
          onTap: (){
            onTap();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon),
              const SizedBox(width: 7.5,),
              Text(text, style: TextStyle(fontSize: size),),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget defaultText({text, required double size, fontWeight,color}) {
  return Text(text, style: TextStyle(fontSize: size, fontWeight: fontWeight,color: color),);
}

TableRow buildRow(List<String> cells,
    {double size = 18.0,
      FontWeight fontWeight = FontWeight.bold,
      Color color = Colors.black54}) {
  return TableRow(
      children:
      cells.map((cell) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(cell,style:  TextStyle(fontSize:size,fontWeight: fontWeight,color:color,),),
      )).toList()
  );
}
