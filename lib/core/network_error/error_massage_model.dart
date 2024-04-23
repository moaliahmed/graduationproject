import 'package:equatable/equatable.dart';

class ErrorMassageModel extends Equatable {

  final String state;

  const ErrorMassageModel({required this.state});


  factory ErrorMassageModel.fromJson(Map<String,dynamic> json){
    return ErrorMassageModel(state: json['error']);
  }

  @override
  List<Object> get props => [state];
}