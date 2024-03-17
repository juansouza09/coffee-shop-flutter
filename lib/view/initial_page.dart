import 'package:carousel_slider/carousel_slider.dart';
import 'package:coffee_shop_flutter/view/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = [
      createSlide(
          'assets/images/coffee-image.jpg',
          'Time for a coffee break....',
          'Your daily dose of fresh brew delivered to your doorstep. Start your coffee journey now!'),
      createSlide(
          'assets/images/coffee-image.jpg',
          'Time for a coffee break....',
          'Your daily dose of fresh brew delivered to your doorstep. Start your coffee journey now!'),
      createSlide(
          'assets/images/coffee-image.jpg',
          'Time for a coffee break....',
          'Your daily dose of fresh brew delivered to your doorstep. Start your coffee journey now!'),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF38241D),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(
              height: 20,
            ),
            CarouselSlider(
              items: imageSliders,
              options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * .8,
                  autoPlay: true,
                  aspectRatio: MediaQuery.of(context).size.aspectRatio,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }),
              carouselController: _controller,
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imageSliders.asMap().entries.map((entry) {
                if (_current == entry.key) {
                  return Container(
                    width: 24.0,
                    height: 8.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  );
                } else {
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 4.0),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                  );
                }
              }).toList(),
            ),
            const SizedBox(
              height: 32,
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    PageTransition(
                        child: const HomePage(),
                        duration: const Duration(milliseconds: 300),
                        type: PageTransitionType.rightToLeft));
              },
              child: Container(
                width: MediaQuery.of(context).size.width * .8,
                height: MediaQuery.of(context).size.height * .06,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: const Color(0xFFE27D19),
                    borderRadius: BorderRadius.circular(24)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Get Started',
                      style: GoogleFonts.sora(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget createSlide(String imagePath, String title, String subtitle) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Image.asset(
            imagePath,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(title,
              style: GoogleFonts.sora(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 16,
          ),
          Text(subtitle,
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w300)),
        ],
      ),
    );
  }
}
