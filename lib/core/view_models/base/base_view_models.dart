import 'package:flutter/widgets.dart';

class BaseViewModel with ChangeNotifier {
  bool _busy = false;

  bool get busy => _busy;

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }

  void goTo(BuildContext context,
      {required String path, bool pushAndReplace = false, dynamic args}) {
    if (pushAndReplace) {
      Navigator.pushNamedAndRemoveUntil(
          context, path, (Route<dynamic> route) => false,
          arguments: args);
    } else {
      Navigator.pushNamed(context, path, arguments: args);
    }
  }
}
