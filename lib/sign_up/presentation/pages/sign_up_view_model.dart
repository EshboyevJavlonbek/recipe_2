import 'package:flutter/cupertino.dart';
import 'package:recipe_app/sign_up/data/repositories/sign_up_repository.dart';

class SignUpViewModel extends ChangeNotifier{
  SignUpViewModel({required SignUpRepository authRepository}): _authRepository = authRepository;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController loginController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final SignUpRepository _authRepository;

  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  Future<bool> submitForm()async{
    if(formKey.currentState!.validate()){
      String login = loginController.text;
      String password = passwordController.text;

      _isAuthenticated = await _authRepository.login(login, password);
      notifyListeners();
    }
    return _isAuthenticated;
  }

  Future<void> obtainToken(String login, String password) async{
    _isAuthenticated = await _authRepository.login(login, password);
    notifyListeners();
  }

  Future<void> logout() async{
    await _authRepository.logout();
    _isAuthenticated = false;
    notifyListeners();
  }
}