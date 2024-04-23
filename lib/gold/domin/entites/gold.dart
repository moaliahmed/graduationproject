import 'package:equatable/equatable.dart';

class Gold extends Equatable {
  final int? timestamp;
  final String? metal;
  final String? currency;
  final String? exchange;
  final String? symbol;
  final double? prevClosePrice;
  final double? openPrice;
  final double? lowPrice;
  final double? highPrice;
  final int? openTime;
  final double? price;
  final double? ch;
  final double? chp;
  final double? ask;
  final double? bid;
  final double? priceGram24k;
  final double? priceGram22k;
  final double? priceGram21k;
  final double? priceGram20k;
  final double? priceGram18k;
  final double? priceGram16k;
  final double? priceGram14k;
  final double? priceGram10k;

  const Gold({
    required this.timestamp,
    required this.metal,
    required this.currency,
    required this.exchange,
    required this.symbol,
    required this.prevClosePrice,
    required this.openPrice,
    required this.lowPrice,
    required this.highPrice,
    required this.openTime,
    required this.price,
    required this.ch,
    required this.chp,
    required this.ask,
    required this.bid,
    required this.priceGram24k,
    required this.priceGram22k,
    required this.priceGram21k,
    required this.priceGram20k,
    required this.priceGram18k,
    required this.priceGram16k,
    required this.priceGram14k,
    required this.priceGram10k,
  });

  @override
  List<Object?> get props => [
        timestamp,
        metal,
        currency,
        exchange,
        symbol,
        prevClosePrice,
        openPrice,
        lowPrice,
        highPrice,
        openTime,
        price,
        ch,
        chp,
        ask,
        bid,
        priceGram24k,
        priceGram22k,
        priceGram21k,
        priceGram20k,
        priceGram18k,
        priceGram16k,
        priceGram14k,
        priceGram10k,
      ];
}
