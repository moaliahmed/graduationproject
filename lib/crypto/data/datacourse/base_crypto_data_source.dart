import 'package:dio/dio.dart';
import 'package:graduation_project/core/network_error/error_massage_model.dart';
import 'package:graduation_project/core/network_error/server_exception.dart';
import 'package:graduation_project/core/string_manager.dart';
import 'package:graduation_project/crypto/data/model/crypto_model.dart';

import '../model/chart_model.dart';

abstract class BaseCryptoRemoteDateSource {
  Future<List<CryptoModel>> getCryptoCoin();

  Future<List<ChartModel>> getCryptoDetails(String id,int days);
}

class CryptoRemoteDateSource extends BaseCryptoRemoteDateSource {
  @override
  Future<List<CryptoModel>> getCryptoCoin() async {
    print('requst');
    final response = await Dio().get(AppString.cryptoUrl);
    if (response.statusCode == 200) {
      return List<CryptoModel>.from(
        (response.data as List).map((e) => CryptoModel.fromJson(e)),
      );
    } else {
      throw ServerException(
          errorMassageModel: ErrorMassageModel.fromJson(response.data));
      return [];
    }
  }

  @override
  Future<List<ChartModel>> getCryptoDetails(id,days) async {
    print('requst');
    final response = await Dio().get(
          'https://api.coingecko.com/api/v3/coins/$id/ohlc?vs_currency=usd&days=$days');
    if (response.statusCode == 200) {
      return List<ChartModel>.from(
        (response.data as List).map((e) => ChartModel.fromJson(e)),
      );
    } else {
      throw ServerException(
          errorMassageModel: ErrorMassageModel.fromJson(response.data));
      return [];
    }
  }
}
