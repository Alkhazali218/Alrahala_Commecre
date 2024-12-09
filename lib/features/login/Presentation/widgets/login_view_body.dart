import 'package:alrahala_commecre/core/utils/helper/constant.dart';
import 'package:alrahala_commecre/core/utils/helper/thems.dart';
import 'package:alrahala_commecre/cubit/Auth%20cubit/Auth_cubit.dart';
import 'package:alrahala_commecre/cubit/Auth%20cubit/Auth_state.dart';
import 'package:alrahala_commecre/features/home/Presentation/home_view.dart';
import 'package:alrahala_commecre/features/login/Presentation/widgets/button_item.dart';
import 'package:alrahala_commecre/features/login/Presentation/widgets/button_text_item.dart';
import 'package:alrahala_commecre/features/login/Presentation/widgets/text_from_filed_item.dart';
import 'package:alrahala_commecre/features/password/Presentation/password_view.dart';
import 'package:alrahala_commecre/features/register/Presentation/register_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// ignore: must_be_immutable
class LoginViewBody extends StatelessWidget {
  LoginViewBody({super.key});
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is loadingState) {
          isLoading = true;
        }
        if (state is sucessState) {
          Navigator.pushNamed(context, homeView.id);
          isLoading = false;
        }
        if (state is errorState) {
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
                  controller: email,
                  hintText: 'البريد الالكتروني',
                  prefixIcon: FontAwesomeIcons.envelope,
                  pass: false,
                  isSecurePassword: false,
                ),
                const SizedBox(height: 20),
                textFromFiledItem(
                  controller: password,
                  hintText: 'كلمة المرور',
                  prefixIcon: Icons.password,
                  pass: true,
                  isSecurePassword: true,
                ),
                const SizedBox(height: 30),
                ButtonItem(
                  textButton: 'تسجيل الدخول',
                  onTap: () {
                    BlocProvider.of<AuthCubit>(context)
                        .login(email: email.text, password: password.text);
                  },
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, passwordView.id),
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
                  onTap: () => Navigator.pushNamed(context, registerView.id),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
