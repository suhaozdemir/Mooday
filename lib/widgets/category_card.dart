import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  CategoryCard(
      {required this.assetImg,
      required this.categoryText,
      required this.onTap});

  final String assetImg;
  final String categoryText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(13.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.grey, blurRadius: 4, offset: Offset(0, 5))
          ], // Shadow position
          gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0XFFF2F1F6), Color(0xffeef2f3)]),
          borderRadius: BorderRadius.circular(13.0),
        ),
        child: Material(
          color: Colors.white,
          elevation: 100.0,
          child: InkWell(
            onTap: onTap,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  assetImg,
                ),
                Text(
                  categoryText,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
