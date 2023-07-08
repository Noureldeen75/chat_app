import 'package:flutter/material.dart';

double deviceHeight(BuildContext context) => MediaQuery.of(context).size.height;

double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

double keyboardHeight(BuildContext context) =>
    MediaQuery.of(context).viewInsets.bottom;
