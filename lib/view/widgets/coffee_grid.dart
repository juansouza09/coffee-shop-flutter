import 'package:flutter/material.dart';

import 'coffee_card.dart';

class CoffeeGrid extends StatelessWidget {
  const CoffeeGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          childAspectRatio: MediaQuery.of(context).size.aspectRatio + 0.2),
      itemCount: 8,
      itemBuilder: (context, index) {
        return const CoffeeCard(
          title: 'Cappucino',
          subtitle: 'with Chocolate',
          avaliation: '4.8',
          price: '5.85'
        );
      },
    );
  }
}
