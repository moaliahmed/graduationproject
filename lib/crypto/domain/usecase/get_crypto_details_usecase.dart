import 'package:dartz/dartz.dart';
import 'package:graduation_project/crypto/domain/entities/chart.dart';

import '../../../core/network_error/failure.dart';
import '../repository/base_cryoto_repository.dart';

class GetCryptoDetailsUsecase {
  final BaseCryptoRepository baseCoinRepository;

  GetCryptoDetailsUsecase(this.baseCoinRepository);

  Future<Either<Failure,List<Chart>>> call(String id,int days) async {
    return await baseCoinRepository.getCryptoDetails(id,days);
  }
}
