import 'package:flutter/material.dart';

import '../../constents.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.height,
    this.maxLines = 1,
    this.onSaved,
    required this.controller,
    required this.keyboardType,
    this.onTap,
    this.prefixIcon,
  });
  final String height;
  final Function()? onTap;
  final int maxLines;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      keyboardType: keyboardType,
      controller: controller,
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'value is requird';
        } else {
          return null;
        }
      },
      maxLines: maxLines,
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        prefixIconColor: Colors.white,
        hintText: height,
        hintStyle: const TextStyle(color: kPrimaryColor),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(kPrimaryColor),
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
      
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color ?? Colors.white),
      
    );
  }
}
