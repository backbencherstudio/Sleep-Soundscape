import 'package:flutter/material.dart';

class SwitchButton extends StatelessWidget {
  const SwitchButton({
    super.key,
    this.isSwitchOn = false,
    required this.onChange,
  });

  final bool isSwitchOn;
  final ValueChanged<bool> onChange; // More idiomatic type for callback

  @override
  Widget build(BuildContext context) {
    return Switch(
      thumbIcon: WidgetStateProperty.all(
        const Icon(Icons.circle, size: 20, color: Colors.white),
      ),
      activeColor: Colors.green,
      inactiveTrackColor:  Colors.grey,
      activeTrackColor: const Color(0xFFFAD051),
      trackOutlineColor: WidgetStateColor.transparent,
      thumbColor: const WidgetStatePropertyAll<Color>(Colors.white),
      value: isSwitchOn,
      onChanged: onChange,
    );
  }
}