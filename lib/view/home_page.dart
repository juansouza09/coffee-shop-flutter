import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('West, Balurghat'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Cappuccino'),
              Tab(text: 'Macchiato'),
              Tab(text: 'Latte'),
              Tab(text: 'Americano'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            CoffeeGrid(),
            CoffeeGrid(),
            CoffeeGrid(),
            CoffeeGrid(),
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
        return const CoffeeCard();
      },
    );
  }
}

class CoffeeCard extends StatelessWidget {
  const CoffeeCard({super.key});

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
                  'https://upload.wikimedia.org/wikipedia/commons/c/c8/Cappuccino_at_Sightglass_Coffee.jpg',
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
                      const Text(
                        '4.8',
                        style: TextStyle(color: Colors.white, fontSize: 14),
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
                const Text('Cappuccino',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text('with Chocolate',
                    style: TextStyle(fontSize: 16, color: Colors.grey[600])),
                const SizedBox(height: 10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('\$4.53',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    PlusButton(),
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
