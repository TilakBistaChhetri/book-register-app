import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;

  final String label;

  final bool readOnly;

  final VoidCallback? onTap;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.label,
    this.readOnly = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      readOnly: readOnly,
      onTap: onTap,
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: readOnly ? const Icon(Icons.calendar_today) : null,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
