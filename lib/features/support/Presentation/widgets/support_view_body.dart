import 'package:alrahala_commecre/features/info/Presentation/info_view.dart';
import 'package:alrahala_commecre/features/support/Presentation/widgets/stack_item_support.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: camel_case_types
class supportViewBody extends StatelessWidget {
  const supportViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
       const SizedBox(height: 50),
        Padding(
          padding:const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              stackItemSupport(
                onTap: _launchWhatsApp,
                textSupport: ' الدعم الفني',
                iconSupport: FontAwesomeIcons.whatsapp,
              ),
              stackItemSupport(
                onTap: () => Navigator.pushNamed(context,infoView.id),
                textSupport: 'حول التطبيق',
                iconSupport: Icons.info,
              ),
            ],
          ),
        ),
      ],
    );
  }
 final String phoneNumber = '218910690833';

  Future<void> _launchWhatsApp() async {
    final Uri url = Uri.parse('https://wa.me/$phoneNumber');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      print('Could not launch $url');
    }
  }
  }