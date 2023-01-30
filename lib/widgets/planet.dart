import 'dart:math' show cos, pi, sin;

import 'package:flutter/material.dart';

class Planet extends StatefulWidget {
  const Planet({
    super.key,
    this.asseOrizzontale = 50,
    this.asseVerticale = 50,
    required this.raggio,
    this.duration = 10000000,
    this.rotationZ = 0,
    this.color = Colors.white,
  });
  final int asseOrizzontale;
  final int asseVerticale;
  final int duration;
  final int raggio;
  final double rotationZ;
  final Color color;
  @override
  State<Planet> createState() => _PlanetState();
}

class _PlanetState extends State<Planet> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(microseconds: widget.duration),
    );

    _animation = Tween(
      begin: 0.0,
      end: 2 * pi,
    ).animate(_controller);

    _controller.repeat();
  }

  @override
  void didUpdateWidget(Planet oldWidget) {
    _controller.duration = Duration(microseconds: widget.duration);
    if (_controller.isAnimating) {
      _controller.repeat();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()..rotateZ(widget.rotationZ),
            child: Transform.translate(
              offset: Offset(
                widget.asseOrizzontale * widget.raggio * cos(_animation.value),
                widget.asseVerticale * widget.raggio * sin(_animation.value),
              ),
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: widget.color,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          );
        });
  }
}
