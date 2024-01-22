import 'package:graduation_project/login/domain/entities/sign_up.dart';
import 'package:graduation_project/login/domain/repository/basa_regirster_repository.dart';

class SignUpUseCase {
  final BaseRegisterRepository baseRegisterRepository;

  SignUpUseCase(this.baseRegisterRepository);

  Future<SignUp> signUp(
      String fullName, String email, String phone, String password) async {
    final input = SignUp(
      fullName: fullName,
      email: email,
      phone: phone,
      password: password,
    );
    return await baseRegisterRepository.signUp(input);
  }
}
