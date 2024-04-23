import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/request_state.dart';
import 'package:graduation_project/crypto/presentation/controller/crypto_details/crypto_details_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../../core/servies_locator /servies_locator.dart';
import '../../domain/entities/chart.dart';

class ExampleScreen extends StatefulWidget {
  final dynamic selectItem;

  const ExampleScreen({
    super.key,
    required this.selectItem,
  });

  @override
  State<ExampleScreen> createState() => _ExampleScreenState();
}

class _ExampleScreenState extends State<ExampleScreen> {
  late TrackballBehavior trackballBehavior = TrackballBehavior();
  int days = 1;

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: myHeight,
          width: myWidth,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: myWidth * 0.05, vertical: myHeight * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                            height: myHeight * 0.08,
                            child: Image.network(widget.selectItem.image!)),
                        SizedBox(width: myWidth * 0.03),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.selectItem.id!,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: myHeight * 0.01),
                            Text(
                              widget.selectItem.symbol!,
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
                          '\$${widget.selectItem.currentPrice}',
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                        ),
                        SizedBox(height: myHeight * 0.01),
                        Text(
                          widget.selectItem.marketCapChangePercentage24h
                              .toString(),
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: widget.selectItem
                                          .marketCapChangePercentage24h! >=
                                      0
                                  ? Colors.green
                                  : Colors.red),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(),
              Expanded(
                child: Column(
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
                                '\$${widget.selectItem.low24h}',
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
                                '\$${widget.selectItem.high24h}',
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
                                'Vol',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.grey),
                              ),
                              SizedBox(height: myHeight * 0.01),
                              Text(
                                '\$${widget.selectItem.totalVolume}M',
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
                    SizedBox(height: myHeight * 0.015),
                    SizedBox(
                      height: myHeight * 0.35,
                      width: myWidth,
                      // color: Colors.amber,
                      child: widget.selectItem == []
                          ? Padding(
                              padding: EdgeInsets.all(myHeight * 0.06),
                              child: const Center(
                                child: Text(
                                  'Attention this Api is free, so you cannot send multiple requests per second, please wait and try again later.',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            )
                          : Sparkline(
                            data: widget.selectItem.sparklineIn7d.price!,
                            lineWidth: 2.0,
                            lineColor: widget.selectItem
                                        .marketCapChangePercentage24h! >=
                                    0
                                ? Colors.green
                                : Colors.red,
                            fillMode: FillMode.below,
                            fillGradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                stops: const [0.0, 0.7],
                                colors: widget.selectItem
                                            .marketCapChangePercentage24h! >=
                                        0
                                    ? [Colors.green, Colors.green.shade100]
                                    : [Colors.red, Colors.red.shade100]),
                          ),
                    ),
                    SizedBox(height: myHeight * 0.01),
                    Center(
                      child: SizedBox(
                        height: myHeight * 0.03,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: text.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: myWidth * 0.02),
                              child: InkWell(
                                onTap: () {
                                  textBool = [
                                    false,
                                    false,
                                    false,
                                    false,
                                    false,
                                    false
                                  ];
                                  textBool[index] = true;
                                  setDays(text[index]);

                                  print(days);
                                  sl<CryptoDetailsBloc>().add(
                                      GetCryptoDetailsEvent(
                                          widget.selectItem.id, days));
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: myWidth * 0.03,
                                      vertical: myHeight * 0.005),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: textBool[index] == true
                                        ? const Color(0xffFBC700)
                                            .withOpacity(0.3)
                                        : Colors.transparent,
                                  ),
                                  child: Text(
                                    text[index],
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: myHeight * 0.04),
                    Expanded(
                      child: ListView(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: myWidth * 0.06),
                            child: const Text(
                              'News',
                              style: TextStyle(fontSize: 25),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: myWidth * 0.06,
                              vertical: myHeight * 0.01,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Expanded(
                                  child: Text(
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 17),
                                  ),
                                ),
                                SizedBox(
                                  width: myWidth * 0.25,
                                  child: CircleAvatar(
                                    radius: myHeight * 0.04,
                                    //backgroundImage:AssetImage('assets/image/11.PNG'),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: myHeight * 0.1,
                width: myWidth,
                // color: Colors.amber,
                child: Column(
                  children: [
                    const Divider(),
                    SizedBox(height: myHeight * 0.01),
                    Row(
                      children: [
                        SizedBox(width: myWidth * 0.05),
                        Expanded(
                          flex: 5,
                          child: InkWell(
                            onTap: () {
                              // Todo write function to add crypto cone to favorite list
                              setState(() {});
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: myHeight * 0.015),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: const Color(0xffFBC700)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: myHeight * 0.02,
                                  ),
                                  const Text(
                                    'Add to portfolio',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: myWidth * 0.05),
                        Expanded(
                          flex: 2,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: myHeight * 0.012),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.grey.withOpacity(0.2)),
                            child: Image.asset(
                              'assets/icons/3.1.png',
                              height: myHeight * 0.03,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(width: myWidth * 0.05),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<String> text = ['D', 'W', 'M', '3M', '6M', 'Y'];
  List<bool> textBool = [true, false, false, false, false, false];

  setDays(String txt) {
    if (txt == 'D') {
      setState(() {
        days = 1;
      });
    } else if (txt == 'W') {
      setState(() {
        days = 7;
      });
    } else if (txt == 'M') {
      setState(() {
        days = 30;
      });
    } else if (txt == '3M') {
      setState(() {
        days = 90;
      });
    } else if (txt == '6M') {
      setState(() {
        days = 180;
      });
    } else if (txt == 'Y') {
      setState(() {
        days = 365;
      });
    }
  }

  int convertTime(int time) {
    if (days == 1) {
      return DateTime.fromMillisecondsSinceEpoch(time).hour;
    } else if (days == 7) {
      return DateTime.fromMillisecondsSinceEpoch(time).day;
    } else if (days == 30) {
      return DateTime.fromMillisecondsSinceEpoch(time).day;
    } else if (days == 90) {
      return DateTime.fromMillisecondsSinceEpoch(time).month;
    }
    return 0;
  }
}
