import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF38241D),
      body: Column(
        children: [
          Flexible(
            flex: 2,
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/images/coffee-image.jpg',
                      ),
                      fit: BoxFit.fill)),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Flexible(
            flex: 1,
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Time for a coffee break....',
                        style: GoogleFonts.sora(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                        'Your daily dose of fresh brew delivered to your doorstep. Start your coffee journey now!',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w300)),
                  ],
                ),
                const SizedBox(
                  height: 64,
                ),
                InkWell(
                  child: Container(
                    width: MediaQuery.of(context).size.width * .8,
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
        ],
      ),
    );
  }
}
