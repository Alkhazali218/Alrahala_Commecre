import 'package:alrahala_commecre/core/utils/helper/constant.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable, camel_case_types
class textFromFiledItem extends StatefulWidget {
  textFromFiledItem({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    required this.pass,
    required this.isSecurePassword,
    required this.onChanged,
    
  });
  final String hintText;
  final IconData prefixIcon;
  final bool pass;
  bool isSecurePassword;
  Function(String) onChanged;
  

  @override
  State<StatefulWidget> createState() {
    return _textFromFiledItemState();
  }
}

// ignore: camel_case_types
class _textFromFiledItemState extends State<textFromFiledItem> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'رجاءا ادخل البيانات';
          }
          return null;
        },
        onChanged: widget.onChanged,
        textAlign: TextAlign.right,
        obscureText: widget.isSecurePassword,
        decoration: InputDecoration(
          labelText: widget.hintText,
          labelStyle: const TextStyle(color: kcolor),
          hintText: widget.hintText,
          prefixIcon: Icon(widget.prefixIcon, color: kpColor),
          suffixIcon: widget.pass ? togglePassword() : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: kcolor),
          ),
        ),
      ),
    );
  }

  Widget togglePassword() {
    return IconButton(
      onPressed: () {
        setState(() {
          widget.isSecurePassword = !widget.isSecurePassword;
        });
      },
      icon: widget.isSecurePassword
          ? const Icon(
              Icons.visibility_off,
              color: kpColor,
            )
          : const Icon(
              Icons.visibility,
              color: kpColor,
            ),
    );
  }
}
