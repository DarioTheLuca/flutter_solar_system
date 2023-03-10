import 'package:flutter/material.dart';
import 'package:flutter_solar_system/widgets/planet.dart';

import 'dart:math' show pi;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter animation Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter animation demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int duration = 6000000;

  void _incrementVelocity() {
    setState(() {
      if (duration / 2 > 1000000 && duration.isEven) {
        duration = (duration / 2).round();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            Planet(
              horizontalaxis: 80,
              verticalAxis: 50,
              radius: 2,
              duration: duration,
              rotationZ: pi / 4,
              color: Colors.blue,
            ),
            Planet(
              horizontalaxis: 80,
              verticalAxis: 50,
              radius: 3,
              duration: duration,
              rotationZ: pi / 2,
              color: Colors.green,
            ),
            Planet(
              horizontalaxis: 80,
              verticalAxis: 50,
              radius: 3,
              duration: duration,
              rotationZ: pi / 3,
              color: const Color.fromARGB(255, 95, 78, 74),
            ),
            const Planet(
              horizontalaxis: 80,
              verticalAxis: 50,
              radius: 0,
              color: Color.fromARGB(255, 207, 117, 15),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementVelocity,
        tooltip: 'Double velocity',
        child: const Icon(Icons.add),
      ),
    );
  }
}
