part of 'crypto_details_bloc.dart';

abstract class CryptoDetailsEvent extends Equatable {
  const CryptoDetailsEvent();
}
class GetCryptoDetailsEvent extends CryptoDetailsEvent {
  final int days;
  final String id;
  const GetCryptoDetailsEvent(this.id,this.days);

  @override
  List<Object?> get props => [id,days];
}