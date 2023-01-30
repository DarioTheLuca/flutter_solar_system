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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  // void _incrementVelocity() {
  //   setState(() {
  //     if (_duration > 100000) {
  //       _duration = _duration - 50000;
  //     }
  //   });

  //   _controller.duration = Duration(microseconds: _duration);
  //   if (_controller.isAnimating) {
  //     _controller.repeat();
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Stack(
          children: const <Widget>[
            Planet(
              asseOrizzontale: 80,
              asseVerticale: 50,
              raggio: 2,
              duration: 6000000,
              rotationZ: pi / 4,
              color: Colors.blue,
            ),
            Planet(
              asseOrizzontale: 80,
              asseVerticale: 50,
              raggio: 3,
              duration: 6000000,
              rotationZ: pi / 2,
              color: Colors.green,
            ),
            Planet(
              asseOrizzontale: 80,
              asseVerticale: 50,
              raggio: 0,
              color: Color.fromARGB(255, 207, 117, 15),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementVelocity,
      //   tooltip: 'Increment velocity',
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
