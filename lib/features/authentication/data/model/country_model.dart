import 'package:smart_pay/core/core.dart';

class Country {
  final String countryFlag;
  final String countryCode;
  final String name;
  Country({
    required this.countryFlag,
    required this.countryCode,
    required this.name,
  });

  static List<Country> get countries => _countries;
  static final List<Country> _countries = [
    Country(
      countryFlag: us,
      countryCode: 'US',
      name: 'United States',
    ),
    Country(
      countryFlag: gb,
      countryCode: 'GB',
      name: 'United Kingdom',
    ),
    Country(
      countryFlag: sg,
      countryCode: 'SG',
      name: 'Singapore',
    ),
    Country(
      countryFlag: cn,
      countryCode: 'CN',
      name: 'China',
    ),
    Country(
      countryFlag: nl,
      countryCode: 'NL',
      name: 'Netherland',
    ),
    Country(
      countryFlag: id,
      countryCode: 'ID',
      name: 'Indonesia',
    ),
    Country(
      countryFlag: ng,
      countryCode: 'NG',
      name: 'Nigeria',
    ),
  ];
}
