import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xFF131313), Color(0xFF313131)])),
            child: Center(
              child: Row(
                children: [
                  const Column(
                    children: [Text('Location'), Text('São Paulo, Brazil')],
                  ),
                  Image.asset('person')
                ],
              ),
            ),
          ),
          Container(color: Colors.white, child: const CoffeeGrid()),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class CoffeeGrid extends StatelessWidget {
  const CoffeeGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 90,
          childAspectRatio: MediaQuery.of(context).size.aspectRatio),
      itemCount: 2,
      itemBuilder: (context, index) {
        return const CoffeeCard(
          title: 'Cappucino',
          subtitle: 'with Chocolate',
          avaliation: '4.8',
          price: '5.85',
          url:
              'https://upload.wikimedia.org/wikipedia/commons/c/c8/Cappuccino_at_Sightglass_Coffee.jpg',
        );
      },
    );
  }
}

class CoffeeCard extends StatelessWidget {
  const CoffeeCard(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.avaliation,
      required this.url,
      required this.price});

  final String title;
  final String subtitle;
  final String avaliation;
  final String url;
  final String price;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Stack(
            alignment: Alignment.topLeft,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  url,
                  height: 138,
                  width: MediaQuery.of(context).size.width * .4,
                  fit: BoxFit.cover,
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
                        avaliation,
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
                Text(title,
                    style: GoogleFonts.sora(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF2F2D2C))),
                Text(subtitle,
                    style: GoogleFonts.sora(
                        fontSize: 14, color: const Color(0xFF9B9B9B))),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('\$ $price',
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
