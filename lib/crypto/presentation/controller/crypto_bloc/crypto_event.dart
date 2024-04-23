part of 'crypto_bloc.dart';

abstract class CryptoEvent extends Equatable {
  const CryptoEvent();
}

class GetCryptoEvent extends CryptoEvent {
  const GetCryptoEvent();

  @override
  List<Object?> get props => [];
}
