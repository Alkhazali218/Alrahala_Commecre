import 'package:alrahala_commecre/core/utils/helper/constant.dart';
import 'package:alrahala_commecre/core/utils/helper/thems.dart';
import 'package:alrahala_commecre/features/home/Presentation/home_view.dart';
import 'package:alrahala_commecre/features/login/Presentation/widgets/button_item.dart';
import 'package:alrahala_commecre/features/login/Presentation/widgets/button_text_item.dart';
import 'package:alrahala_commecre/features/login/Presentation/widgets/text_from_filed_item.dart';
import 'package:alrahala_commecre/features/password/Presentation/password_view.dart';
import 'package:alrahala_commecre/features/register/Presentation/register_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
   return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Image.asset(assets.klogo, height: 150),
            Text(
              ' ! مرحبا بك',
              textAlign: TextAlign.right,
              style: googleFont30,
            ),
             const SizedBox(height: 5),
            Text(
              'قم بتسجيل الدخول للاستمرار',
              textAlign: TextAlign.right,
              style: googleFont18,
            ),
            const SizedBox(height: 50),
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
             ButtonItem(textButton: 'تسجيل الدخول',
            onTap: () => Navigator.pushNamed(context,homeView.id),
            ),
            const SizedBox(height: 20),
             GestureDetector(
              onTap: () => Navigator.pushNamed(context,passwordView.id),
               child: Text(
                'هل نسيت كلمة السر؟',
                textAlign: TextAlign.center,
                style: googleFont18.copyWith(
                  color: kpColor,
                  fontSize: 14,
                ),
                           ),
             ),
            const SizedBox(height: 30),
            buttonTextItem(
              ifText: ' ليس لديك حساب؟',
              textLandtextR: 'انشاء حساب',
              onTap: () => Navigator.pushNamed(context,registerView.id),
            ),
          ],
        ),
      );
    
  }

}