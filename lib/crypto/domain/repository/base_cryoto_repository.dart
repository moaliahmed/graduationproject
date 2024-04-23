import 'package:graduation_project/crypto/domain/entities/chart.dart';
import 'package:graduation_project/crypto/domain/entities/crypto.dart';
import 'package:dartz/dartz.dart';

import '../../../core/network_error/failure.dart';
abstract class BaseCryptoRepository {
  Future<Either<Failure,List<Crypto>>> getCryptoCoin();

  Future<Either<Failure,List<Chart>>> getCryptoDetails(String id , int days);

}
