import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:graduation_project/core/color_manger.dart';
import 'package:graduation_project/core/request_state.dart';
import 'package:graduation_project/core/string_manager.dart';
import 'package:graduation_project/crypto/presentation/component/example.dart';
import 'package:graduation_project/crypto/presentation/component/item.dart';
import 'package:graduation_project/crypto/presentation/controller/crypto_bloc/crypto_bloc.dart';
import 'package:lottie/lottie.dart';
import '../../../calculator/page/calculator_table.dart';
import '../../../core/assets_manager.dart';
import '../../../core/servies_locator /servies_locator.dart';
import '../../domain/entities/crypto.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoView extends StatefulWidget {
  const CryptoView({super.key});

  @override
  State<CryptoView> createState() => _CryptoViewState();
}

class _CryptoViewState extends State<CryptoView> {


  @override
  void initState() {
    Timer.periodic(const Duration(minutes: 1), (timer) {
      setState(() {
        print('rebuild');
      });
    });
    Timer.periodic(const Duration(minutes: 5), (timer) {
      sl<CryptoBloc>().add(const GetCryptoEvent());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return BlocProvider<CryptoBloc>(
      create: (context) => sl<CryptoBloc>()..add(const GetCryptoEvent()),
      child: BlocBuilder<CryptoBloc, CryptoState>(
        buildWhen: (previous, current) =>
            current.cryptoRequestState != previous.cryptoRequestState,
        builder: (context, state) {
          var cryptoList = state.crypto;
          int listLength = cryptoList!.length;

          switch (state.cryptoRequestState) {
            case RequestState.loading:
              return  Center(child: Lottie.asset(ImageAssets.loadingLottie));
            case RequestState.loaded:
              DateTime timestamp = DateTime.parse(cryptoList[0].lastUpdate);
              DateTime now = DateTime.now().toUtc();
              Duration difference = now.difference(timestamp);
              String relativeTime = formatDuration(difference);
              return Scaffold(
                body: SafeArea(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          ColorManager.primary,
                          ColorManager.primary.withOpacity(.5),
                        ],
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.notifications_none_outlined,
                                  color: ColorManager.white,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/Coinmoney.png',
                                    color: Colors.white,
                                    height: 39,
                                  ),
                                  const Gap(10),
                                  Text(
                                    AppString.appName,
                                    style: TextStyle(
                                        color: ColorManager.white,
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.search,
                                  color: ColorManager.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: myHeight * .02,
                        ),
                        Expanded(
                          child: Container(
                            width: myWidth,
                            decoration: BoxDecoration(
                              color: ColorManager.white,
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(50),
                                topLeft: Radius.circular(50),
                              ),
                            ),
                            child: Column(
                              children: [
                                SizedBox(height: myHeight * .03),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: myWidth * .08),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          const Text(
                                            'last update',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          // SizedBox(height: myHeight * 0.01),
                                          Text(
                                            relativeTime,
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  CalculatorTable(
                                                currency: cryptoList,
                                              ),
                                            ),
                                          );
                                        },
                                        icon: const Icon(
                                          Icons.calculate_outlined,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(height: myHeight * .02),
                                Expanded(
                                  child: ListView.separated(
                                    separatorBuilder: (context, index) {
                                      return const Divider(
                                        indent: 15,
                                        endIndent: 15,
                                        height: 1,
                                        color: Colors.grey,
                                      );
                                    },
                                    itemCount: listLength,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ExampleScreen(
                                                selectItem: cryptoList[index],
                                              ),
                                            ),
                                          );
                                        },
                                        child: ItemComponent(
                                          item: cryptoList[index],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            case RequestState.error:
              return SizedBox(
                height: 400.0,
                child: Center(
                  child: Text(state.cryptoMassage),
                ),
              );
          }
        },
      ),
    );
  }

  String formatDuration(Duration duration) {
    if (duration.inDays > 0) {
      return '${duration.inDays} day${duration.inDays == 1 ? '' : 's'} ago';
    } else if (duration.inHours > 0) {
      return '${duration.inHours} hour${duration.inHours == 1 ? '' : 's'} ago';
    } else if (duration.inMinutes > 0) {
      return '${duration.inMinutes} minute${duration.inMinutes == 1 ? '' : 's'} ago';
    } else {
      return 'just now';
    }
  }
}
