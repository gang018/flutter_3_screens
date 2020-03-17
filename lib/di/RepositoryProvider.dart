import 'package:flutter_3_screens/data/profile/ProfileRepository.dart';

class RepositoryProvider {

  static RepositoryProvider _instance = RepositoryProvider._internal();

  factory RepositoryProvider() {
    return _instance;
  }

  RepositoryProvider._internal();

  //

  ProfileRepository _profileRepo;

  ProfileRepository getProfileRepo() {
    if (_profileRepo == null) {
      _profileRepo = new ProfileRepository();
    }

    return _profileRepo;
  }
}