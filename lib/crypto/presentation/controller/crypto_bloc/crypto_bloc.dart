import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:graduation_project/core/request_state.dart';

import '../../../domain/entities/chart.dart';
import '../../../domain/entities/crypto.dart';
import '../../../domain/usecase/get_crypto_usecase.dart';

part 'crypto_event.dart';

part 'crypto_state.dart';

class CryptoBloc extends Bloc<CryptoEvent, CryptoState> {
  final GetCryptoUseCase getCryptoUseCase;

  CryptoBloc(this.getCryptoUseCase)
      : super(const CryptoState()) {
    on<GetCryptoEvent>((event, emit) async {
      emit(state.copyWith(crypto: [],cryptoRequestState: RequestState.loading));
      final result = await getCryptoUseCase.call();
      result.fold(
        (l) => emit(
          state.copyWith(
              cryptoMassage: l.massage, cryptoRequestState: RequestState.error),
        ),
        (r) => emit(
          state.copyWith(crypto: r, cryptoRequestState: RequestState.loaded),
        ),
      );
    });

  }
}
