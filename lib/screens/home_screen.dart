import 'package:flutter/material.dart';
import 'package:mooday/assets/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: size.height * .27, //%27 boyut
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                scale: 0.1,
                alignment: Alignment.topRight,
                image: AssetImage('assets/images/homebg.png'),
              ),
            ),
            child: Center(
              child: Text(
                ktitleText,
                style: ktitleStyle,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(top: 120.0, left: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome Jerry,',
                    style: ksubtitleStyle2.copyWith(fontSize: 22.0),
                  ),
                  Text(
                    'How are you feeling today?',
                    style: ksubtitleStyle.copyWith(fontSize: 30.0),
                  ),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0XFFF2F1F6),
                            borderRadius: BorderRadius.circular(13.0),
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                child: Image.asset(
                                  'assets/images/peep-73.png',
                                ),
                              ),
                              Text(
                                'Happy!',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
