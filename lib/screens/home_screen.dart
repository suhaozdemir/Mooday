import 'package:flutter/material.dart';
import 'package:mooday/assets/constants.dart';
import 'package:mooday/widgets/category_card.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

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
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.grey,
          items: <Widget>[
            Icon(Icons.add, size: 30),
            Icon(Icons.list, size: 30),
            Icon(Icons.compare_arrows, size: 30),
          ],
          onTap: (index) {
            //Handle button tap
          }),
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
                ktitleText,
                style: ktitleStyle,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 120.0, left: 20.0, right: 20.0, bottom: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Welcome Jerry,',
                    style: ksubtitleStyle2.copyWith(fontSize: 22.0),
                  ),
                  Text(
                    'How are you feeling today?',
                    style: ksubtitleStyle.copyWith(fontSize: 25.0),
                  ),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: .95,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 12,
                      children: [
                        CategoryCard(
                          assetImg: 'assets/images/mood.png',
                          categoryText: 'Mood',
                        ),
                        CategoryCard(
                            assetImg: 'assets/images/todo.png',
                            categoryText: 'To-Do'),
                        CategoryCard(
                          assetImg: 'assets/images/timer.png',
                          categoryText: 'Timer',
                        ),
                        CategoryCard(
                          assetImg: 'assets/images/finance.png',
                          categoryText: 'Finance',
                        ),
                      ],
                    ),
                  ),
                  CategoryCard(
                      assetImg: 'assets/images/weather.png',
                      categoryText: 'Weather')
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
