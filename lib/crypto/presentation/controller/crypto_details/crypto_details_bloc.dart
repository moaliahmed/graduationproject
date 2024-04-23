import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/request_state.dart';
import '../../../domain/entities/chart.dart';
import '../../../domain/usecase/get_crypto_details_usecase.dart';

part 'crypto_details_event.dart';

part 'crypto_details_state.dart';

class CryptoDetailsBloc extends Bloc<CryptoDetailsEvent, CryptoDetailsState> {
  final GetCryptoDetailsUsecase getCryptoDetailsUseCase;
   List<Chart> cryptoDetailsList=[];

  static CryptoDetailsBloc get(BuildContext context) =>
      BlocProvider.of(context);

  CryptoDetailsBloc(this.getCryptoDetailsUseCase)
      : super(const CryptoDetailsState()) {
    on<GetCryptoDetailsEvent>((event, emit) async {
      emit(state.copyWith(cryptoDetailsRequestState: RequestState.loading));
      final result = await getCryptoDetailsUseCase(event.id, event.days);
      result.fold(
          (l) => emit(
                state.copyWith(
                    cryptoDetailsMassage: l.massage,
                    cryptoDetailsRequestState: RequestState.error),
              ), (r) {
            cryptoDetailsList=r;
        emit(
          state.copyWith(
            cryptoDetails: r,
            cryptoDetailsRequestState: RequestState.loaded,
          ),
        );
      });
    });
  }

  @override
  void onTransition(
      Transition<CryptoDetailsEvent, CryptoDetailsState> transition) {
    super.onTransition(transition);
    print(transition);
  }
}
