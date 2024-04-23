import 'package:dartz/dartz.dart';

import '../../../core/network_error/failure.dart';
import '../entites/gold.dart';
import '../repository/base_gold_repository.dart';

class GetGoldUseCase {
  final BaseGoldRepository baseCoinRepository;

  GetGoldUseCase(this.baseCoinRepository);

  Future<Either<Failure, Gold>> call(String symbol) async {
    return await baseCoinRepository.getGoldPrice(symbol);
  }
}
