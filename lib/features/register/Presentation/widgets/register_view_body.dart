import 'package:alrahala_commecre/core/utils/helper/thems.dart';
import 'package:alrahala_commecre/features/home/Presentation/home_view.dart';
import 'package:alrahala_commecre/features/login/Presentation/widgets/button_item.dart';
import 'package:alrahala_commecre/features/login/Presentation/widgets/button_text_item.dart';
import 'package:alrahala_commecre/features/login/Presentation/widgets/text_from_filed_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: camel_case_types
class registerViewBody extends StatelessWidget {
  const registerViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: [
          Image.asset(assets.klogo, height: 150),
          Text(
            'انشاء حساب جديد',
            textAlign: TextAlign.right,
            style: googleFont30,
          ),
          const SizedBox(height: 5),
          Text(
            'شركة الرحالة القابضة الاولى',
            textAlign: TextAlign.right,
            style: googleFont18,
          ),
          const SizedBox(height: 50),
          textFromFiledItem(
            hintText: 'اسم المستخدم',
            prefixIcon: FontAwesomeIcons.user,
            pass: false,
            isSecurePassword: false,
          ),
          const SizedBox(height: 20),
          textFromFiledItem(
            hintText: 'رقم الهاتف',
            prefixIcon: FontAwesomeIcons.hashtag,
            pass: false,
            isSecurePassword: false,
          ),
          const SizedBox(height: 20),
          textFromFiledItem(
            hintText: 'كلمة المرور',
            prefixIcon: Icons.password,
            pass: true,
            isSecurePassword: true,
          ),
          const SizedBox(height: 30),
          ButtonItem(
            textButton: 'انشاء حساب جديد',
            onTap: () => Navigator.pushNamed(context, homeView.id),
          ),
          const SizedBox(height: 20),
          buttonTextItem(
            ifText: ' هل لديك حساب بالفعل؟',
            textLandtextR: 'تسجيل الدخول',
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
