import 'package:evently_app/auth/register/register_navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class RegisterViewModel extends ChangeNotifier {
  late RegisterNavigator navigator;

  void register(String email, String password) async {
    navigator.showMyLoading(message: 'waiting...');
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      /* MyUser myUser = MyUser(
          id: credential.user?.uid ?? '',
          name: nameController.text,
          email: emailController.text
      );
      await FirebaseUtils.addUserToFirestore(MyUser(
          id: credential.user?.uid ?? '',
          name: nameController.text,
          email: emailController.text)
      );


      await credential.user?.updateDisplayName(nameController.text);
      var userProvider = Provider.of<UserProvider>(context, listen: false);
      userProvider.updateUser(myUser);

      */
      navigator.hideMuLoading();
      navigator.showMyMessage(message: 'register successfully.');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        navigator.hideMuLoading();
        navigator.showMyMessage(message: 'The password provided is too weak..');
      } else if (e.code == 'email-already-in-use') {
        navigator.hideMuLoading();
        navigator.showMyMessage(
          message: 'The account already exists for that email.',
        );
      }
    } catch (e) {
      navigator.hideMuLoading();
      navigator.showMyMessage(message: e.toString());
    }
  }
}
