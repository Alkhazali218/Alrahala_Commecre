import 'package:alrahala_commecre/features/screen/Presentation/widgets/stack_item.dart';
import 'package:alrahala_commecre/features/stack%20user%20basic/Presentation/stack_user_view_basic.dart';
import 'package:alrahala_commecre/features/stack%20user%20star/Presentation/stack_user_view_star.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: camel_case_types
class screenViewBody extends StatelessWidget {
  const screenViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children:  [
       const SizedBox(height: 30),
        stackItem(
          onTap: () => Navigator.pushNamed(context,StackUserViewBasic.id),
          icons: FontAwesomeIcons.box,
          textProject: 'الخدمات الاساسية',
          textInside1: 'الحوالات الخارجية',
          textInside2: 'الحوالات الداخلية',
        ),
        stackItem(
          onTap: () => Navigator.pushNamed(context,StackUserViewStar.id),
          icons: FontAwesomeIcons.solidStar,
          textProject: 'الخدمات المميزة',
          textInside1: 'تحويل الاموال',
          textInside2: 'كشف الحساب',
        ),
      ],
    );
  }
}