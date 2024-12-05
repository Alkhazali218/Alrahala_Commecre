import 'package:alrahala_commecre/features/account%20statement/Presentation/account_statement_view.dart';
import 'package:alrahala_commecre/features/home/Presentation/home_view.dart';
import 'package:alrahala_commecre/features/login/Presentation/login_view.dart';
import 'package:alrahala_commecre/features/money%20transfer/Presentation/money_transfer_view.dart';
import 'package:alrahala_commecre/features/next%20ex/Presentation/next_ex_view.dart';
import 'package:alrahala_commecre/features/next/Presentation/next_view.dart';
import 'package:alrahala_commecre/features/password/Presentation/password_view.dart';
import 'package:alrahala_commecre/features/register/Presentation/register_view.dart';
import 'package:alrahala_commecre/features/screen/Presentation/screen_view.dart';
import 'package:alrahala_commecre/features/splash/Presentation/splash_view.dart';
import 'package:alrahala_commecre/features/stack%20user%20basic/Presentation/stack_user_view_basic.dart';
import 'package:alrahala_commecre/features/stack%20user%20star/Presentation/stack_user_view_star.dart';
import 'package:alrahala_commecre/features/support/Presentation/support_view.dart';
import 'package:alrahala_commecre/features/user/Presentation/user_view.dart';
import 'package:flutter/material.dart';





Map<String, Widget Function(BuildContext)> routes = {
  splashView.id: (context) => splashView(),
  loginView.id: (context) => const loginView(),
  registerView.id: (context) => const registerView(),
  homeView.id: (context) => const homeView(),
  passwordView.id: (context) => const passwordView(),
  userView.id: (context) => const userView(),
  supportView.id: (context) => const supportView(),
  screenView.id: (context) => const screenView(),
  StackUserViewBasic.id: (context) => const StackUserViewBasic(),
  StackUserViewStar.id: (context) => const StackUserViewStar(),
  nextView.id: (context) => const nextView(),
  NextExView.id:  (context) => const NextExView(),
  AccountStatementView.id: (context) => const AccountStatementView(),
  MoneyTransferView.id: (context) => const MoneyTransferView(),
  
};
