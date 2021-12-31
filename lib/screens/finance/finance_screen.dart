import 'package:flutter/material.dart';
import 'package:mooday/models/finance/finance_data.dart';
import 'package:mooday/assets/constants.dart';
import 'package:mooday/widgets/floating_button.dart';

class FinanceScreen extends StatefulWidget {
  FinanceScreen({this.currencyList});
  final currencyList;

  @override
  _FinanceScreenState createState() => _FinanceScreenState();
}

class _FinanceScreenState extends State<FinanceScreen> {
  FinanceData financeData = FinanceData();
  late Future<double> currencyResponse;

  @override
  void initState() {
    super.initState();
    widget.currencyList;
  }

  String fromCurr = 'USD';
  String toCurr = 'TRY';
  double value = 1;
  var exchangedValue;
  double result = 0;
  var dropdownItems;

  @override
  Widget build(BuildContext context) {
    dropdownItems = financeData.getDropdownItems();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFE8E9F3),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: const Offset(0, 5), // changes position of shadow
                  ),
                ],
              ),
              height: 150,
              width: 300,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('From Currency:', style: STYLE_SUBTITLE_2),
                        DropdownButton<String>(
                          value: fromCurr,
                          items: dropdownItems,
                          onChanged: (value) {
                            setState(() {
                              fromCurr = value!;
                            });
                          },
                        ),
                      ],
                    ),
                    TextField(
                      decoration: DECORATION_TEXT_FILE_3,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      onSubmitted: (input) async {
                        setState(() {
                          value = double.parse(input);
                        });
                        exchangedValue = await financeData.convertCurrencies(
                            fromCurr, toCurr, value);
                        setState(() {
                          result = exchangedValue;
                        });
                        print(exchangedValue);
                      },
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 50),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFE8E9F3),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: const Offset(0, 5), // changes position of shadow
                  ),
                ],
              ),
              height: 150,
              width: 300,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('To Currency:', style: STYLE_SUBTITLE_2),
                        DropdownButton<String>(
                          value: toCurr,
                          items: dropdownItems,
                          onChanged: (value) {
                            setState(() {
                              toCurr = value!;
                            });
                          },
                        ),
                      ],
                    ),
                    TextField(
                      readOnly: true,
                      decoration: DECORATION_TEXT_FILE_3.copyWith(
                          hintText: result.toString()),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton:
          FloatingButton(scale: 1.2, title: 'Back', onPressed: () {}),
    );
  }
}
