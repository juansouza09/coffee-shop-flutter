import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildLocationRow(BuildContext context) {
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