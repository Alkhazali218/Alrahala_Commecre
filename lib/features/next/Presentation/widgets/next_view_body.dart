import 'package:alrahala_commecre/features/login/Presentation/widgets/text_from_filed_item.dart';
import 'package:alrahala_commecre/features/next/Presentation/widgets/check_item.dart';
import 'package:alrahala_commecre/features/stack%20user%20basic/Presentation/stack_user_view_basic.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: camel_case_types
class nextViewBody extends StatelessWidget {
  const nextViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: [
          const SizedBox(height: 40),
          textFromFiledItem(
            hintText: 'الاسم المستلم',
            prefixIcon: FontAwesomeIcons.user,
            pass: false,
            isSecurePassword: false,
          ),
          const SizedBox(height: 15),
          textFromFiledItem(
            hintText: 'رقم الهاتف المستلم',
            prefixIcon: FontAwesomeIcons.hashtag,
            pass: false,
            isSecurePassword: false,
          ),
          const SizedBox(height: 15),
          
          textFromFiledItem(
            hintText: 'المدينة',
            prefixIcon: FontAwesomeIcons.treeCity,
            pass: false,
            isSecurePassword: false,
          ),
          const SizedBox(height: 15),
          textFromFiledItem(
            hintText: 'القيمة المراد ارسالها',
            prefixIcon: FontAwesomeIcons.dollarSign,
            pass: false,
            isSecurePassword: false,
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              CheckItem(
                onTap: () => Navigator.pushNamed(context,StackUserViewBasic.id),
                textCheckItem: 'تاكيد',
              ),
              const SizedBox(width: 10),
              CheckItem(
                onTap: () => Navigator.pushNamed(context,StackUserViewBasic.id),
                textCheckItem: 'الغاء الامر',
              ),
            ],
          )
        ],
      ),
    );
  }
}
