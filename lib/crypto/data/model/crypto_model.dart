import 'package:graduation_project/crypto/domain/entities/crypto.dart';

class CryptoModel extends Crypto {
  const CryptoModel({required super.id,
    required super.symbol,
    required super.name,
    required super.image,
    required super.currentPrice,
    required super.marketCapRank,
    required super.totalVolume,
    required super.high24h,
    required super.low24h,
    required super.priceChange24h,
    required super.marketCapChangePercentage24h,
    required super.sparklineIn7d, required super.lastUpdate});

  factory CryptoModel.fromJson(Map<String, dynamic> json) =>
      CryptoModel(
          id: json['id'],
          symbol: json['symbol'],
          name: json['name'],
          image: json['image'],
          currentPrice: json['current_price'].toDouble(),
          marketCapRank: json['market_cap_rank'],
          totalVolume: json['total_volume'].toDouble(),
          high24h: json['high_24h'].toDouble(),
          low24h: json['low_24h'].toDouble(),
          priceChange24h: json['price_change_24h'],
          marketCapChangePercentage24h: json['market_cap_change_percentage_24h'],
          sparklineIn7d: SparklineIn7dModel.fromJson(json['sparkline_in_7d'],),
          lastUpdate:json['last_updated'],
      );
}

class SparklineIn7dModel extends SparklineIn7d {
  const SparklineIn7dModel({required super.price});

  factory SparklineIn7dModel.fromJson(Map<String, dynamic> json) =>
      SparklineIn7dModel(price: json['price'].cast<double>());
}
