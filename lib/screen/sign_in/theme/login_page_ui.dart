
import 'package:flutter/material.dart';
import 'package:project_flutter2/component/model/theme_model.dart';
import 'package:project_flutter2/screen/sign_in/login_bloc.dart';
import 'package:project_flutter2/screen/sign_in/theme/login_page_theme1.dart';

class LoginPageUI extends StatelessWidget {
  final TextEditingController ctrEmail, ctrPass;
  final FocusNode focusEmail, focusPass;
  final LoginBloc bloc;
  final Function signUp, login, forgotPassword, nextPage, signInWithAppleID, signInWithGoogle, signInWithFaceBook;
  const LoginPageUI(this.ctrEmail, this.ctrPass, this.focusEmail, this.focusPass,this.bloc,this.signUp, this.login, this.forgotPassword,
      this.nextPage,this.signInWithAppleID,this.signInWithFaceBook,this.signInWithGoogle, {Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    switch(ThemeModel.value){
      case ThemeModel.theme3:
        return LoginPageTheme1(ctrEmail, ctrPass, focusEmail, focusPass, bloc, signUp, login,
            forgotPassword, nextPage, signInWithAppleID, signInWithGoogle, signInWithFaceBook, key);
        default: return LoginPageTheme1(ctrEmail, ctrPass, focusEmail, focusPass, bloc, signUp, login,
            forgotPassword, nextPage, signInWithAppleID, signInWithGoogle, signInWithFaceBook, key);

    }
  }

}