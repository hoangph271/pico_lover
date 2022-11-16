import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

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

class AsyncButton extends StatefulWidget {
  const AsyncButton({super.key, required this.onPressed, required this.child});
  final Widget child;
  final Future<void> Function() onPressed;

  @override
  State<AsyncButton> createState() => _AsyncButtonState();
}

class _AsyncButtonState extends State<AsyncButton> {
  var _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: _isLoading
            ? null
            : () async {
                setState(() {
                  _isLoading = true;
                });
                await widget.onPressed();
                setState(() {
                  _isLoading = false;
                });
              },
        child: widget.child);
  }
}

class _PicoControlsState extends State<PicoControls> {
  final apiRoot = '192.168.0.106';

  Future<String> _request(String url) async {
    final res = await http.get(Uri.http(apiRoot, url));

    return res.body;
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
            AsyncButton(
                onPressed: () async {
                  final text = await _request('/led_on');

                  Fluttertoast.showToast(msg: text);
                },
                child: const Text('LED On')),
            AsyncButton(
                onPressed: () async {
                  final text = await _request('/led_off');

                  Fluttertoast.showToast(msg: text);
                },
                child: const Text('LED Off')),
          ],
        ),
      ),
    );
  }
}
