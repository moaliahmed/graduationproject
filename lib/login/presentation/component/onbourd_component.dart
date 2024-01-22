import 'package:flutter/material.dart';
import 'package:graduation_project/core/color_manger.dart';
import 'package:graduation_project/core/routes_manager.dart';

class OnboardComponent extends StatelessWidget {
  const OnboardComponent(
      {super.key, required this.pageIndex, required this.function});

  final int pageIndex;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Positioned(
            bottom: 110,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      demoData[pageIndex].image,
                    ),
                    fit: BoxFit.fitWidth),
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            left: 20,
            right: 20,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 250,
              decoration: const BoxDecoration(
                color: Colors.white54,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      demoData[pageIndex].title,
                      style: const TextStyle(
                          fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      demoData[pageIndex].description,
                      style:
                          const TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                    const Spacer(),

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OnBoard {
  final String image, title, description;

  OnBoard({
    required this.image,
    required this.title,
    required this.description,
  });
}

// OnBoarding content list
final List<OnBoard> demoData = [
  OnBoard(
      image: 'assets/images/illustration.png',
      title: "Take hold of your finances",
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut eget mauris massa pharetra.'),
  OnBoard(
      image: 'assets/images/illustration1.png',
      title: "Smart trading tools",
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut eget mauris massa pharetra.'),
  OnBoard(
      image: 'assets/images/illustration2.png',
      title: "Invest in the future",
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut eget mauris massa pharetra.'),
];
