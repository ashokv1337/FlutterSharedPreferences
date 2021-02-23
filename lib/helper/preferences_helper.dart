import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHelper {
  static SharedPreferences sharedPreferences;

  init() async {
    print('B=B init.start');
    //SharedPreferences.setMockInitialValues({});
    try {
      if (sharedPreferences == null) {
        sharedPreferences = await SharedPreferences.getInstance();
      }
    } catch (e) {
      print('B=B init.Exception = ${e.toString()}');
    }

    print('B=B init $sharedPreferences');
    print('B=B init.end');
  }

  Future<bool> isFirstRun() async {
    print('B=B isFirstRun.start');
    bool isFirstRun = sharedPreferences.getBool('first_run');
    print('B=B isFirstRun.isFirstRun = $isFirstRun');
    if (isFirstRun == null) {
      await sharedPreferences.setBool('first_run', true);
      isFirstRun = true;
      print('B=B isFirstRun.setBool true');
    }
    print('B=B isFirstRun.end');
    return Future.value(isFirstRun);
  }

  Future<bool> setFirstRun() async {
    print('B=B setFirstRun.start');
    await sharedPreferences.setBool('first_run', false);
    bool isFirstRun = sharedPreferences.getBool('first_run');
    print('B=B setFirstRun.end');
    print('B=B setFirstRun.end');
    return Future.value(isFirstRun);
  }
}

