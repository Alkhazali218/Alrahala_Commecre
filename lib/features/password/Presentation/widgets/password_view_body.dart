import 'package:alrahala_commecre/core/utils/helper/thems.dart';
import 'package:alrahala_commecre/features/login/Presentation/widgets/button_item.dart';
import 'package:alrahala_commecre/features/login/Presentation/widgets/text_from_filed_item.dart';
import 'package:alrahala_commecre/features/verification/Presentation/verification_view.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: camel_case_types
class passwordViewBody extends StatelessWidget {
  const passwordViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
        const  SizedBox(height: 100),
          Text('البحث عن حساب',
          style: googleFont30,
          textAlign: TextAlign.right,
          ),
          Text('ادخل الرقم الهاتف',
          style: googleFont18,
          textAlign: TextAlign.right,
          ),
          const  SizedBox(height: 20),
          textFromFiledItem(
            hintText: 'رقم الهاتف',
             prefixIcon: FontAwesomeIcons.hashtag,
              pass: false,
              isSecurePassword: false,
              ),
              const  SizedBox(height: 5),
              Text('سوف تتلقى منا اشعارات عبر الواتساب لاغراض الامان وتسجيل الدخول',
              style: googleFont18.copyWith(fontSize: 13),
              textAlign: TextAlign.center,
              ),
              const  SizedBox(height: 30),
              ButtonItem(textButton: 'متابعة',
            onTap: () => Navigator.pushNamed(context,verificationView.id),
            ),
        ],
      ),
    );
  }

}