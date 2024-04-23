import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../component/chart_state.dart';

class StatisticsView extends StatefulWidget {
  const StatisticsView({super.key});

  @override
  State<StatisticsView> createState() => _StatisticsViewState();
}

class _StatisticsViewState extends State<StatisticsView> {
  final List day = ['day', 'weak', 'month', 'year'];

  int indexColor = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const Gap(20),
                  const Text(
                    'Statistics',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 9),
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ...List.generate(
                          day.length,
                          (index) => buttonStatistic(
                            day[index],
                            index,
                            () {
                              setState(
                                () {
                                  indexColor = index;
                                },
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  const Gap(20),
                  const ChartState()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buttonStatistic(String name, int index, Function()? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: indexColor == index
              ? const Color.fromARGB(255, 47, 125, 121)
              : Colors.white,
        ),
        child: Center(
          child: Text(
            name,
            style: TextStyle(
              color: indexColor == index ? Colors.white : Colors.black,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
