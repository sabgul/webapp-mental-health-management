import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class WelloMobileFirebaseUser {
  WelloMobileFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

WelloMobileFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<WelloMobileFirebaseUser> welloMobileFirebaseUserStream() => FirebaseAuth
    .instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<WelloMobileFirebaseUser>(
        (user) => currentUser = WelloMobileFirebaseUser(user));
