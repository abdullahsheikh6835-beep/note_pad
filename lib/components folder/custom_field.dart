import 'package:flutter/material.dart';

Widget customTextField({
  double borderRadius = 10,
  required String? hint,
  TextStyle? hintStyle,
  String? label,
  double? height,
  double? width,
  TextEditingController? controller,
  bool obscureText = false,
  Widget? prefixicon,
  Widget? suffixicon,
}) {
  return SizedBox(
    height: height,
    width: width,
    child: TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
        filled: true,
        fillColor:Color.fromARGB(67, 158, 158, 158),
        hintStyle: hintStyle ?? const TextStyle(),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color.fromARGB(100, 158, 158, 158),),
        ),
        prefixIcon: prefixicon,
        suffixIcon: suffixicon,
      ),
    ),
  );
}
