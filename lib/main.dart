import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
  final apiRoot = '192.168.0.106';

  void _request(String url) async {
    await http.get(Uri.http(apiRoot, url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            OutlinedButton(
                onPressed: () {
                  _request('/led_on');
                },
                child: const Text('LED On')),
            OutlinedButton(
                onPressed: () {
                  _request('/led_off');
                },
                child: const Text('LED Off')),
          ],
        ),
      ),
    );
  }
}
