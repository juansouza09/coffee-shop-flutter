import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          _buildTopBar(context), // Chama a nova função aqui
          const Expanded(
            child: CoffeeGrid(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        showSelectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }
}

Widget _buildTopBar(BuildContext context) {
  final double searchBarHeight = MediaQuery.of(context).size.height * .07;

  return Column(
    children: [
      Container(
        height: MediaQuery.of(context).size.height * .2,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            transform: GradientRotation(-35),
            colors: [Color(0xFF131313), Color(0xFF313131)],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .05,
              ),
              _buildLocationRow(context),
              SizedBox(height: searchBarHeight / 3),
            ],
          ),
        ),
      ),
      Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 32,
            color: Colors.white,
          ),
          Positioned(
            top: -searchBarHeight / 1.8,
            left: 16,
            right: 16,
            child: _buildSearchBar(searchBarHeight: searchBarHeight),
          ),
        ],
      ),
    ],
  );
}

Widget _buildSearchBar({required double searchBarHeight}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12),
    child: Container(
      height: searchBarHeight,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search coffee',
          hintStyle: GoogleFonts.sora(
              color: const Color(0xFF989898),
              fontSize: 16,
              fontWeight: FontWeight.w400),
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.black,
          ),
          suffixIcon: Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
                color: const Color(0xFFC67C4E),
                borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 10, bottom: 2, left: 8, right: 8),
              child: SvgPicture.asset(
                'assets/images/filter-icon.svg',
              ),
            ),
          ),
          border: InputBorder.none,
        ),
      ),
    ),
  );
}

Widget _buildLocationRow(BuildContext context) {
  return Row(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Location',
            style: GoogleFonts.sora(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: const Color(0xFFB7B7B7)),
          ),
          const SizedBox(width: 8),
          Row(
            children: [
              Text(
                'São Paulo, Brazil',
                style: GoogleFonts.sora(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFFDDDDDD)),
              ),
              const SizedBox(
                width: 4,
              ),
              const Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white,
              )
            ],
          ),
        ],
      ),
      const Spacer(),
      ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          'assets/images/profile-img.jpeg',
          width: 48,
          height: 48,
          fit: BoxFit.cover,
        ),
      )
    ],
  );
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
          childAspectRatio: MediaQuery.of(context).size.aspectRatio + 0.2),
      itemCount: 8,
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
