import 'package:shared_preferences/shared_preferences.dart';

Future sharedpreference(key,data) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(key, data);
}

Future getsharedpreference(key) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString(key);
}

Future delete(key) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove(key);
}