import 'package:flutter/material.dart';

class TextInputWidget extends StatelessWidget {
  final String label;
  final int? maxLines;
  TextEditingController controller;

  TextInputWidget({
    super.key,
    this.maxLines,
    required this.label,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 4,
          ),
          child: Text(label),
        ),
        TextField(
          maxLines: maxLines,
          controller: controller,
          onChanged: (value) => controller.text = value,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ],
    );
  }
}
