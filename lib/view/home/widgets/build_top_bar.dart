import 'package:flutter/material.dart';

import 'build_location_row.dart';
import 'build_search_bar.dart';

Widget buildTopBar(BuildContext context) {
  final double searchBarHeight = MediaQuery.of(context).size.height * .07;

  return Column(
    children: [
      Container(
        height: MediaQuery.of(context).size.height * .2,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            transform: const GradientRotation(-35),
            colors: [
              const Color(0xFF131313),
              const Color(0xFF313131).withOpacity(0.83)
            ],
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
              buildLocationRow(context),
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
            child: buildSearchBar(searchBarHeight: searchBarHeight),
          ),
        ],
      ),
    ],
  );
}
