import 'package:equatable/equatable.dart';

class Crypto extends Equatable {
  final String? id;
  final String? symbol;
  final String? name;
  final String? image;
  final double? currentPrice;

  final int? marketCapRank;
  final double? totalVolume;
  final double? high24h;
  final double? low24h;
  final double? priceChange24h;
  final double? marketCapChangePercentage24h;
  final SparklineIn7d sparklineIn7d;
  final String lastUpdate;

  const Crypto(
      {required this.id,
      required this.symbol,
      required this.name,
      required this.image,
      required this.currentPrice,
      required this.marketCapRank,
      required this.totalVolume,
      required this.high24h,
      required this.low24h,
      required this.priceChange24h,
      required this.marketCapChangePercentage24h,
      required this.sparklineIn7d,
      required this.lastUpdate});

  @override
  List<Object?> get props => [
        id,
        symbol,
        name,
        image,
        currentPrice,
        marketCapRank,
        totalVolume,
        high24h,
        low24h,
        priceChange24h,
        marketCapChangePercentage24h,
        sparklineIn7d,
        lastUpdate
      ];
}

class SparklineIn7d extends Equatable {
  final List<double>? price;

  const SparklineIn7d({required this.price});

  @override
  List<Object?> get props => [price];
}
