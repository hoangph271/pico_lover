import 'package:flutter/material.dart';
import 'package:pico_lover/led_controls.dart';
import 'package:pico_lover/wheels_controls.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pico W',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PicoControls(title: 'Pico W'),
    );
  }
}

class PicoControls extends StatefulWidget {
  const PicoControls({super.key, required this.title});

  final String title;

  @override
  State<PicoControls> createState() => _PicoControlsState();
}

class _PicoControlsState extends State<PicoControls> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            LedControls(),
            Expanded(child: WheelsControls())
          ],
        ),
      ),
    );
  }
}
