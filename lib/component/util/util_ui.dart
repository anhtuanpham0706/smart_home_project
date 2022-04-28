

import 'package:flutter/material.dart';
import 'package:project_flutter2/component/base_response.dart';
import 'package:project_flutter2/component/constants.dart';
import 'package:project_flutter2/component/model/theme_model.dart';
import 'package:project_flutter2/component/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UtilUI {


  static void goBack(BuildContext context, value) => Navigator.of(context).pop(value);

  static void clearAllPages(BuildContext context) {
    while (Navigator.of(context).canPop()) Navigator.of(context).pop(false);
  }

  static void goToPage(BuildContext context, dynamic page,
      {bool clearAllPage = false, bool hasBack = false, Function? callback}) {
    if (hasBack) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => page)).then((value) {
        if (callback != null && value != null) callback(value);
      });
    } else {
      if (clearAllPage) clearAllPages(context);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => page));
    }
  }
  static bool checkResponse(BuildContext context, BaseResponse response, {bool showError = true, bool passString = false}) {
    if (response.checkTimeout()) {
      // showCustomAlertDialog(
      //     context, MultiLanguage.get(LanguageKey.msgAnotherLogin)).then((value) => logout(context));
      // return false;
    }
    if (response.checkOK(passString: passString)) return true;
    if (showError && response.data != null) {
      // showCustomAlertDialog(context, response.data);
    }
    return false;
  }
  static saveInfo(UserModel info, {bool saveAccount = false, dynamic nextPage, BuildContext? context})
  => SharedPreferences.getInstance().then((prefs) {
    // prefs.setInt(Constants.keyId, info.id);
    // prefs.setString(Constants.keyName, info.name);
    // prefs.setString(Constants.keyEmail, info.email);
    // prefs.setString(Constants.keyPhone, info.phone);
    // prefs.setString(Constants.keyAddress, info.address);
    // prefs.setString(Constants.keyDefaultAddress, info.default_address);
    // prefs.setString(Constants.keyGender, info.gender);
    // prefs.setString(Constants.keyBirthday, info.birthdate);
    // prefs.setString(Constants.keyImage, info.image);
    // prefs.setString(Constants.keyCity, info.city);
    // prefs.setInt(Constants.keyCityId, info.city_id);
    // prefs.setString(Constants.keyDistrict, info.district);
    // prefs.setInt(Constants.keyDistrictId, info.district_id);
    // Constants.avatar = info.image;
    // if (saveAccount) {
    //   prefs.setString(Constants.keyTokenUser, info.token_user);
    //   prefs.setString(Constants.keyLogin, info.key_login);
    //   prefs.setString(Constants.keyPassword, info.password);
    //   prefs.setBool(Constants.isLogin, true);
    //   Constants.valueLogin = true;
    // }
    // if (nextPage != null) goToPage(context!, nextPage, clearAllPage: true);
  });
  static Future<void> setTheme() => SharedPreferences.getInstance().then((prefs) async {
    if (prefs.containsKey(Constants.keyTheme)) ThemeModel.value = prefs.getInt(Constants.keyTheme)!;
    else prefs.setInt(Constants.keyTheme, ThemeModel.value);
    ThemeModel.setPrimaryColor();

    if (prefs.containsKey('shopId')) Constants.apiVersion = '/api/${prefs.getInt('shopId')}/v1/';

    // if (prefs.containsKey(Constants.isLogin) && prefs.getBool(Constants.isLogin)!) {
    //   String? token = await FirebaseMessaging.instance.getToken();
    //   if (token != null && token.isNotEmpty) prefs.setString(Constants.fireBaseToken, token);
    //   Constants.valueLogin = true;
    //   Constants.avatar = prefs.getString(Constants.keyImage)!;
    //   if (prefs.containsKey(Constants.payment)) Constants.paymentValue = prefs.getInt(Constants.payment)!;
    // }
  });
}