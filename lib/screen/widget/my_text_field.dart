import 'package:flutter/material.dart';


class MyTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  MyTextField({required this.hintText, required this.obscureText, required TextEditingController controller});

  @override
  Widget build(BuildContext context) {
    return  TextFormField(  validator: (value)
    {
      if (value!.isEmpty) {
        return 'field is empty!';
      }
      return null;
    },
      obscureText: obscureText,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey),
      ),
    ) ;
  }
}
