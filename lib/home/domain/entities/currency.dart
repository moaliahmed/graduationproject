import 'package:equatable/equatable.dart';

class Currency extends Equatable {
  final String image;
  final String name;
  final String symbol;
  final String priceBuy;
  final String priceSell;
  final bool buy;

  const Currency({
    required this.image,
    required this.name,
    required this.symbol,
    required this.priceBuy,
    required this.priceSell,
    required this.buy,
  });

  @override
  List<Object> get props => [
        image,
        name,
        symbol,
        priceBuy,
        priceSell,
        buy,
      ];
}
