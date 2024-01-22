import 'package:graduation_project/login/domain/entities/sign_in.dart';
import 'package:graduation_project/login/domain/entities/sign_up.dart';

abstract class BaseRegisterRepository {
  Future signIn(SignIn signIn);

  Future signUp(SignUp signUp);
}
