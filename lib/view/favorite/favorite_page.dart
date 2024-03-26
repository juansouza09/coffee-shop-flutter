import 'package:coffee_shop_flutter/view/favorite/widgets/favorite_coffee_grid.dart';
import 'package:coffee_shop_flutter/view/home/widgets/coffee_grid.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<CoffeeModel> coffees = [
      CoffeeModel(
          id: 1,
          title: 'Cappuccino',
          subtitle: 'with Chocolate',
          avaliation: '4.8',
          avaliationSize: '2.330',
          price: '4.53',
          description:
              'A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the fo.. Read More',
          imageUrl:
              'https://loucodocafe.com.br/wp-content/uploads/2020/08/cappuccino-1.jpg'),
      CoffeeModel(
          id: 2,
          title: 'Cappuccino',
          subtitle: 'with Oat Milk',
          avaliation: '4.9',
          avaliationSize: '1.290',
          price: '3.90',
          description:
              'A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the fo.. Read More',
          imageUrl:
              'https://perfectdailygrind.com/pt/wp-content/uploads/sites/5/2021/02/Cappuccino-1-1-e1614286541519.jpg'),
      CoffeeModel(
          id: 3,
          title: 'Cappuccino',
          subtitle: 'with Chocolate',
          avaliation: '4.5',
          avaliationSize: '451',
          price: '4.80',
          description:
              'A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the fo.. Read More',
          imageUrl:
              'https://coffeelounge.com.br/wp-content/uploads/2020/06/cappuccino-chocolate-square.jpg'),
    ];

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Image.asset(
              'assets/images/favorite-coffee-image.png',
              width: 120,
              height: 100,
            ),
            Text('Coffee Store JS',
                style: GoogleFonts.sora(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF2F2D2C))),
            const Divider(),
            Expanded(child: FavoriteCoffeeGrid(coffees: coffees))
          ],
        ),
      ),
    );
  }
}
