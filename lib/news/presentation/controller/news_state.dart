part of 'news_cubit.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}
class NewsGetSuccessfullyState extends NewsState {}
class NewsGetErrorState extends NewsState {}
class NewsGetLoadingState extends NewsState {}
