import 'package:flutter/material.dart';
import 'package:graduation_project/core/assets_manager.dart';
class GoldPriceCard extends StatelessWidget {
  final String name;
  final String karat;
  final double price;
  const GoldPriceCard({super.key,required this.name, required this.karat,required this.price});

  @override
  Widget build(BuildContext context) {
    double myWidth = MediaQuery.of(context).size.width;

    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        width:myWidth*.4 ,
        padding:const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [ Colors.blue[300]!,Colors.white,Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(name=='Gold'?ImageAssets.diamondGoldIcon:ImageAssets.diamondSilverIcon,width: 42,),
            Text(
              '$name  ${karat}K',
              style:const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
           const SizedBox(height: 8),
            Text(
              '${(price*51).toStringAsFixed(2)} EGP \nper Gram',
              style:const TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}