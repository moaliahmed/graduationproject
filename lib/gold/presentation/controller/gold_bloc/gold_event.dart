part of 'gold_bloc.dart';

abstract class GoldEvent extends Equatable {
  const GoldEvent();
}
class GetGoldEvent extends GoldEvent{
  final String symbol='XAU';
  const GetGoldEvent();

  @override
  List<Object?> get props => [];

}
class GetSilverEvent extends GoldEvent{
  final String symbol='XAG';
  const GetSilverEvent();

  @override
  List<Object?> get props => [];

}