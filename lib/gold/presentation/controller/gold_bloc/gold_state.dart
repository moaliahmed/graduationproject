part of 'gold_bloc.dart';


class GoldState extends Equatable {
  final Gold? gold;
  final RequestState goldRequestState;
  final String goldMassage;
  final Gold? silver;
  final RequestState silverRequestState;
  final String silverMassage;

  GoldState({
    this.gold,
    this.goldRequestState = RequestState.loading,
    this.goldMassage = '',
    this.silver,
    this.silverRequestState = RequestState.loading,
    this.silverMassage = '',
  });

  GoldState copyWith({
    Gold? gold,
    RequestState? goldRequestState,
    String? goldMassage,
    Gold? silver,
    RequestState? silverRequestState,
    String? silverMassage,
  }) {
    return GoldState(
      gold: gold ?? this.gold,
      goldMassage: goldMassage ?? this.goldMassage,
      goldRequestState: goldRequestState ?? this.goldRequestState,
      silver: silver ?? this.silver,
      silverMassage: silverMassage ?? this.silverMassage,
      silverRequestState: silverRequestState ?? this.silverRequestState,
    );
  }

  @override
  List<Object?> get props => [
        gold,
        goldRequestState,
        goldMassage,
        silver,
        silverRequestState,
        silverMassage
      ];
}
