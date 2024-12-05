import 'package:alrahala_commecre/core/utils/helper/constant.dart';
import 'package:alrahala_commecre/core/utils/helper/thems.dart';
import 'package:alrahala_commecre/features/user/Presentation/widgets/text_item.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class CloumItemUser extends StatelessWidget {
  const CloumItemUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Text(
          'الرصيد الحالي',
          style: googleFont30.copyWith(color: Colors.black87, fontSize: 16),
        ),
        const SizedBox(height: 5),
        Text(
          '20,250,098',
          style: googleFont30.copyWith(color: kpColor),
        ),
        const SizedBox(height: 20),
        const textItem(
          textItemOne: '9685746146894321',
          textitemTwo: 'رقم الحساب',
        ),
        const Divider(
          color: colorStack,
          thickness: 0.6,
          indent: 18,
          endIndent: 18,
        ),
        const textItem(
          textItemOne: '0921483085',
          textitemTwo: 'رقم الهاتف',
        ),
        const Divider(
          color: colorStack,
          thickness: 0.6,
          indent: 18,
          endIndent: 18,
        ),
        const textItem(textItemOne: 'صالح الخزعلي', textitemTwo: 'الاسم'),
        const Divider(
          color: colorStack,
          thickness: 0.6,
          indent: 18,
          endIndent: 18,
        ),
        const textItem(textItemOne: 'البيضاء', textitemTwo: 'الفرع'),
      ],
    );
  }
}
