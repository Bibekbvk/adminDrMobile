import 'package:drmobileadmin/Splash.dart';
import 'package:flutter/material.dart';

import 'home.dart';

void main() => runApp(MaterialApp(
  theme:ThemeData(
    primaryColor: Colors.purple[600],
    splashColor: Colors.white60,
    backgroundColor: Colors.blue[400]
  ),
      home: splash(),
    ));
