import 'package:equatable/equatable.dart';

class SignIn extends Equatable {
  final String email;
  final String password;

  const SignIn({
    required this.email,
    required this.password,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    email,
    password,
  ];
}
