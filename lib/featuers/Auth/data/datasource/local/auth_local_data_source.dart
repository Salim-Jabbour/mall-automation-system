import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSource {
  const AuthLocalDataSource();

  //set user token
  Future<void> setUserToken(String token);

  //get the current token
  Future<String?> getUserToken();

  //set user role
  Future<void> setUserRole(String role);

  Future<void> setUserName(String name);
  Future<String?> getUserName();

  //get current user role
  Future<String?> getUserRole();

  //clear user data (role & token)
  Future<void> clearAllUserData();

  Future<void> setInvestmentOptine(int investmentOption);

  //get the current investmentOption
  int? getInvestmentOptine();
}

class AuthLocalDataSourceImpl extends AuthLocalDataSource {
  AuthLocalDataSourceImpl(this._prefs);

  final _keyToken = 'token';
  final _keyRole = 'role';
  final _keyInvestmentOption = 'investmentOption';
  final _keyName = 'name';

  final SharedPreferences _prefs;

  @override
  Future<String?> getUserRole() async {
    return _prefs.getString(_keyRole);
  }

  @override
  Future<String?> getUserToken() async {
    return _prefs.getString(_keyToken);
  }

  @override
  int? getInvestmentOptine() {
    return _prefs.getInt(_keyInvestmentOption);
  }

  @override
  Future<void> setUserRole(String role) async {
    await _prefs.setString(_keyRole, role);
  }

  @override
  Future<void> setUserToken(String token) async {
    await _prefs.setString(_keyToken, token);
  }

  @override
  Future<void> setUserName(String name) async {
    await _prefs.setString(_keyName, name);
  }

  @override
  Future<String?> getUserName() async {
    return _prefs.getString(_keyName);
  }

  @override
  Future<void> setInvestmentOptine(int investmentOption) async {
    await _prefs.setInt(_keyInvestmentOption, investmentOption);
  }

  @override
  Future<void> clearAllUserData() async {
    await _prefs.remove(_keyToken);
    await _prefs.remove(_keyRole);

  }
}
