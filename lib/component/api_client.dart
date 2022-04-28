import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:project_flutter2/component/util/until.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http_parser/http_parser.dart';

import 'base_response.dart';
import 'constants.dart';
import 'multi_language.dart';

class ApiClient {
  static ApiClient? _instance;
  final httpClient = http.Client();

  ApiClient._();

  static void init() {
    _instance??=ApiClient._();
  }

  factory ApiClient() => _instance!;

  Future<String> getString(String url) async {
    try {
      final response = await httpClient.get(Uri.parse(url)).timeout(const Duration(seconds: 20));
      if (response.statusCode == 200) {
        return response.body;
      }
    } catch(_) {}
    return '';
  }

  Future<Uint8List?> getFile(String url, {int timeout = 20}) async {
    try {
      final response = await httpClient.get(Uri.parse(url)).timeout(Duration(seconds: timeout));
      if (response.statusCode == 200) {
        return response.bodyBytes;
      }
    } catch(e) {}
    return null;
  }

  Future<BaseResponse> getAPI(String path, data, {bool hasHeader = true, bool hasDomain = true}) async {
    final baseResponse = BaseResponse();
    try {
      http.Response response;
      final prefs = await SharedPreferences.getInstance();
      if (hasHeader && prefs.containsKey(Constants.isLogin) &&
          prefs.getBool(Constants.isLogin)!) {
        response = await httpClient.get(Uri.parse(Constants.baseUrl + path),
            headers: await _getHeader()).timeout(const Duration(seconds: 20));
      } else {
        response = await httpClient.get(Uri.parse((hasDomain ? Constants.baseUrl : '') + path))
            .timeout(const Duration(seconds: 20));
      }
      baseResponse.fromJson(jsonDecode(response.body), data);
    } catch (e) {
      return _responseError(baseResponse, e);
    }
    return baseResponse;
  }

  Future<BaseResponse> postAPI(String url, String method, data,
      {hasHeader = true, Map<String, String>? body,
      List<String>? files, String paramFile = 'file'}) async {
    final baseResponse = BaseResponse();
    try {
      final request = http.MultipartRequest(method, Uri.parse(Constants.baseUrl + url));

      if (hasHeader) request.headers.addAll(await _getHeader());

      if (body != null) request.fields.addAll(body);

      if (files != null) {
        for (String path in files) {
          request.files.add(_createPartFile(File(path), paramFile));
        }
      }

      final streamResponse = await request.send().timeout(const Duration(seconds: 20));
      final response = await http.Response.fromStream(streamResponse);
      baseResponse.fromJson(jsonDecode(response.body), data);
    } catch (e) {
      return _responseError(baseResponse, e);
    }
    return baseResponse;
  }

  Future<BaseResponse> postJsonAPI(String url, data, body, {bool hasHeader = true}) async {
    final baseResponse = BaseResponse();
    try {
      final headers = {'Content-Type': 'application/json; charset=utf-8'};
      if (hasHeader) headers.addAll(await _getHeader());
      final response = await http.post(Uri.parse(Constants.baseUrl + url),
          headers: headers, body: jsonEncode(body));
      baseResponse.fromJson(jsonDecode(response.body), data);
    } catch (e) {
      return _responseError(baseResponse, e);
    }
    return baseResponse;
  }

  Future<Map<String, dynamic>> postRealJsonAPI(String url, Map<String, String> headers, Map<String, dynamic> body) async {
    try {
      final response = await http.post(Uri.parse(url), headers: headers, body: body);
      return jsonDecode(response.body);
    } catch (e) {
      return {'error': e.toString()};
    }
    //return {'error': MultiLanguage.get(LanguageKey.msgSystemError)};
  }

  BaseResponse _responseError(BaseResponse baseResponse, error) {
    if (error.runtimeType.toString() == 'SocketException')
      baseResponse.setDataError(
          error: MultiLanguage.get(LanguageKey.msgNetworkError));
    else
      baseResponse.setDataError();
    return baseResponse;
  }

  Future<Map<String, String>> _getHeader() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getString(Constants.keyTokenUser));
    return {'Authorization': prefs.getString(Constants.keyTokenUser)!};
  }

  http.MultipartFile _createPartFile(File file, String paramFile) {
    String fileName = file.path.split('/').last;
    return http.MultipartFile.fromBytes(paramFile, file.readAsBytesSync(),
        filename: fileName,
        contentType: Util.isImage(fileName)
            ? MediaType("image", "*")
            : MediaType("video", "*"));
  }
}
