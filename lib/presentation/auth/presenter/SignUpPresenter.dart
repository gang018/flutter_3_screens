import 'package:flutter_3_screens/data/profile/ProfileRepository.dart';
import 'package:flutter_3_screens/presentation/auth/view/SignUpScreen.dart';

class SignUpPresenter {
  ProfileRepository _repository;
  SignUpState view;

  SignUpPresenter(this._repository);

  void bindView(SignUpState screen) {
    view = screen;
  }

  void handleSignUpClick({String email, String password, String nickname, String name, String surname, String patronymic_name, String phone}) {
    if (email.isEmpty || password.isEmpty || nickname.isEmpty || name.isEmpty
        || surname.isEmpty || patronymic_name.isEmpty || phone.isEmpty) {
      view.showError();
      return;
    }

    _repository.signUp(
        email: email, password: password, name: name, surname: surname,
        patronymic_name: patronymic_name, phone: phone, nickname: nickname)
        .then((result) {
      if (result) {
        view?.showProfile();
      } else {
        view?.showError();
      }
    });
  }
}