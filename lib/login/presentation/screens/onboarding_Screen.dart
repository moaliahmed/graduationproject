import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_project/core/string_manager.dart';
import 'package:graduation_project/login/presentation/component/dotindicator_component.dart';
import 'package:graduation_project/login/presentation/component/onbourd_component.dart';

import '../../../core/assets_manager.dart';
import '../../../core/color_manger.dart';
import '../../../core/routes_manager.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  late PageController _pageController;
  int _pageIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    _timer = Timer.periodic(
      const Duration(seconds: 6),
      (timer) {
        if (_pageIndex < 2) {
          ++_pageIndex;
        } else {
          _pageIndex = 0;
        }
        _pageController.animateToPage(_pageIndex,
            duration: const Duration(milliseconds: 350), curve: Curves.easeIn);
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 10,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: SvgPicture.asset(ImageAssets.coinMoneyLogo),
              ),
            ),
            PageView.builder(
              onPageChanged: (value) {
                setState(
                  () {
                    _pageIndex = value;
                  },
                );
              },
              controller: _pageController,
              itemCount: 3,
              itemBuilder: (context, index) {
                return OnboardComponent(
                  pageIndex: index,
                  function: () {
                    _pageController.animateToPage(++_pageIndex,
                        duration: const Duration(milliseconds: 350),
                        curve: Curves.easeIn);
                  },
                );
              },
            ),
            Positioned(
              bottom: 50,
              left: 20,
              right: 20,
              child: InkWell(
                onTap: () {
                  _pageIndex != 2 ?
                    _pageController.animateToPage(++_pageIndex,
                        duration: const Duration(milliseconds: 350),
                        curve: Curves.easeIn)

                      : Navigator.pushReplacementNamed(context, Routes.signIn);
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: ColorManager.primary,
                  ),
                  height: 52,
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    _pageIndex != 2 ? AppString.next : AppString.skip,
                    style: const TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 25,
              //right: MediaQuery.of(context).size.width / 2,
              left: MediaQuery.of(context).size.width / 2 - 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                    demoData.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: DotIndicator(
                        isActive: index == _pageIndex,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
