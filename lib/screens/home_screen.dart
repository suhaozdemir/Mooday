import 'package:flutter/material.dart';
import 'package:mooday/assets/constants.dart';
import 'package:mooday/widgets/category_card.dart';

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
            decoration: const BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                scale: 0.1,
                alignment: Alignment.topRight,
                image: AssetImage('assets/images/homebg.png'),
              ),
            ),
            child: const Center(
              child: Text(
                TEXT_TITLE,
                style: STYLE_TITLE,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(
                  top: size.height * 0.15,
                  left: 20.0,
                  right: 20.0,
                  bottom: 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Welcome,',
                    style: STYLE_SUBTITLE_2.copyWith(fontSize: 22.0),
                  ),
                  Text(
                    'What do you want to do?',
                    style: STYLE_SUBTITLE.copyWith(fontSize: 25.0),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 1,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 12,
                      children: [
                        CategoryCard(
                            assetImg: 'assets/images/mood.png',
                            categoryText: 'Mood',
                            onTap: () {
                              Navigator.pushNamed(context, ROUTE_MOOD);
                            }),
                        CategoryCard(
                            assetImg: 'assets/images/todo.png',
                            categoryText: 'To-Do',
                            onTap: () {
                              Navigator.pushNamed(context, ROUTE_TODO);
                            }),
                        CategoryCard(
                            assetImg: 'assets/images/timer.png',
                            categoryText: 'Timer',
                            onTap: () {
                              Navigator.pushNamed(context, ROUTE_TIMER);
                            }),
                        CategoryCard(
                            assetImg: 'assets/images/finance.png',
                            categoryText: 'Finance',
                            onTap: () {
                              Navigator.pushNamed(context, ROUTE_HOME);
                            }),
                        CategoryCard(
                            assetImg: 'assets/images/weather.png',
                            categoryText: 'Weather',
                            onTap: () {
                              Navigator.pushNamed(context, ROUTE_LOAD_WEATHER);
                            }),
                        CategoryCard(
                            assetImg: 'assets/images/finance.png',
                            categoryText: 'Finance',
                            onTap: () {
                              Navigator.pushNamed(context, ROUTE_HOME);
                            }),
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
