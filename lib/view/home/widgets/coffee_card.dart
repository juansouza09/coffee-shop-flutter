import 'package:coffee_shop_flutter/view/details/coffee_details_page.dart';
import 'package:coffee_shop_flutter/view/home/widgets/coffee_grid.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoffeeCard extends StatelessWidget {
  const CoffeeCard({
    super.key,
    required this.coffee,
  });

  final CoffeeModel coffee;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CoffeeDetailsPage(
                      coffee: coffee,
                    )));
      },
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Stack(
              alignment: Alignment.topLeft,
              children: [
                Hero(
                  tag: coffee.id,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      coffee.imageUrl,
                      height: 138,
                      width: MediaQuery.of(context).size.width * .4,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 4, bottom: 4, right: 16, left: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/images/star.png',
                          width: 12,
                          height: 12,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          coffee.avaliation,
                          style: GoogleFonts.sora(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(coffee.title,
                      style: GoogleFonts.sora(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF2F2D2C))),
                  Text(coffee.subtitle,
                      style: GoogleFonts.sora(
                          fontSize: 14, color: const Color(0xFF9B9B9B))),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('\$ ${coffee.price}',
                          style: GoogleFonts.sora(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF2F4B4E))),
                      const PlusButton(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlusButton extends StatelessWidget {
  const PlusButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: const Color(0xFFC67C4E),
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(
        icon: const Icon(Icons.add, color: Colors.white),
        onPressed: () {
          // Handle the button press
        },
      ),
    );
  }
}
