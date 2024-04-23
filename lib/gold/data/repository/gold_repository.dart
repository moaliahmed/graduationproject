import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/network_error/failure.dart';
import 'package:graduation_project/gold/data/datasorces/base_gold_data_source.dart';
import 'package:graduation_project/gold/domin/entites/gold.dart';
import 'package:graduation_project/gold/domin/repository/base_gold_repository.dart';

import '../../../core/network_error/server_exception.dart';

class GoldRepository extends BaseGoldRepository{

  final BaseGoldRemoteDataSource baseGoldDataSource;

  GoldRepository(this.baseGoldDataSource);

  @override
  Future<Either<Failure, Gold>> getGoldPrice(String symbol)async {
    final result = await baseGoldDataSource.getGoldPrice(symbol);
    try{
      return right(result);
    }on ServerException catch(failure){
      return left(ServerFailure(failure.errorMassageModel.state));
    }
  }



}