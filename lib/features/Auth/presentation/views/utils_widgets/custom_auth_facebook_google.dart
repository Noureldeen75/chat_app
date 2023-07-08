import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomAuthFacebookGoogle extends StatelessWidget {
  const CustomAuthFacebookGoogle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          padding: EdgeInsets.all(7.0),
          decoration: BoxDecoration(
            color: Colors.blue[800],
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Row(children: [
            Icon(Icons.facebook),
            SizedBox(
              width: 8.0,
            ),
            Text(
              "Facebook",
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ]),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
          decoration: BoxDecoration(
            color: Colors.red[800],
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Row(children: [
            Text(
              "G",
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 22.0),
            ),
            SizedBox(
              width: 8.0,
            ),
            Text(
              "Google",
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ]),
        ),
      ],
    );
  }
}
