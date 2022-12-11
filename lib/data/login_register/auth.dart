import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _auth;
  Auth({required FirebaseAuth firebaseAuth}) : _auth = firebaseAuth;

  User? get currentUser => _auth.currentUser;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<void> signInWithEmailAndPassword({required String email, required String password,}) async{
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }
  Future<void> signOut() async {
    await _auth.signOut();
  }
  Future<void> createUserWithEmailAndPassword({required String email, required String password,}) async{
    await _auth.createUserWithEmailAndPassword(email: email, password: password);
  }
  Stream<User?> authState() async* {
    yield* _auth.authStateChanges();
  }

}