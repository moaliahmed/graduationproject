import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:graduation_project/core/color_manger.dart';

class ConvertersView extends StatelessWidget {
  const ConvertersView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading:const Text(''),
        centerTitle: true,
        title:const Text(
          'Currency Converter',
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          const  Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text('from'),
                    Container(
                      width: 99,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(6)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset('assets/images/egp.png', height: 30),
                          Text('EGP'),
                          Icon(Icons.keyboard_arrow_down_rounded)
                        ],
                      ),
                    ),
                   const Text('1 EGP = 0.03 USD')
                  ],
                ),
               const Icon(
                  Icons.currency_exchange,
                  size: 43,
                ),
                Column(
                  children: [
                   const Text('to'),
                    Container(
                      width: 99,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(6)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset('assets/images/egp.png', height: 30),
                          Text('EGP'),
                          Icon(Icons.keyboard_arrow_down_rounded)
                        ],
                      ),
                    ),
                    Text('1 EGP = 0.03 USD')
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 40,
              width: 90,
              child: TextField(
                controller: controller,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    hintText: 'Amount',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 13))),
              ),
            ),
            Text('EGP'),
            Gap(10),
            Expanded(
              child: GridView.builder(
                itemCount: 6,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 2,
                    mainAxisSpacing: 16),
                itemBuilder: (context, index) {
                  return Center(
                    child: Card(
                      elevation: 3.0,
                      child: Container(
                        height: 110.0, // Set the height of the card here
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: ColorManager.primary,
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(6),
                                      topRight: Radius.circular(6))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Image.asset(
                                    'assets/images/egp.png',
                                    height: 30,
                                  ),
                                  Text(
                                    'EGP',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            Text('0.02'),
                            Text('EGP')
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
