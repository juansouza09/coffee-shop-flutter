import 'package:flutter/material.dart';

import 'coffee_card.dart';

class CoffeeModel {
  int id;
  String title;
  String subtitle;
  String avaliation;
  String avaliationSize;
  String price;
  String description;

  CoffeeModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.avaliation,
    required this.avaliationSize,
    required this.price,
    required this.description,
  });
}

class CoffeeGrid extends StatelessWidget {
  const CoffeeGrid({super.key, required this.coffees});
  final List<CoffeeModel> coffees;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: MediaQuery.of(context).size.aspectRatio + 0.2),
      itemCount: coffees.length,
      itemBuilder: (context, index) {
        return CoffeeCard(
          coffee: coffees[index],
        );
      },
    );
  }
}
