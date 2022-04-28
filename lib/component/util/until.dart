import 'dart:convert';
import 'package:project_flutter2/component/constants.dart';
import 'package:project_flutter2/component/import_base_lib.dart';
import 'package:project_flutter2/screen/address/address_model.dart';
import 'package:project_flutter2/screen/cart/cart_model.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_messaging/firebase_messaging.dart';
//import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'dart:io' show NetworkInterface, Platform;
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:project_flutter2/component/util/import_lib_util_time.dart' as timeago;
import 'package:package_info_plus/package_info_plus.dart';
//import 'package:google_sign_in/google_sign_in.dart';
//import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class Util {
  static Future<String> signInWithAppleID() async {
    // final appleIdCredential = await SignInWithApple.getAppleIDCredential(
    //     scopes: [
    //       AppleIDAuthorizationScopes.email,
    //       AppleIDAuthorizationScopes.fullName
    //     ],
    //     webAuthenticationOptions: Platform.isAndroid ? WebAuthenticationOptions(
    //         clientId: 'vn.advn.ecommerce.service',
    //         redirectUri: Uri.parse('https://button-galvanized-ceres.glitch.me/callbacks/sign_in_with_apple')
    //     ) : null
    // );
    //
    // final oAuthProvider = OAuthProvider('apple.com');
    // final credential = oAuthProvider.credential(
    //     idToken: appleIdCredential.identityToken,
    //     accessToken: appleIdCredential.authorizationCode
    // );
    //
    // final result = await FirebaseAuth.instance.signInWithCredential(credential);
    // if (result.user != null) {
    //   FirebaseAuth.instance.signOut();
    //   return result.user!.email!;
    // }
    return '';
  }

  static Future<String> signInWithGoogle() async {
    // final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: <String>['email']);
    // final account = await _googleSignIn.signIn();
    // if (account != null) {
    //   _googleSignIn.signOut();
    //   return account.email;
    // }
    return '';
  }

  static Future signInWithFaceBook() async {
    // return FacebookAuth.i.login(permissions: ['email']).then((LoginResult account) async {
    //   if (account.status == LoginStatus.success) {
    //     final data = await FacebookAuth.i.getUserData();
    //     FacebookAuth.i.logOut();
    //     return data['email'];
    //   }
    //   return '';
    // }).onError((error, stackTrace) => '').catchError((error) => '');
  }

  static Future<String> getIP() {
    return NetworkInterface.list().then((value) {
      for (var interface in value.toList()) {
        for (var item in interface.addresses) {
          if (item.address.isNotEmpty) return item.address;
        }
      }
      return '192.168.1.10';
    });
  }

  // static String stringToLinkHtml(String str, {double width = 0.0, double height = 0.0}) {
  //   String result = str;
  //   if (str.length > 2) {
  //     String tmp = str;
  //     RegExp exp = RegExp(Constants.patternLinkHtml);
  //     Iterable<RegExpMatch> matches = exp.allMatches(str.toLowerCase());
  //     for (var match in matches) {
  //       String url = tmp.substring(match.start, match.end);
  //       if (url.contains('..') || double.tryParse(url) != null) {continue;}
  //       else {
  //         String symbol = '';
  //         if (match.start > 0) symbol = tmp.substring(match.start - 1, match.start);
  //         if (!symbol.contains('#') && url.length > 3) {
  //           String http = url;
  //           if (!url.toLowerCase().contains('http')) http = 'https://$url';
  //           result = result.replaceFirst(
  //             url,
  //             "<a href='$http'>$url</a>",
  //           );
  //         }
  //       }
  //     }
  //   }
  //   return result;
  // }

  static Future<PermissionStatus> checkPermission(Permission permission) async {
    PermissionStatus status = await permission.status;
    if (status == PermissionStatus.denied ||
        status == PermissionStatus.limited) {
      return permission.request();
    } else if (status == PermissionStatus.restricted ||
        status == PermissionStatus.permanentlyDenied) openAppSettings();
    return status;
  }

  // static Future<int> countCart() => SharedPreferences.getInstance().then((prefs) {
  //   if (prefs.containsKey(Constants.carts)) {
  //     String? temp = prefs.getString(Constants.carts);
  //     if (temp != null && temp.isNotEmpty) return jsonDecode(temp).length;
  //   }
  //   return 0;
  // });

  static Future<List<CartModel>> getCarts() =>
      SharedPreferences.getInstance().then((prefs) {
        List<CartModel> carts = [];
        if (prefs.containsKey(Constants.carts)) {
          String? temp = prefs.getString(Constants.carts);
          if (temp != null && temp.isNotEmpty) {
            final json = jsonDecode(temp);
            json.forEach((ele) => carts.add(CartModel().fromJson(ele)));
          }
        }
        return carts;
      });

  static Future<bool> saveCarts(List<CartModel> carts) =>
      SharedPreferences.getInstance().then((prefs) {
        return prefs.setString(Constants.carts, jsonEncode(carts));
      });

  static Future<List<String>> getSearches({String keyLabel = Constants.addressSearches}) =>
      SharedPreferences.getInstance().then((prefs) {
        List<String> list = [];
        if (prefs.containsKey(keyLabel)) list.addAll(prefs.getStringList(keyLabel)!);
        return list;
      });

  static Future<bool> saveSearches(List<String> searches, {String keyLabel = Constants.addressSearches}) =>
      SharedPreferences.getInstance().then((prefs) {
        return prefs.setStringList(keyLabel, searches);
      });

  static Future<AddressModel> getAddress() => SharedPreferences.getInstance().then((prefs) =>
      _getAddress(prefs, isDefault: prefs.containsKey(Constants.keyDefaultAddress) &&
          prefs.getString(Constants.keyDefaultAddress)!.isNotEmpty));

  static Future<AddressModel> getAddressDefault() => SharedPreferences.getInstance().then((prefs) {
    if (prefs.containsKey(Constants.keyDefaultAddress) &&
        prefs.getString(Constants.keyDefaultAddress)!.isNotEmpty)
      return _getAddress(prefs, isDefault: true);
    else return getCurrentAddress();
  });

  static Future<AddressModel> getCurrentAddress() => SharedPreferences.getInstance().then((prefs) {
    if (prefs.containsKey(Constants.keyCurrentAddress)) {
      final String temp = prefs.getString(Constants.keyCurrentAddress)!;
      return AddressModel().fromJson(jsonDecode(temp));
    } else return _getAddress(prefs);
  });

  static Future<void> setCurrentAddress(AddressModel address) => SharedPreferences.getInstance().then((prefs) {
    prefs.setString(Constants.keyCurrentAddress, jsonEncode(address.toJson()));
  });

  static AddressModel _getAddress(SharedPreferences prefs, {bool isDefault = false}) {
    final address = AddressModel();
    address.name = prefs.getString(Constants.keyName)!;
    address.address = prefs.getString(Constants.keyAddress)!;
    address.phone = prefs.getString(Constants.keyPhone)!;
    address.city = prefs.getString(Constants.keyCity)!;
    address.city_id = prefs.getInt(Constants.keyCityId)!;
    address.district = prefs.getString(Constants.keyDistrict)!;
    address.district_id = prefs.getInt(Constants.keyDistrictId)!;
    address.isDefault = isDefault;
    return address;
  }

  static String getFullAddress(String address, String city, String district) {
    String temp = address;
    if (district.isNotEmpty) {
      if (temp.isNotEmpty) temp += ', $district';
      else temp = district;
    }
    if (city.isNotEmpty) {
      if (temp.isNotEmpty) temp += ', $city';
      else temp = city;
    }
    return temp;
  }

  static dynamic getValueFromJson(json, String key, dynamic defaultValue) {
    if (json.containsKey(key) && json[key] != null) return json[key];
    return defaultValue;
  }

  static bool checkKeyFromJson(json, String key) =>
      json.containsKey(key) && json[key] != null && json.isNotEmpty;

  static bool isImage(String url) =>
      url.contains('.jpg') ||
          url.contains('.jpeg') ||
          url.contains('.png') ||
          url.contains('.gif') ||
          url.contains('.ico') ||
          url.contains('.svg');

  static bool isVideo(String url) =>
      url.contains('.mp4') ||
          url.contains('.ogv') ||
          url.contains('.webm') ||
          url.contains('.3gp') ||
          url.contains('.m3u8') ||
          url.contains('.avi') ||
          url.contains('.mov');

  static bool isAudio(String url) =>
      url.contains('.mp3') ||
          url.contains('.ogg') ||
          url.contains('.wma') ||
          url.contains('.m4a') ||
          url.contains('.wav');

  static String doubleToString(double value,
      {String locale = Constants.localeENLang, int? digits}) {
    int decimalDigits = Constants.decimalDigitsEN;
    if (locale == Constants.localeVILang) decimalDigits = Constants.decimalDigitsVI;

    digits ??= decimalDigits;

    String tmp = value.toString();
    try {
      final nfc = NumberFormat.currency(locale: locale, decimalDigits: digits);
      tmp = nfc.format(value).replaceAll(RegExp(nfc.currencyName!), '').trim();
    } catch (_) {}
    return tmp;
  }

  static String dateToString(DateTime date,
      {String pattern = Constants.datePatternEN,
        String locale = Constants.localeEN}) {
    initializeDateFormatting(locale, null);
    return DateFormat(pattern, locale).format(date);
  }

  static DateTime stringToDateTime(String source,
      {String pattern = Constants.dateTimePattern,
        String locale = Constants.localeEN}) {
    try {
      initializeDateFormatting(locale, null);
      return DateFormat(pattern, locale).parse(source);
    } catch (_) { return DateTime.now(); }
  }

  static String getTimeAgo(String strDatetime) {
    final now = DateTime.now();
    final ago = Util.stringToDateTime(strDatetime);
    final dua = now.difference(ago);
    if (Constants.locale == Constants.localeEN) {
      return timeago.format(now.subtract(dua));
    } else {
      timeago.setLocaleMessages(Constants.localeVILang, timeago.ViMessages());
      return timeago.format(now.subtract(dua), locale: Constants.localeVILang);
    }
  }

  static void clearFirebaseToken() {
    // FirebaseMessaging.instance.deleteToken();
    // final FlutterLocalNotificationsPlugin notify = FlutterLocalNotificationsPlugin();
    // notify.cancelAll();
    // SharedPreferences.getInstance().then((prefs) {
    //   prefs.setString(Constants.fireBaseToken, '');
    // });
  }

  // static Future<String> getFirebaseToken() => FirebaseMessaging.instance
  //     .getToken().then((String? token) {
  //   if (token == null) return '';
  //   SharedPreferences.getInstance().then((prefs) {
  //     prefs.setString(Constants.fireBaseToken, token);
  //   });
  //   return token;
  // }).catchError((error) => '');

  static Future<String> getDeviceId() async {
    String imei = '';
    try {
      imei = (await PlatformDeviceId.getDeviceId)!;
    } catch (e) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (prefs.containsKey(Constants.deviceId)) imei = prefs.getString(Constants.deviceId)!;
    }
    return imei;
  }

  // static Future<Map<String, String>> getDeviceInfo() async {
    // final String token = await getFirebaseToken();
    // String device = '';
    // String type, name, os, version;
    // version = (await PackageInfo.fromPlatform()).version;
    // if (Platform.isAndroid) {
    //   type = 'Android';
    //   var androidInfo = await PlatformDeviceId.deviceInfoPlugin.androidInfo;
    //   os = androidInfo.version.release;
    //   name = androidInfo.model;
    //   device = await getDeviceId();
    // } else {
    //   type = 'iOS';
    //   var iosInfo = await PlatformDeviceId.deviceInfoPlugin.iosInfo;
    //   os = iosInfo.systemVersion;
    //   name = iosInfo.name;
    //   device = iosInfo.identifierForVendor;
    // }
    // SharedPreferences.getInstance().then((prefs) {
    //   prefs.setString(Constants.deviceId, device);
    // });
    // return {
    //   'device': device,
    //   'name': name,
    //   'type': type,
    //   'os': os,
    //   'version': version,
    //   'token': token
    // };
 // }
}
