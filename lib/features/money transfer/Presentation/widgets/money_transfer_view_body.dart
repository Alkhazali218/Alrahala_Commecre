import 'package:alrahala_commecre/features/money%20transfer/Presentation/widgets/money_transfer_item.dart';
import 'package:flutter/material.dart';

class MoneyTransferViewBody extends StatelessWidget {
  const MoneyTransferViewBody({super.key});
  @override
  Widget build(BuildContext context) {
   return const Column(
    mainAxisAlignment: MainAxisAlignment.end,
     children: [
       moneyTransferItem(),
     ],
   );
  }
}