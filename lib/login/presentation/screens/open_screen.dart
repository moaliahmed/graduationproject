import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:graduation_project/core/color_manger.dart';
import 'package:graduation_project/core/routes_manager.dart';
import 'package:graduation_project/login/presentation/screens/onboarding_Screen.dart';

import '../../../core/assets_manager.dart';

class OpenScreen extends StatefulWidget {
  const OpenScreen({super.key});

  @override
  State<OpenScreen> createState() => _OpenScreenState();
}

List text = ['CoinMoney'];

class _OpenScreenState extends State<OpenScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 7),
        () => Navigator.pushReplacementNamed(context, Routes.home));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(ImageAssets.coinMoneyIcon),
                const Gap(6),
                AnimatedTextKit(
                  totalRepeatCount: 2,
                  animatedTexts: [
                    for (final txt in text)
                      WavyAnimatedText(txt,
                          textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 52,
                              color: ColorManager.primary),
                          textAlign: TextAlign.center)
                  ],
                ),
              ],
            ), Padding(
              padding: const EdgeInsets.symmetric(vertical: 22.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width*.65,
                child: LinearProgressIndicator(color: ColorManager.primary),
              ),
            )
          ],
        ),
      ),
    );
  }
}
