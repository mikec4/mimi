
abstract class UserRepository{

  Future<dynamic> signInWithGoogle();

  Future<dynamic> facebookSignIn();

  Future<void> signOut();

  Future<bool> isSignedIn();

  Future<String> getUserEmail();

  Future<bool> isFacebookLoggedIn();

}