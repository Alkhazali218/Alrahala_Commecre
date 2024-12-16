import 'package:alrahala_commecre/core/utils/helper/constant.dart';
import 'package:alrahala_commecre/core/utils/helper/thems.dart';
import 'package:alrahala_commecre/cubit/Auth%20cubit/Auth_cubit.dart';
import 'package:alrahala_commecre/cubit/Auth%20cubit/Auth_state.dart';
import 'package:alrahala_commecre/features/home/Presentation/home_view.dart';
import 'package:alrahala_commecre/features/login/Presentation/widgets/button_item.dart';
import 'package:alrahala_commecre/features/login/Presentation/widgets/button_text_item.dart';
import 'package:alrahala_commecre/features/login/Presentation/widgets/text_from_filed_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// ignore: must_be_immutable, camel_case_types
class registerViewBody extends StatelessWidget {
  registerViewBody({super.key});
  bool isLoading = false;
  TextEditingController userName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          isLoading = true;
        }
        if (state is AuthSucess) {
          Navigator.pushNamed(context, homeView.id);
          isLoading = false;
        }
        if (state is AuthError) {
          showSnackBar(context, state.message, Colors.red);
          isLoading = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
           progressIndicator: const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(kpColor),
            ),
          child: Padding(
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
                   onChanged: (p0) {
              
            },
                  hintText: 'اسم المستخدم',
                  prefixIcon: FontAwesomeIcons.user,
                  pass: false,
                  isSecurePassword: false,
                ),
                const SizedBox(height: 20),
                textFromFiledItem(
                   onChanged: (p0) {
              
            },
                  hintText: 'البريد الالكتروني',
                  prefixIcon: FontAwesomeIcons.envelope,
                  pass: false,
                  isSecurePassword: false,
                ),
                const SizedBox(height: 20),
                textFromFiledItem(
                   onChanged: (p0) {
              
            },
                  hintText: 'كلمة السر',
                  prefixIcon: Icons.password,
                  pass: true,
                  isSecurePassword: true,
                ),
                const SizedBox(height: 30),
                ButtonItem(
                  textButton: 'انشاء حساب',
                  onTap: () {
                    BlocProvider.of<AuthCubit>(context).register(
                        email: email.text,
                        password: password.text);
                  },
                ),
                const SizedBox(height: 20),
                buttonTextItem(
                  ifText: ' هل لديك حساب بالفعل؟',
                  textLandtextR: 'تسجيل الدخول',
                  onTap: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
