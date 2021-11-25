import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  CategoryCard({required this.assetImg, required this.categoryText});

  final String assetImg;
  final String categoryText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0XFFF2F1F6),
        borderRadius: BorderRadius.circular(13.0),
      ),
      child: Column(
        children: [
          Expanded(
            child: Image.asset(
              assetImg,
            ),
          ),
          Text(
            categoryText,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
        ],
      ),
    );
  }
}
