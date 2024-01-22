import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:graduation_project/home/presentation/component/chart_state.dart';
import 'package:graduation_project/home/presentation/component/testa.dart';

import '../../../core/routes_manager.dart';
import 'head_card_component.dart';
class PartOne extends StatefulWidget {
  const PartOne({super.key});

  @override
  State<PartOne> createState() => _PartOneState();
}

class _PartOneState extends State<PartOne> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            //ToDo Function
            print('priced in profile icon');
          },
          child: Image.asset(
            'assets/icons/Profile.png',
            color: Colors.white,
          ),
        ),
        title: Image.asset(
          'assets/images/Coinmoney.png',
          color: Colors.white,
        ),
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: () {
              // todo function
              print('priced in setting icon');
              Navigator.pushNamed(context, Routes.settings);
            },
            child: Image.asset(
              'assets/icons/Setting_line_light.png',
              color: Colors.white,
            ),
          ),
          const Gap(10)
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 160,
              child: headCardComponent(context),
            ),
            ChartState(),
            LineChartSample2()
          ],
        ),
      ),
    );
  }


}