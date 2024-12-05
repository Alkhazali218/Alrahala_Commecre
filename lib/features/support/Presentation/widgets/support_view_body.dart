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
                onTap:() => _launchWhatsApp(phoneNumber: '218915511445'),
                textSupport: ' الدعم الفني',
                iconSupport: FontAwesomeIcons.whatsapp,
              ),
              stackItemSupport(
                onTap: () => _launchURL(url: 'https://rhalla.online/'),
                textSupport: 'موقعنا الالكتروني',
                iconSupport: Icons.travel_explore,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _launchWhatsApp({required String phoneNumber}) async {
    final Uri url = Uri.parse('https://wa.me/$phoneNumber');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      print('Could not launch $url');
    }
  }
  Future<void> _launchURL({required String url}) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  }