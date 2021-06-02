import 'package:firebase_auth/firebase_auth.dart';
import 'package:understanding_firebase/Screens/models/user.dart';
import 'package:understanding_firebase/services/database.dart';



class AuthService {

final FirebaseAuth  _auth = FirebaseAuth.instance;
//sign in
AppUser? _userFromFirebaseUser(User? user){

return user != null ? AppUser(uid:user.uid) : null;
}
Stream<User?> get user {
  return _auth.authStateChanges();
} 

Future signInAnon() async {
 try {
   UserCredential result = await _auth.signInAnonymously();
   User? user = result.user;
   return _userFromFirebaseUser(user!);
 } catch(e){
   print(e.toString());
   return null;
 }
 
}
//signin email ans password
Future loginWithEmailAndPassword(String email,String password) async{
  try{
    UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user= result.user;
      //creating a new user document for user
    await DataBase(uid: user!.uid).updateUserData('raju', '15', 'seller');
    return _userFromFirebaseUser(user);
  }catch(e){  
    print(e.toString());
      return null;

}}
//register
Future registerUsingEmailAndPassword(String email,String password) async{
  try{
    UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    User? user= result.user;
    return _userFromFirebaseUser(user);
  } catch(e){
      print(e.toString());
      return null;
  }
}

Future signOut() async{
  try{
    return await _auth.signOut();
  }catch(e){
    print(e.toString());
    return null;
  }
}
//signout
}