import 'package:flutter/material.dart';
import 'package:graduation_project/crypto/presentation/component/switch_button_component.dart';

import '../../data/datacourse/local_data_source.dart';
import 'card_component.dart';

class PartTwo extends StatefulWidget {
  const PartTwo({super.key});

  @override
  State<PartTwo> createState() => _PartTwoState();
}

class _PartTwoState extends State<PartTwo> {
  String currentPage = 'black Market';
  List currencyDate=currencyBlackMarketDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70,vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () => setState(() { currentPage = 'black Market'; currencyDate=currencyBlackMarketDate;}),
                      child: SwitchButtonComponent(
                        left: true,
                        title: 'Black Market',
                        active: currentPage == 'black Market' ? true : false,
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () => setState(() { currentPage = 'banks';currencyDate=currencyBanksDate; }),
                      child: SwitchButtonComponent(
                        left: false,
                        title: 'Banks',
                        active: currentPage == 'banks' ? true : false,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: currencyDate.length,
                itemBuilder: (context, index) => CardComponent(
                  image: currencyDate[index].image,
                  name: currencyDate[index].name,
                  symbol: currencyDate[index].symbol,
                  priceBuy: currencyDate[index].priceBuy,
                  priceSell: currencyDate[index].priceSell,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
