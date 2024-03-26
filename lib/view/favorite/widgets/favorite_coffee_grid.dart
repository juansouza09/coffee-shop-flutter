import 'package:coffee_shop_flutter/view/favorite/widgets/favorite_coffee_card.dart';
import 'package:flutter/material.dart';

import '../../home/widgets/coffee_grid.dart';

class FavoriteCoffeeGrid extends StatelessWidget {
  const FavoriteCoffeeGrid({super.key, required this.coffees});
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
        return FavoriteCoffeeCard(
          coffee: coffees[index],
        );
      },
    );
  }
}
