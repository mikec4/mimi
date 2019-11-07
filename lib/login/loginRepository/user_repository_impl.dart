import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mimi/failure/failure.dart';
import 'package:mimi/login/loginRepository/user_repository.dart';
import 'package:mimi/login/model/user_model.dart';

class UserRepositoryImpl implements UserRepository{
  
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final FacebookLogin _facebookLogin;

  
  //final _firebaseAuth = FirebaseAuth.instance;
  //final _googleSignIn = locator<GoogleSignIn>();
  //final _facebookLogin = locator<FacebookLogin>();

  UserRepositoryImpl({FirebaseAuth firebaseAuth,GoogleSignIn googleSignIn,FacebookLogin facebookLogin}):
  _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
  _googleSignIn = googleSignIn ?? GoogleSignIn(),
  _facebookLogin = facebookLogin ?? FacebookLogin();


  @override
  Future facebookSignIn() async{
    final result = await _facebookLogin.logInWithReadPermissions(['email',]);
  
    AuthCredential credential = FacebookAuthProvider.getCredential(accessToken:result.accessToken.token);
    await _firebaseAuth.signInWithCredential(credential);
    return  await _firebaseAuth.currentUser();
  }

  @override
  Future<String> getUserEmail() async{
    return (await _firebaseAuth.currentUser()).email;

  }

  @override
  Future<bool> isFacebookLoggedIn() async{

    return (await _facebookLogin.isLoggedIn);

  }

  @override
  Future<bool> isSignedIn() async{
    final currentUser = await _firebaseAuth.currentUser();
    return currentUser != null;
  }

  @override
  Future signInWithGoogle() async{
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();

    final GoogleSignInAuthentication googleAuth =await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(accessToken: googleAuth.accessToken,idToken: googleAuth.idToken,);
    
    await _firebaseAuth.signInWithCredential(credential);

    return _firebaseAuth.currentUser();
  }

  @override
  Future<void> signOut() {
    
    return Future.wait([
      _firebaseAuth.signOut(),
      _googleSignIn.signOut(),
      _facebookLogin.logOut()
    ]);
  }

  @override
  Future<Either<Failure, UserModel>> loginInWithFacebook() async{
    
    try {

      final result = await _facebookLogin.logInWithReadPermissions(['email',]);
  
      AuthCredential credential = FacebookAuthProvider.getCredential(accessToken:result.accessToken.token);
      await _firebaseAuth.signInWithCredential(credential);
      var firebaseUser = await _firebaseAuth.currentUser();
      var userModel = UserModel.fromFirebase(firebaseUser);

      return Right(userModel);

    } on PlatformException catch (e) {

      var failure = Failure(failure: e.message,code: e.code);
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, UserModel>> loginInWithGoogle() async{

    try {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();

      final GoogleSignInAuthentication googleAuth =await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(accessToken: googleAuth.accessToken,idToken: googleAuth.idToken,);
    
      await _firebaseAuth.signInWithCredential(credential);

      var firebaseUser = await _firebaseAuth.currentUser();

      var userModel = UserModel.fromFirebase(firebaseUser);

      return Right(userModel);

    } on PlatformException catch (e) {

      var failure = Failure(failure: e.message,code: e.code);
      
      return Left(failure);
    }

  }

  @override
  Future<Either<Failure, bool>> isLoggedIn() async{
    
    try {

      final currentUser = await _firebaseAuth.currentUser();
      var isLoggedIn =  currentUser != null;

      return Right(isLoggedIn);
      
    } on PlatformException catch (e) {
      
      var failure = Failure(failure: e.message,code: e.code);
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, UserModel>> currentUser() async{
    try {
      var firebaseUser = await _firebaseAuth.currentUser();
      var userModel = UserModel.fromFirebase(firebaseUser); 
      return Right(userModel);
    } on PlatformException catch (e) {
      var failure = Failure(failure: e.message,code: e.code);
      return Left(failure);
    }
  }
   
}


//  final FirebaseAuth _firebaseAuth;
//   final GoogleSignIn _googleSignIn;
//   final FacebookLogin _facebookLogin;

//   UserRepository({FirebaseAuth firebaseAuth, GoogleSignIn googleSignin,FacebookLogin facebookLogin})
//       : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
//         _googleSignIn = googleSignin ?? GoogleSignIn(),
//         _facebookLogin = facebookLogin ?? FacebookLogin();




//   Future<FirebaseUser> signInWithGoogle() async {

//     final GoogleSignInAccount googleUser = await _googleSignIn.signIn();

//     final GoogleSignInAuthentication googleAuth =await googleUser.authentication;
//     final AuthCredential credential = GoogleAuthProvider.getCredential(accessToken: googleAuth.accessToken,idToken: googleAuth.idToken,);
    
//     await _firebaseAuth.signInWithCredential(credential);

//     return _firebaseAuth.currentUser();


//   }

//   Future<FirebaseUser> facebookSignIn() async {
   
//     final result = await _facebookLogin.logInWithReadPermissions(['email',]);
  
//     AuthCredential credential = FacebookAuthProvider.getCredential(accessToken:result.accessToken.token);
//     await _firebaseAuth.signInWithCredential(credential);
//     return  await _firebaseAuth.currentUser();
//   }


  
//   //Fix this bug how to return an er ror

//   Future<void> verifyPhoneNumber(String phoneNumber) async {

//     try {

//         final PhoneVerificationCompleted verificationCompleted =(AuthCredential phoneAuthCredential) async { 
//         await _firebaseAuth.signInWithCredential(phoneAuthCredential);
//       };

//       final PhoneVerificationFailed verificationFailed = (AuthException authException) {
//         print('FIREBASE AUTH ${authException.message}') ;
//       };

//       final PhoneCodeSent codeSent = (String verificationId, [int forceResendingToken]) async {

//       };

//       final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout = (String verificationId) {};

//       await _firebaseAuth.verifyPhoneNumber(

//         phoneNumber: phoneNumber,
//         timeout: const Duration(seconds: 5),
//         verificationCompleted: verificationCompleted,
//         verificationFailed: verificationFailed,
//         codeSent: codeSent,
//         codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);

//       await _firebaseAuth.currentUser();
       
//     } catch (e) {}

//   }

//   Future<FirebaseUser> signInWithPhoneNumber({String verificationId, String smsCode}) async {
    
    
//     final AuthCredential credential = PhoneAuthProvider.getCredential(
//       verificationId: verificationId,
//       smsCode: smsCode,
//     );
//     final FirebaseUser user = (await _firebaseAuth.signInWithCredential(credential)).user;

//     final FirebaseUser currentUser = await _firebaseAuth.currentUser();

//     assert(user.uid == currentUser.uid);
//     assert(user.uid != null);

//     return user;
    
    
//   }

   

//   final FirebaseAuth _firebaseAuth;
//   final GoogleSignIn _googleSignIn;
//   final FacebookLogin _facebookLogin;

//   UserRepository({FirebaseAuth firebaseAuth, GoogleSignIn googleSignin,FacebookLogin facebookLogin})
//       : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
//         _googleSignIn = googleSignin ?? GoogleSignIn(),
//         _facebookLogin = facebookLogin ?? FacebookLogin();




//   Future<FirebaseUser> signInWithGoogle() async {

//     final GoogleSignInAccount googleUser = await _googleSignIn.signIn();

//     final GoogleSignInAuthentication googleAuth =await googleUser.authentication;
//     final AuthCredential credential = GoogleAuthProvider.getCredential(accessToken: googleAuth.accessToken,idToken: googleAuth.idToken,);
    
//     await _firebaseAuth.signInWithCredential(credential);

//     return _firebaseAuth.currentUser();


//   }

//   Future<FirebaseUser> facebookSignIn() async {
   
//     final result = await _facebookLogin.logInWithReadPermissions(['email',]);
  
//     AuthCredential credential = FacebookAuthProvider.getCredential(accessToken:result.accessToken.token);
//     await _firebaseAuth.signInWithCredential(credential);
//     return  await _firebaseAuth.currentUser();
//   }


  

    

   

//   Future<void> signOut() async {
//     return Future.wait([
//       _firebaseAuth.signOut(),
//       _googleSignIn.signOut(),
//       _facebookLogin.logOut()
//     ]);
//   }

//   Future<bool> isSignedIn() async {
//     final currentUser = await _firebaseAuth.currentUser();
//     return currentUser != null;
//   }

//   Future<String> getUserEmail() async {
//     return (await _firebaseAuth.currentUser()).email;
//   }

//   Future<String> getUserNumber() async{
//     return (await _firebaseAuth.currentUser()).phoneNumber;
//   }

//   Future<bool> isFacebookLoggedIn() async{
//     return (await _facebookLogin.isLoggedIn);
//   }
