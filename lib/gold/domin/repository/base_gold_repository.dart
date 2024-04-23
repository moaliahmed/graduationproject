import 'package:dartz/dartz.dart';

import '../../../core/network_error/failure.dart';
import '../entites/gold.dart';

abstract class BaseGoldRepository {
  Future<Either<Failure,Gold>> getGoldPrice(String symbol);

}
