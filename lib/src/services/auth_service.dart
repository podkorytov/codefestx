import 'dart:html';

import 'package:codefest/src/models/auth.response.dart';
import 'package:codefest/src/models/auth_get_url.response.dart';
import 'package:codefest/src/models/auth_type.enum.dart';
import 'package:codefest/src/services/http_proxy.dart';

class AuthService {
  static const tokenStorageKey = 'token';
  static const userNameStorageKey = 'userName';
  static const initStorageKey = 'init';
  static const initStorageValue = 'yes';

  final HttpProxy _http;

  AuthService(this._http);

  void init() {
    window.localStorage[initStorageKey] = initStorageValue;
  }

  void _clearToken() {
    window.localStorage.remove(tokenStorageKey);
  }

  void logout() {
    _clearToken();
    window.location.href = '/';
  }

  void login(AuthType authType) async {
    _clearToken();
    final url = _authUrls[authType];
    final auth = await _http.get<AuthGetUrlResponse>(url, decoder: (j) => AuthGetUrlResponse.fromJson(j));
    window.location.href = auth.url;
  }

  Map<AuthType, String> _authUrls = {
    AuthType.VK: 'auth/vk/uri',
    AuthType.Facebook: 'auth/facebook/uri',
    AuthType.GitHub: 'auth/github/uri',
  };

  Map<String, String> _stateToUrl = {
    '{vkstate}': 'auth/vk/callback',
    '{fbstate}': 'auth/facebook/callback',
    '{ghstate}': 'auth/github/callback',
  };

  processAuth(Map<String, String> queryParameters) async {
    final code = queryParameters['code'];
    final state = queryParameters['state'];
    final url = '${_stateToUrl[state]}?code=$code';
    final authResponse = await _http.get<AuthResponse>(url, decoder: (j) => AuthResponse.fromJson(j));
    window.localStorage[tokenStorageKey] = authResponse.token;
    window.localStorage[userNameStorageKey] = authResponse.userName;
  }
}
