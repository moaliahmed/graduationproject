import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/network_error/failure.dart';
import 'package:graduation_project/core/network_error/server_exception.dart';
import 'package:graduation_project/crypto/data/datacourse/base_crypto_data_source.dart';
import 'package:graduation_project/crypto/domain/entities/crypto.dart';
import 'package:graduation_project/crypto/domain/repository/base_cryoto_repository.dart';

import '../model/chart_model.dart';

class CryptoRepository extends BaseCryptoRepository {
  final BaseCryptoRemoteDateSource baseCryptoRemoteDateSource;

  CryptoRepository(this.baseCryptoRemoteDateSource);

  @override
  Future<Either<Failure,List<Crypto>>> getCryptoCoin() async {
    final result = await baseCryptoRemoteDateSource.getCryptoCoin();
   try{
     return right(result);
   }on ServerException catch(failure){
return left(ServerFailure(failure.errorMassageModel.state));
   }
  }

  @override
  Future<Either<Failure,List<ChartModel>>> getCryptoDetails(String id,int days) async {
    final result = await baseCryptoRemoteDateSource.getCryptoDetails(id,days);
    try{
      return right(result);
    }on ServerException catch(failure){
      return left(ServerFailure(failure.errorMassageModel.state));
    }
  }
}
