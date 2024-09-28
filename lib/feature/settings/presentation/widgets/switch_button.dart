import 'package:dealdash/core/resources/color_manger/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';

class SwitchButton extends StatefulWidget {
  const SwitchButton({super.key});

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {

  final _controller = ValueNotifier<bool>(false);

  bool _checked = false;

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      setState(() {
        if (_controller.value) {
          _checked = true;
        } else {
          _checked = false;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return            AdvancedSwitch(
      controller: _controller,
      inactiveColor: ColorManager.gray,
      activeColor: ColorManager.primary,
      // activeChild: const Text('ON'),
      // inactiveChild: const Text('OFF'),
      // width: 65.0,
      onChanged: (value) {},
    );
  }
}
