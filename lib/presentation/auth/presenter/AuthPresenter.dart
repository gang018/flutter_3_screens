import 'package:flutter_3_screens/data/profile/ProfileRepository.dart';
import 'package:flutter_3_screens/presentation/auth/view/AuthScreen.dart';

class AuthPresenter {

  ProfileRepository _repository;
  AuthScreenState view;

  AuthPresenter(this._repository);

  void bindView(AuthScreenState screen) {
    view = screen;
  }

  void handleSignInClick(String email, String password) {
    if (email.isEmpty || password.isEmpty) {
      view.showError();
      return;
    }

    _repository.signIn(email, password).then((result) {
      if (result) {
        view?.showProfile();
      } else {
        view?.showError();
      }
    });
  }

  void handleSignUpClick() {
    view?.showSignUp();
  }
}