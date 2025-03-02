import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class MyLocalizationsEn extends MyLocalizations {
  MyLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get firstName => 'First Name';

  @override
  String get lastName => 'Last Name';

  @override
  String get username => 'Username';

  @override
  String get email => 'Email';

  @override
  String get phoneNumber => 'Phone Number';

  @override
  String get dateOfBirth => 'Date Of Birth';

  @override
  String get password => 'Password';

  @override
  String get confirmPassword => 'Confirm Password';
}
