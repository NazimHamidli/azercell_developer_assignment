import 'package:azercell_developer_assignment/src/app.dart';
import 'package:azercell_developer_assignment/src/domain/user.dart';
import 'package:azercell_developer_assignment/src/utils/widget_extensions.dart';
import 'package:flutter/material.dart';
import '../../domain/validation_item.dart';
import '../home/home_screen.dart';

class RegisterProvider extends ChangeNotifier {
  List<int> prefixes = [50, 51, 10, 55, 70, 77, 90, 99];

  ValidationItem _name = ValidationItem(null, null);
  ValidationItem _surname = ValidationItem(null, null);
  ValidationItem _dob = ValidationItem(null, null);
  ValidationItem _gsmNumber = ValidationItem(null, null);

  ValidationItem get name => _name;
  ValidationItem get surname => _surname;
  ValidationItem get gsmNumber => _gsmNumber;
  ValidationItem get dob => _dob;

  bool get isValid {
    if (_name.value != null &&
        _surname.value != null &&
        _gsmNumber.value != null &&
        dob.value != null) {
      return true;
    } else {
      return false;
    }
  }

  void changeName(String value) {
    if (value.length >= 3) {
      _name = ValidationItem(value, null);
    } else {
      _name = ValidationItem(null, "Must be at least 3 characters");
    }
    notifyListeners();
  }

  void changeSurname(String value) {
    if (value.length >= 3) {
      _surname = ValidationItem(value, null);
    } else {
      _surname = ValidationItem(null, "Must be at least 3 characters");
    }

    notifyListeners();
  }

  void changeDOB(String value) {
    try {
      DateTime.parse(value);
      _dob = ValidationItem(value, null);
    } catch (error) {
      _dob = ValidationItem(null, "Invalid Format");
    }
    notifyListeners();
  }

  void changeGSMNumber(String value) {
    _gsmNumber = ValidationItem(null, null);

    if (value.length >= 2) {
      if (!prefixes.contains(int.parse(value.substring(0, 2)))) {
        _gsmNumber = ValidationItem(null, 'Invalid operator code');
      }
    }
    if (value.length == 9 &&
        prefixes.contains(int.parse(value.substring(0, 2)))) {
      _gsmNumber = ValidationItem(value, null);
    }
    notifyListeners();
  }

  void register() {
    final navigator = Navigator.of(navigatorKey.currentContext!);
    User user = User(
      name: _name.value,
      surname: _surname.value,
      birthDate: _dob.value,
      gsmNumber: _gsmNumber.value,
    );
    navigator.pushAndRemoveUntil(
      HomeScreen(
        user: user,
      ).route,
      (route) => false,
    );
  }
}
