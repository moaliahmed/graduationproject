import 'package:dio/dio.dart';

import '../../../core/network_error/error_massage_model.dart';
import '../../../core/network_error/server_exception.dart';
import '../models/gold_model.dart';

abstract class BaseGoldRemoteDataSource {
  Future<GoldModel> getGoldPrice(String symbol);
}

class GoldDataSource extends BaseGoldRemoteDataSource {
  @override
  Future<GoldModel> getGoldPrice(symbol) async {
    print ('gold request');
    final response = await Dio().get(
      'https://www.goldapi.io/api/$symbol/USD',
      options: Options(
        method: 'GET',
        headers: {
          'x-access-token': 'goldapi-7pqrbrslt5rcvi5-io'//goldapi-1la9dslt5gmccx-io     goldapi-6kzrlsxk507u-io
        },
      ),
    );
    if (response.statusCode == 200) {
      return GoldModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMassageModel: ErrorMassageModel.fromJson(response.data));
    }
  }

  Future<GoldModel> getSilverPrice(symbol) async {
    print ('silver request');
    final response = await Dio().get(
      'https://www.goldapi.io/api/$symbol/USD',
      options: Options(
        method: 'GET',
        headers: {
          'x-access-token': 'goldapi-7pqrbrslt5rcvi5-io'//goldapi-1la9dslt5gmccx-io     goldapi-6kzrlsxk507u-io
        },
      ),
    );
    if (response.statusCode == 200) {
      return GoldModel.fromJson(response.data);

    } else {
      throw ServerException(
          errorMassageModel: ErrorMassageModel.fromJson(response.data));
    }
  }
}
