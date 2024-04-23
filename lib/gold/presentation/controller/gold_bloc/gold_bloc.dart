import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/request_state.dart';
import '../../../domin/entites/gold.dart';
import '../../../domin/usecase/get_gold_usecase.dart';

part 'gold_event.dart';

part 'gold_state.dart';

class GoldBloc extends Bloc<GoldEvent, GoldState> {
  final GetGoldUseCase getGoldUseCase;

  GoldBloc(this.getGoldUseCase) : super(GoldState()) {
    on<GetGoldEvent>((event, emit) async {
        final result = await getGoldUseCase('XAU');
        result.fold((l) {
            print(l);
            emit(
              state.copyWith(
                goldMassage: l.massage,
                goldRequestState: RequestState.error,
              ),
            );
          },
          (r) {
            emit(
              state.copyWith(
                gold: r,
                goldRequestState: RequestState.loaded,
              ),
            );
          },
        );
      },
    );
    on<GetSilverEvent>(
      (event, emit) async {
        final result = await getGoldUseCase('XAG');
        result.fold(
          (l) {
            print(l);
            emit(
              state.copyWith(
                silverMassage: l.massage,
                silverRequestState: RequestState.error,
              ),
            );
          },
          (r) {
            emit(
              state.copyWith(
                silver: r,
                silverRequestState: RequestState.loaded,
              ),
            );
          },
        );
      },
    );
  }
}
