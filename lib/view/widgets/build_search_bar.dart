import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildSearchBar({required double searchBarHeight}) {
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
