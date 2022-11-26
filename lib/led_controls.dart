import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'constants.dart';

class LedControls extends StatefulWidget {
  const LedControls({super.key});

  @override
  State<LedControls> createState() => _LedControlsState();
}

class _LedControlsState extends State<LedControls> {
  bool _value = true;

  Future<String> _request(String url) async {
    final res = await http.get(Uri.http(apiRoot, url));

    return res.body;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('LED: ${_value ? 'On' : 'Off'}'),
        Switch(
            value: _value,
            onChanged: (value) async {
              final text = await _request(value ? '/led_on' : '/led_off');

              setState(() {
                _value = value;
              });

              Fluttertoast.showToast(msg: text);
            }),
      ],
    );
  }
}
