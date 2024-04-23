import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:graduation_project/core/request_state.dart';
import 'package:graduation_project/gold/presentation/controller/gold_bloc/gold_bloc.dart';

import '../../../core/servies_locator /servies_locator.dart';
import '../../../crypto/presentation/component/switch_button_component.dart';
import '../components/gold_price_card.dart';

class GoldScreen extends StatefulWidget {
  const GoldScreen({super.key});

  @override
  State<GoldScreen> createState() => _GoldScreenState();
}

class _GoldScreenState extends State<GoldScreen> {
  String currentPage = 'XAU';

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;

    return BlocProvider<GoldBloc>(
      create: (context) => sl<GoldBloc>()
        ..add(const GetSilverEvent())
        ..add(const GetGoldEvent())
        ,
      child: BlocBuilder<GoldBloc, GoldState>(
        buildWhen: (previous, current) =>
            previous.goldRequestState != current.goldRequestState,
        builder: (context, state) {
          switch (state.goldRequestState) {
            case RequestState.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case RequestState.loaded:
              var gold = currentPage == 'XAU' ? state.gold : state.silver;
              DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(
                  gold!.timestamp! * 1000,
                  isUtc: true);
              print (dateTime);
              String relativeTime = timeago.format(dateTime);

              return Scaffold(
                body: Container(
                  color: Colors.white,
                  height: myHeight,
                  width: myWidth,
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 70, right: 70, top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () => setState(() {
                                  currentPage = 'XAU';
                                }),
                                child: SwitchButtonComponent(
                                  left: true,
                                  title: 'Gold',
                                  active: currentPage == 'XAU' ? true : false,
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () => setState(() {
                                  currentPage = 'XAG';
                                }),
                                child: SwitchButtonComponent(
                                  left: false,
                                  title: 'Silver',
                                  active: currentPage == 'XAG' ? true : false,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            right: myWidth * 0.05,
                            left: myWidth * 0.05,
                            top: myHeight * 0.02),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                    height: myHeight * 0.1,
                                    child: currentPage == 'XAU'
                                        ? Image.asset(
                                            'assets/icons/GoldImage.png')
                                        : Image.asset(
                                            'assets/icons/silver.png')),
                                SizedBox(width: myWidth * 0.03),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      currentPage == 'XAU' ? 'Gold' : 'Silver',
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: myHeight * 0.01),
                                    Text(
                                      currentPage,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '${(gold.price!*51).toStringAsFixed(1)} EGP',
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black),
                                ),
                                SizedBox(height: myHeight * 0.01),
                                Text(
                                  gold.chp.toString(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      color: gold.chp! >= 0
                                          ? Colors.green
                                          : Colors.red),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: myWidth * 0.05,
                                vertical: myHeight * 0.02),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    const Text(
                                      'Low',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.grey),
                                    ),
                                    SizedBox(height: myHeight * 0.01),
                                    Text(
                                      '${(gold.lowPrice!*51).toStringAsFixed(0)} EGP',
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    const Text(
                                      'High',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.grey),
                                    ),
                                    SizedBox(height: myHeight * 0.01),
                                    Text(
                                      '${(gold.highPrice!*51).toStringAsFixed(0)} EGP',
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    const Text(
                                      'last update',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.grey),
                                    ),
                                    SizedBox(height: myHeight * 0.01),
                                    Text(
                                      relativeTime,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: ListView(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GoldPriceCard(
                                  name:
                                      currentPage == 'XAU' ? 'Gold' : 'Silver',
                                  karat: '24',
                                  price: gold.priceGram24k!,
                                ),
                                GoldPriceCard(
                                  name:
                                      currentPage == 'XAU' ? 'Gold' : 'Silver',
                                  karat: '22',
                                  price: gold.priceGram22k!,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GoldPriceCard(
                                  name:
                                      currentPage == 'XAU' ? 'Gold' : 'Silver',
                                  karat: '21',
                                  price: gold.priceGram21k!,
                                ),
                                GoldPriceCard(
                                  name:
                                      currentPage == 'XAU' ? 'Gold' : 'Silver',
                                  karat: '20',
                                  price: gold.priceGram20k!,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GoldPriceCard(
                                  name:
                                      currentPage == 'XAU' ? 'Gold' : 'Silver',
                                  karat: '18',
                                  price: gold.priceGram18k!,
                                ),
                                GoldPriceCard(
                                  name:
                                      currentPage == 'XAU' ? 'Gold' : 'Silver',
                                  karat: '16',
                                  price: gold.priceGram16k!,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GoldPriceCard(
                                  name:
                                      currentPage == 'XAU' ? 'Gold' : 'Silver',
                                  karat: '18',
                                  price: gold.priceGram18k!,
                                ),
                                GoldPriceCard(
                                  name:
                                      currentPage == 'XAU' ? 'Gold' : 'Silver',
                                  karat: '16',
                                  price: gold.priceGram16k!,
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            case RequestState.error:
              return Center(
                child: Text(
                  state.goldMassage,
                  style: TextStyle(fontSize: 22),
                ),
              );
          }
        },
      ),
    );
  }
}
