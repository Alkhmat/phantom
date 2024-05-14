import 'package:flutter/material.dart';

class CustomRegisterField extends StatelessWidget {
  CustomRegisterField(
      {super.key,
      this.controller,
      this.prefixIcon,
      this.labelText,
      this.onChanged,
      this.keyboardType});
  TextEditingController? controller = TextEditingController();
  final Widget? prefixIcon;
  final String? labelText;
  final TextInputType? keyboardType;
  void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: TextFormField(
        onChanged: onChanged,
        controller: controller,
        style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: h * 0.022,
            fontStyle: FontStyle.italic,
            color: Colors.black87),
        keyboardType: keyboardType,
        decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black87, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          prefixIcon: prefixIcon,
          prefixIconColor: Colors.black87,
          labelText: labelText,
          labelStyle: TextStyle(
              fontSize: h * 0.018,
              fontStyle: FontStyle.italic,
              color: Colors.black),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black87, width: 2),
            borderRadius: BorderRadius.circular(50),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );
  }
}
