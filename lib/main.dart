import 'package:delete_provider/models/httpprovider.dart';
import 'package:delete_provider/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => HttpProvider(),
        child: HomePage(),
      ),
    );
  }
}
