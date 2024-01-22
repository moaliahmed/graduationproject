import 'package:flutter/material.dart';
import 'package:graduation_project/home/presentation/screens/converters_view.dart';
import 'package:graduation_project/home/presentation/screens/money_view.dart';
import '../component/home_part_one.dart';
import '../component/home_part_two.dart';
import 'gold_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;
  final List<Widget> _view = const [
    MoneyView(),
    GoldView(),
    ConvertersView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: _view,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        iconSize: 20,
        selectedIconTheme:const IconThemeData(size: 32),
        onTap: (value) {
          currentIndex = value;
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(
            label: 'Currencies',
            icon: Icon(
              Icons.monetization_on_rounded,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Gold/silver',
            icon: Icon(Icons.grid_goldenratio),
          ),
          BottomNavigationBarItem(
            label: 'Converters',
            icon: Icon(Icons.repeat),
          )
        ],
      ),
    );
  }

}
