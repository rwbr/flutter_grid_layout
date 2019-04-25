import 'package:flutter/material.dart';
import './src/widgets/grid_layout_widget.dart';

void main() => runApp(GridLayoutApp());


class GridLayoutApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grid Layout',
      theme: ThemeData(
        backgroundColor: Color(0xFF222F5F),
        primaryColorLight: Color(0xFFECEEFF),
        primaryColorDark: Color(0xFF4A5387),
        primaryColor: Color(0xFF555D92),
        accentColor: Color(0xFFCFA616),
        iconTheme: IconThemeData(
          color: Color(0xFFCFA616),
        ),
        textTheme: TextTheme(
          title: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      home: GridLayoutOrientation(title: 'Grid Layout'),
    );
  }
}