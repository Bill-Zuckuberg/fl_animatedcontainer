import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AnimatedContainerExample(title: 'Flutter Demo Home Page'),
    );
  }
}

class AnimatedContainerExample extends StatefulWidget {
  const AnimatedContainerExample({Key? key, required this.title})
      : super(key: key);
  final String title;

  @override
  State<AnimatedContainerExample> createState() => _AnimatedContainerState();
}

class _AnimatedContainerState extends State<AnimatedContainerExample> {
  final _rd = Random();
  double _size = 15;
  double _height = 100;
  double _width = 100;
  double _borderRadius = 8;
  Color _color = Colors.blue;

  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          margin: const EdgeInsets.all(8),
          height: _height,
          width: _width,
          decoration: BoxDecoration(
              color: _color,
              borderRadius: BorderRadius.circular(_borderRadius)),
          duration: const Duration(seconds: 1),
          curve: Curves.fastLinearToSlowEaseIn,
          child: const FlutterLogo(),
        ),
        ElevatedButton.icon(
            onPressed: () {
              setState(() {
                _width = _rd.nextInt(100).toDouble() + 50;
                _height = _rd.nextInt(100).toDouble() + 50;
                _borderRadius = _rd.nextInt(100).toDouble();
                _color = Color.fromRGBO(
                    _rd.nextInt(256), _rd.nextInt(256), _rd.nextInt(256), 1);
              });
            },
            icon: const Icon(Icons.update),
            label: const Text('Update'))
      ],
    );
  }
}
