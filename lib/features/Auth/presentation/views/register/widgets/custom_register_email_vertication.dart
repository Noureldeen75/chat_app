import 'package:chat_app/core/utils/Colors/ColorsClass.dart';
import 'package:chat_app/core/utils/text_styles/TextStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomRegisterEmailVertication extends StatelessWidget {
  const CustomRegisterEmailVertication({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 7.0, horizontal: 10.0),
      color: Color.fromARGB(255, 225, 212, 99),
      child: Row(
        children: [
          Icon(Icons.mail),
          SizedBox(
            width: 7.0,
          ),
          Text("Email Vertication", style: TextStyles.textSize16),
          Spacer(),
          InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: ColorsClass.mainBlue),
              child: Text("Send",
                  style: TextStyles.textSize16.copyWith(color: Colors.white)),
            ),
          )
        ],
      ),
    );
  }
}
