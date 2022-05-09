import 'package:blindside/core/managers/shared_preference_manager.dart';
import 'package:blindside/dependency_injection.dart';
import 'package:blindside/features/register/domain/entity/register_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class RegisterDataSource {
  Future<User?> register(RegisterEntity registerEntity);
}

class RegisterDataSourceImpl extends RegisterDataSource {
  @override
  Future<User?> register(RegisterEntity registerEntity) async {
    User? user;

    try {
      UserCredential userCredential = await dI<FirebaseAuth>()
          .createUserWithEmailAndPassword(
              email: registerEntity.email, password: registerEntity.password);
      user = userCredential.user;
      await user!.reload();
      user.sendEmailVerification();
      user = dI<FirebaseAuth>().currentUser;
      SharedPreferencesManager.setBool('isFirstTime', false);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw FirebaseException(
            message: 'The password provided is too weak.', plugin: '');
      } else if (e.code == 'email-already-in-use') {
        throw FirebaseException(
            message: 'The account already exists for that email.', plugin: '');
      }
    }
    return user;
  }
}
