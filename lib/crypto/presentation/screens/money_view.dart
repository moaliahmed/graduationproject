import 'package:flutter/material.dart';

import '../component/home_part_one.dart';
import '../component/home_part_two.dart';

class MoneyView extends StatefulWidget {
  const MoneyView({super.key});

  @override
  State<MoneyView> createState() => _MoneyViewState();
}

class _MoneyViewState extends State<MoneyView> {
  var pageController=PageController();

  int ind = 0;

  final List _list = const [PartOne(), PartTwo()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: PageView.builder(
        controller: pageController,
        scrollDirection: Axis.vertical,
        itemCount: _list.length,
        itemBuilder: (context, index) {
          return _list[index];
        },
        onPageChanged: (value) => setState(() {
          ind = value;
        }),
      ),
    );
  }
}
