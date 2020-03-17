
import 'package:flutter_3_screens/data/profile/ProfileRepository.dart';
import 'package:flutter_3_screens/presentation/profile/view/ProfileScreen.dart';

class ProfilePresenter {

  ProfileScreenState _view;
  ProfileRepository _repository;

  ProfilePresenter(this._repository);

  void bindView(ProfileScreenState view) {
    _view = view;

    _loadAndShowProfile();
  }

  void _loadAndShowProfile() {
    _repository?.getProfile().then((profile) {
      _view?.showProfile(profile);
    });
  }

  void handleLogoutClick() {
    _repository.signOut().then((result) {
      if (result) {
        _view.showSignIn();
      }
    });
  }
}