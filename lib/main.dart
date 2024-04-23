import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/src/app_root.dart';
import 'core/bloc_observer/bloc_observer.dart';
import 'core/servies_locator /servies_locator.dart';

void main(){
  Bloc.observer= CubitObserver();
  CryptoServersLocator().init();
  return runApp(const AppRoot());
}