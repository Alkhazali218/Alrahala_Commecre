import 'package:alrahala_commecre/core/utils/helper/constant.dart';
import 'package:alrahala_commecre/features/password/Presentation/widgets/password_view_body.dart';
import 'package:flutter/material.dart';


// ignore: camel_case_types
class passwordView extends StatelessWidget {
  const passwordView({super.key});
  static String id  = 'password View';

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      foregroundColor: kpColor,
      forceMaterialTransparency: true,
      primary: true,
    ),
    body: passwordViewBody(),
  );
  }

}