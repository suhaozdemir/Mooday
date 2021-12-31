import 'package:mooday/services/network.dart';
import 'package:mooday/assets/constants.dart';

late List<dynamic> currenciesList;

class FinanceData {
  Future<List> getCurrencyList() async {
    NetworkService networkService = NetworkService(
        '$FINANCE_API_URL/api/v7/currencies?apiKey=$FINANCE_API_KEY');

    var financeData = await networkService.getData();
    Map curMap = financeData['results'];
    currenciesList = curMap.keys.toList();
    return currenciesList;
  }

  Future<double> convertCurrencies(
      String fromCurr, String toCurr, double value) async {
    NetworkService networkService = NetworkService(
        '$FINANCE_API_URL/api/v7/convert?q=${fromCurr}_$toCurr&compact=ultra&apiKey=$FINANCE_API_KEY');

    var financeData = await networkService.getData();
    final rate = financeData['${fromCurr}_$toCurr'].toDouble();
    return rate * value;
  }
}
