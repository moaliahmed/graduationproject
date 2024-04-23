import 'package:get_it/get_it.dart';
import 'package:graduation_project/gold/data/datasorces/base_gold_data_source.dart';
import 'package:graduation_project/gold/data/repository/gold_repository.dart';
import 'package:graduation_project/gold/presentation/controller/gold_bloc/gold_bloc.dart';
import 'package:graduation_project/crypto/data/datacourse/base_crypto_data_source.dart';
import 'package:graduation_project/crypto/domain/repository/base_cryoto_repository.dart';
import 'package:graduation_project/crypto/presentation/controller/crypto_bloc/crypto_bloc.dart';
import 'package:graduation_project/crypto/presentation/controller/crypto_details/crypto_details_bloc.dart';

import '../../gold/domin/repository/base_gold_repository.dart';
import '../../gold/domin/usecase/get_gold_usecase.dart';
import '../../crypto/data/repository/crypto_repository.dart';
import '../../crypto/domain/usecase/get_crypto_details_usecase.dart';
import '../../crypto/domain/usecase/get_crypto_usecase.dart';

final sl=GetIt.instance;
class CryptoServersLocator{
void init(){
  // bloc
  sl.registerFactory(() => CryptoBloc(sl()));
  sl.registerFactory(() => CryptoDetailsBloc(sl()));
  sl.registerFactory(() => GoldBloc(sl()));

  // usecase
  sl.registerLazySingleton(() => GetCryptoDetailsUsecase(sl()));
  sl.registerLazySingleton(() => GetCryptoUseCase(sl()));
  sl.registerLazySingleton(() => GetGoldUseCase(sl()));

  // repository
  sl.registerLazySingleton<BaseCryptoRepository>(() => CryptoRepository(sl()));
  sl.registerLazySingleton<BaseGoldRepository>(() => GoldRepository(sl()));

  // remote Data source
  sl.registerLazySingleton<BaseCryptoRemoteDateSource>(() => CryptoRemoteDateSource());
  sl.registerLazySingleton<BaseGoldRemoteDataSource>(() => GoldDataSource());

}

}
