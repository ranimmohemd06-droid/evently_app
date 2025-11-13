import 'package:evently_app/auth/login/login_navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  var emailController = TextEditingController(text: 'ranim@gmail.com');
  var passwordController = TextEditingController(text: '123456');
  late LoginNavigator navigator;
  final formKey = GlobalKey<FormState>();

  void login() async {
    if (formKey.currentState?.validate() == true) {
      navigator.showMyLoading(message: 'loading...');
      try {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
              email: emailController.text,
              password: passwordController.text,
            );
        // var user = await FirebaseUtils.readUserFromFireStore(credential.user?.uid??'');
        // if (user==null){
        //   return;
        // }
        // var userProvider= Provider.of<UserProvider>(context,listen: false);
        // userProvider.updateUser(user);
        navigator.hideMyLoading();
        navigator.showMyMessage(message: 'login successfully.');
      } on FirebaseAuthException catch (e) {
        if (e.code == 'invalid-credential') {
          navigator.hideMyLoading();
          navigator.showMyMessage(
            message:
                'The supplied auth credential is incorrect... malformed or has expired.',
          );
        }
      } catch (e) {
        navigator.hideMyLoading();
        navigator.showMyMessage(message: e.toString());
      }
    }
  }
}
