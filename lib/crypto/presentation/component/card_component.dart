import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CardComponent extends StatelessWidget {
  final String image;
  final String name;
  final String symbol;
  final String priceBuy;
  final String priceSell;

  const CardComponent({
    super.key,
    required this.image,
    required this.name,
    required this.symbol,
    required this.priceBuy,
    required this.priceSell,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * .5,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    image,
                    height: 40,
                  ),
                ),
                const Gap(10),
                Text(
                  '$name/$symbol',
                  style: Theme.of(context).textTheme.bodyLarge,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width * .4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  PriceComponent(
                      title: 'Buy', price:priceBuy),
                  PriceComponent(
                      title: 'sell', price:priceSell),
                ],
              ))
        ],
      ),
    );
  }
}

class PriceComponent extends StatelessWidget {
  final String title;
  final String price;

  const PriceComponent({super.key, required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title),
        Text(
          price,
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w600,
            color: Colors.green,
          ),
        ),
      ],
    );
  }
}
