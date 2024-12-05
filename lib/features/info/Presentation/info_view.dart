import 'package:alrahala_commecre/core/utils/helper/constant.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class infoView extends StatelessWidget {
  const infoView({super.key});
  static String id = 'info View';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar:AppBar(
      foregroundColor: kpColor,
      forceMaterialTransparency: true,
      primary: true,
    ),
    );
  }

}