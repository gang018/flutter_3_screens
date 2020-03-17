
class ProfileRepository {

  Future<bool> isSignedIn() {
    return Future.delayed(Duration(seconds: 3), () {
      return true;
    });
  }

  Future<bool> signIn() {
    return Future.value(true);
  }

  Future<bool> signUp() {
    return Future.value(true);
  }

  Future<bool> signOut() {
    // TODO remove local data
    return Future.value(true);
  }
}