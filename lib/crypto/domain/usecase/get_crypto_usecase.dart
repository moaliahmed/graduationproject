import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/network_error/failure.dart';
import 'package:graduation_project/crypto/domain/entities/crypto.dart';
import 'package:graduation_project/crypto/domain/repository/base_cryoto_repository.dart';

class GetCryptoUseCase {
  final BaseCryptoRepository baseCoinRepository;

  GetCryptoUseCase(this.baseCoinRepository);

  Future<Either<Failure,List<Crypto>>> call() async {
    return await baseCoinRepository.getCryptoCoin();
  }
}
