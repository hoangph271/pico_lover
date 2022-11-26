import 'package:flutter/widgets.dart';
import 'package:pico_lover/async_button.dart';
import 'package:pico_lover/pico_api.dart';

class WheelsControls extends StatefulWidget {
  const WheelsControls({super.key});

  @override
  State<WheelsControls> createState() => _WheelsControlsState();
}

class _WheelsControlsState extends State<WheelsControls> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AsyncButton(
            onPressed: () async {
              await sendPicoRequest('ui/motors/turn_left');
            },
            child: const Text('Turn Left')),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AsyncButton(
                onPressed: () async {
                  await sendPicoRequest('ui/motors/forward_both');
                },
                child: const Text('Forward')),
            AsyncButton(
                onPressed: () async {
                  await sendPicoRequest('ui/motors/backward_both');
                },
                child: const Text('Forward')),
          ],
        ),
        AsyncButton(
            onPressed: () async {
              await sendPicoRequest('ui/motors/turn_right');
            },
            child: const Text('Turn Right')),
      ],
    );
  }
}
