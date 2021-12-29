import 'package:mooday/services/network.dart';
import 'package:mooday/assets/constants.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'TRY',
  'USD',
  'ZAR'
];

class FinanceData {
  Future<double> convertCurrencies(
      String fromCurr, String toCurr, double value) async {
    NetworkService networkService = NetworkService(
        '$FINANCE_API_URL/api/v7/convert?q=${fromCurr}_${toCurr}=&compact=ultra&apiKey=$FINANCE_API_KEY');

    var financeData = await networkService.getData();
    final rate = financeData['${fromCurr}_${toCurr}'].toDouble();
    return rate * value;
  }
}
