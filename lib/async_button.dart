import 'package:flutter/material.dart';

class AsyncButton extends StatefulWidget {
  const AsyncButton({super.key, required this.onPressed, required this.child});
  final Widget child;
  final Future<void> Function() onPressed;

  @override
  State<AsyncButton> createState() => AsyncButtonState();
}

class AsyncButtonState extends State<AsyncButton> {
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
