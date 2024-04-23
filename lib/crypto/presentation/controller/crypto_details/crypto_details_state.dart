part of 'crypto_details_bloc.dart';

class CryptoDetailsState extends Equatable {
  final List<Chart> cryptoDetails;
  final RequestState cryptoDetailsRequestState;
  final String cryptoDetailsMassage;

  const CryptoDetailsState({
    this.cryptoDetails = const [],
    this.cryptoDetailsRequestState = RequestState.loading,
    this.cryptoDetailsMassage = '',
  });

  CryptoDetailsState copyWith({
    List<Chart>? cryptoDetails,
    RequestState? cryptoDetailsRequestState,
    String? cryptoDetailsMassage,
  }) {
    return CryptoDetailsState(
        cryptoDetails: cryptoDetails ?? this.cryptoDetails,
        cryptoDetailsRequestState:
            cryptoDetailsRequestState ?? this.cryptoDetailsRequestState,
        cryptoDetailsMassage:
            cryptoDetailsMassage ?? this.cryptoDetailsMassage);
  }

  @override
  List<Object> get props => [
    cryptoDetails,
        cryptoDetailsRequestState,
        cryptoDetailsMassage,
      ];
}
