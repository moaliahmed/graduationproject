import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  static NewsCubit get(context) => BlocProvider.of(context);
  List allNews = [];
  List cryptoNews = [];
  List goldNews = [];
  List sliverNews = [];
  List stocksNews = [];

  Future getAllNews() async {
    emit(NewsGetLoadingState());
    await Dio()
        .get(
            'https://newsapi.org/v2/everything?q=all&apiKey=3fd82181a68e4fca92cec6aec11693aa')
        .then((value) {
      allNews = value.data['articles'];
      emit(NewsGetSuccessfullyState());
    }).catchError((onError) {
      print('Error when i get news data $onError');
      emit(NewsGetErrorState());
    });
  }
  Future getCryptoNews() async {
    emit(NewsGetLoadingState());
    await Dio()
        .get(
            'https://newsapi.org/v2/everything?q=crypto&apiKey=3fd82181a68e4fca92cec6aec11693aa')
        .then((value) {
      cryptoNews = value.data['articles'];

      emit(NewsGetSuccessfullyState());
    }).catchError((onError) {
      print('Error when i get news data $onError');
      emit(NewsGetErrorState());
    });
  }
  Future getGoldNews() async {
    emit(NewsGetLoadingState());
    await Dio()
        .get(
            'https://newsapi.org/v2/everything?q=gold&apiKey=3fd82181a68e4fca92cec6aec11693aa')
        .then((value) {
      goldNews = value.data['articles'];
      emit(NewsGetSuccessfullyState());
    }).catchError((onError) {
      print('Error when i get news data $onError');
      emit(NewsGetErrorState());
    });
  }
  Future getStocksNews() async {
    emit(NewsGetLoadingState());
    await Dio()
        .get(
            'https://newsapi.org/v2/everything?q=stocks&apiKey=3fd82181a68e4fca92cec6aec11693aa')
        .then((value) {
      stocksNews = value.data['articles'];
      emit(NewsGetSuccessfullyState());
    }).catchError((onError) {
      print('Error when i get news data $onError');
      emit(NewsGetErrorState());
    });
  }
}

//https://newsapi.org/v2/
//everything?q=sports&apiKey=3fd82181a68e4fca92cec6aec11693aa
// news api =3fd82181a68e4fca92cec6aec11693aa
