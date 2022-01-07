import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mooday/models/finance/finance_data.dart';
import 'package:mooday/screens/finance/finance_screen.dart';

class LoadFinanceScreen extends StatefulWidget {
  const LoadFinanceScreen({Key? key}) : super(key: key);

  @override
  _LoadFinanceScreenState createState() => _LoadFinanceScreenState();
}

class _LoadFinanceScreenState extends State<LoadFinanceScreen> {
  @override
  void initState() {
    super.initState();
    loadCurrencyList();
  }

  void loadCurrencyList() async {
    var loadedCurrencyList = await FinanceData().getCurrencyList();

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => FinanceScreen(
          currencyList: loadedCurrencyList,
        ),
      ),
      ModalRoute.withName('/home'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SpinKitPouringHourGlass(
        color: Colors.black,
        size: 100.0,
      ),
    );
  }
}
