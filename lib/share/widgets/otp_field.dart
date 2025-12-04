import 'package:flutter/material.dart';

import 'verification_text_field.dart';

class OtpField extends StatefulWidget {
  final int length;
  final void Function(String otp) onCompleted;

  const OtpField({
    super.key,
    this.length = 4,
    required this.onCompleted,
  });

  @override
  State<OtpField> createState() => _OtpFieldState();
}

class _OtpFieldState extends State<OtpField> {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _controllers =
        List.generate(widget.length, (_) => TextEditingController());
    _focusNodes = List.generate(widget.length, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (var c in _controllers) {
      c.dispose();
    }
    for (var f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  void _onChanged(String value, int index) {
    if (value.isNotEmpty && index < widget.length - 1) {
      // move to next
      FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
    } else if (value.isEmpty && index > 0) {
      // move back
      FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
    }

    // check completed
    String otp = _controllers.map((c) => c.text).join();
    if (otp.length == widget.length && !_controllers.any((c) => c.text.isEmpty)) {
      widget.onCompleted(otp);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        widget.length,
            (index) => VerificationTextField(
          controller: _controllers[index],
          focusNode: _focusNodes[index],
          onChanged: (value) => _onChanged(value, index),
        ),
      ),
    );
  }
}
