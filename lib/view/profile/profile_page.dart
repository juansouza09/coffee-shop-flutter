import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .05,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        children: [
                          const Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Back',
                            style: GoogleFonts.sora(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(16),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.4),
                            blurRadius: 16,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(32),
                        child: Image.asset(
                          'assets/images/profile-img.jpeg',
                          width: 148,
                          height: 148,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Juan Pablo',
                      style: GoogleFonts.sora(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      '@iamjuansouzaa',
                      style: GoogleFonts.sora(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 48,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      height: 44,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFFC67C4E),
                      ),
                      child: Text(
                        'Edit',
                        style: GoogleFonts.sora(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              const Divider(),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.settings_outlined,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          width: 28,
                        ),
                        Text(
                          'Setting',
                          style: GoogleFonts.sora(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 26,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.person_outline,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          width: 28,
                        ),
                        Text(
                          'Friend',
                          style: GoogleFonts.sora(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 26,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.people_outline,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          width: 28,
                        ),
                        Text(
                          'New Group',
                          style: GoogleFonts.sora(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 26,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.support_agent_outlined,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          width: 28,
                        ),
                        Text(
                          'Support',
                          style: GoogleFonts.sora(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 26,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.share_outlined,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          width: 28,
                        ),
                        Text(
                          'Share',
                          style: GoogleFonts.sora(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 26,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.help_outline_sharp,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          width: 28,
                        ),
                        Text(
                          'About us',
                          style: GoogleFonts.sora(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
