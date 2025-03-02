import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Uzbek (`uz`).
class MyLocalizationsUz extends MyLocalizations {
  MyLocalizationsUz([String locale = 'uz']) : super(locale);

  @override
  String get firstName => 'Ism';

  @override
  String get lastName => 'Familiya';

  @override
  String get username => 'Foydalanuvchi ism';

  @override
  String get email => 'Elektron poshta';

  @override
  String get phoneNumber => 'Telefon raqam';

  @override
  String get dateOfBirth => 'Tug\'ulgan sana';

  @override
  String get password => 'Parol';

  @override
  String get confirmPassword => 'Parolni tasdiqlash';
}
