import 'package:alrahala_commecre/core/utils/helper/constant.dart';
import 'package:alrahala_commecre/features/next%20ex/Presentation/widgets/next_ex_view_body.dart';
import 'package:flutter/material.dart';


class NextExView extends StatelessWidget {
  const NextExView({super.key});

  static String id = 'NextExView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: kcolor,
      foregroundColor: kprimaryColor,
    ),
    body: NextExViewBody(),
    );
  }
}