import 'package:flutter_coffee/Models/user_model.dart';

abstract class IAuthService {
  Future<UserModel> signIn({
    String username,
    String password,
  });
  Future<String> signUp({
    String username,
    String firstname,
    String lastname,
    String address,
    String password,
  });
}
