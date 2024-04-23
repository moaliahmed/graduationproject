part of 'crypto_bloc.dart';

class CryptoState extends Equatable {
  final List<Crypto>? crypto;
  final RequestState cryptoRequestState;
  final String cryptoMassage;

  const CryptoState({
    this.crypto = const [],
    this.cryptoRequestState = RequestState.loading,
    this.cryptoMassage = '',
  });

  CryptoState copyWith({
    List<Crypto>? crypto,
    RequestState? cryptoRequestState,
    String? cryptoMassage,
    List<Chart>? cryptoDetails,
    RequestState? cryptoDetailsRequestState,
    String? cryptoDetailsMassage,
  }) {
    return CryptoState(
      crypto: crypto ?? this.crypto,
      cryptoRequestState: cryptoRequestState ?? this.cryptoRequestState,
      cryptoMassage: cryptoMassage ?? this.cryptoMassage,
    );
  }

  @override
  List<Object?> get props => [
        crypto,
        cryptoRequestState,
        cryptoMassage,
      ];
}
