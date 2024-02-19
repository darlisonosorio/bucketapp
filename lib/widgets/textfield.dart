import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends TextFormField {
  final String label;
  TextEditingController? controller;
  Widget? icon;
  TextInputAction? action;

  AppTextField({
    super.key,
    required this.label,
    this.icon,
    this.action,
    this.controller,
  }) : super(
          decoration: InputDecoration(
            label: Text(label),
            counter: const SizedBox(height: 0),
            icon: icon,
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.cyan, width: 1.0),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.cyan, width: 2.0),
            ),
          ),
          maxLines: 1,
          maxLength: 5,
          textInputAction: action ?? TextInputAction.next,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          keyboardType: const TextInputType.numberWithOptions(decimal: false),
          controller: controller,
        );
}
