import 'package:blindside/dependency_injection.dart';
import 'package:blindside/features/login/domain/entity/login_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginDataSource {
  Future<User?> login(LoginEntity loginEntity);
}

class LoginDataSourceImpl extends LoginDataSource {
  @override
  Future<User?> login(LoginEntity loginEntity) async {
    User? user;

    try {
      UserCredential userCredential = await dI<FirebaseAuth>()
          .signInWithEmailAndPassword(
              email: loginEntity.email, password: loginEntity.password);
      user = userCredential.user;
      await user!.reload();
      user = dI<FirebaseAuth>().currentUser;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw FirebaseException(
            message: 'No user found for that email.', plugin: '');
      } else if (e.code == 'wrong-password') {
        throw FirebaseException(
            message: 'Wrong password provided.', plugin: '');
      }
    }
    return user;
  }
}
