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

final TextEditingController _inputValue = TextEditingController();

class _FinanceScreenState extends State<FinanceScreen> {
  FinanceData financeData = FinanceData();
  late Future<double> currencyResponse;

  @override
  void initState() {
    super.initState();
    widget.currencyList;
  }

  String fromCurr = 'USD';

  DropdownButton getDropdownButton() {
    List<DropdownMenuItem<String>> dropdownItems = [];

    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownItems.add(newItem);
    }

    return DropdownButton<String>(
      value: fromCurr,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          fromCurr = value!;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFE8E9F3),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: Offset(0, 5), // changes position of shadow
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
                        getDropdownButton(),
                      ],
                    ),
                    TextField(
                      controller: _inputValue,
                      decoration: DECORATION_TEXT_FILE_3,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 50),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFE8E9F3),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: Offset(0, 5), // changes position of shadow
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
                        Text('To Currency:', style: STYLE_SUBTITLE_2),
                        getDropdownButton(),
                      ],
                    ),
                    TextField(
                      readOnly: true,
                      decoration: DECORATION_TEXT_FILE_3.copyWith(hintText: ''),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingButton(
          scale: 1.2,
          title: 'Back',
          onPressed: () {
            Navigator.pop(context);
          }),
    );
  }
}
