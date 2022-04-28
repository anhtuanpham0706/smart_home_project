
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_flutter2/component/constants.dart';
import 'package:project_flutter2/component/ui/button_custom.dart';
import 'package:project_flutter2/component/ui/ecommerce_style.dart';
import 'package:project_flutter2/component/ui/login_with_orthers.dart';
import 'package:project_flutter2/component/ui/text_custom.dart';
import 'package:project_flutter2/component/ui/ui_theme1/theme1_textfield.dart';
import 'package:project_flutter2/component/util/util_ui.dart';
import 'package:project_flutter2/screen/sign_in/theme/login_page_ui.dart';

import '../../../component/multi_language.dart';

class LoginPageTheme1 extends LoginPageUI {
  const LoginPageTheme1(ctrEmail, ctrPass, focusEmail, focusPass, bloc, signUp,
      login, forgotPassword, nextPage, signInWithAppleID, signInWithGoogle, signInWithFaceBook, key)
      : super(ctrEmail, ctrPass, focusEmail, focusPass, bloc, signUp, login, forgotPassword,
      nextPage, signInWithAppleID, signInWithGoogle, signInWithFaceBook, key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: Image.asset('assets/images/theme3/bg_fruit.jpg').image,
                fit: BoxFit.fill
            )
        ),
        child: Stack(children: [
          Column(children: [
            Expanded(child: Container(height: 1.sh,
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.7),
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(24.sp),
                        bottomRight: Radius.circular(24.sp))),
                child: Column(children: [
                  Expanded(child: ListView(
                      padding: EdgeInsets.fromLTRB(24.sp, ScreenUtil().statusBarHeight + 84.sp, 24.sp, 0),
                      children: [
                        TextCustom(MultiLanguage.get(LanguageKey.btnLogin), size: 24.sp, weight: FontWeight.bold,
                            color: const Color(0xFF4D3E09), fontFamily: 'Segoe UI', align: TextAlign.center),
                        SizedBox(height: 84.sp),
                        Theme3TextField(ctrEmail, focusEmail, Icons.phone_android_outlined, LanguageKey.lblYourPhoneNumber, type: TextInputType.phone),//
                        SizedBox(height: 16.sp),
                        Theme3TextField(ctrPass, focusPass, Icons.lock_outline, LanguageKey.lblPassword,//
                            password: true, action: TextInputAction.done, funDone: login),
                        FlatButton(onPressed: () => forgotPassword(),
                            child: TextCustom(MultiLanguage.get(LanguageKey.btnForgot), size: 14.sp,//
                                color: const Color(0xFF515151), fontFamily: 'Segoe UI')),
                        LoginWithOthers(signInWithFaceBook, signInWithGoogle, signInWithAppleID)
                      ])),
                  Container(width: 1.sw, padding: EdgeInsets.fromLTRB(24.sp, 24.sp, 24.sp, 0),
                      child: ButtonCustom(login, TextCustom(MultiLanguage.get(LanguageKey.btnLogin),//
                          size: 18.sp, color: Colors.white, fontFamily: 'Segoe UI',
                          weight: FontWeight.bold), padding: 10.sp, elevation: 0)),
                  TextButton(onPressed: () => nextPage(), child: TextCustom('Bỏ qua', size: 14.sp, color: Colors.black))//MultiLanguage.get(LanguageKey.btnSkip)
                ])
            )),
            Padding(padding: EdgeInsets.only(top: 20.sp, bottom: 40.sp), child: TextButton(onPressed: () => signUp(),
                child: TextCustom(MultiLanguage.get('btn_sign_up').toUpperCase(), size: 14.sp,//
                    color: const Color(0xFF383838), fontFamily: 'Segoe UI', weight: FontWeight.bold)))
          ]),
          // Constants.showShop ? Padding(padding: EdgeInsets.only(left: 16.sp, top: ScreenUtil().statusBarHeight + 10.sp), child: IconAction(() => UtilUI.goToPage(context, ShopPage()), 'assets/images/ic_arrow_back.png',
          //     width: 22.sp, height: 20.sp, padding: 3.sp, color: ECommerceStyle.color8B, bgColor: Colors.black12)) : const SizedBox()
        ]),
      ),
    );
  }
  }