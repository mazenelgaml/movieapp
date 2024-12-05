import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseAuthServices
{
  FirebaseAuth _auth=FirebaseAuth.instance;
  Future<User?> signUpwithEmailAndPassword(String email,String password)async
  {
    try
    {
      UserCredential credential= await _auth.createUserWithEmailAndPassword(email: email, password: password);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('uid', credential.user?.uid??"");
      return credential.user;
    }catch(e)
    {
      print("some error occured");
    }
    return null;
  }
  Future<User?> signInwithEmailAndPassword(String email,String password)async
  {
    try
    {
      UserCredential credential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('uid', credential.user?.uid??"");
      return credential.user;
    }catch(e)
    {
      print("some error occured");
    }
    return null;
  }
}