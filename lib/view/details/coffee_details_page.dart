import 'package:coffee_shop_flutter/view/home/widgets/coffee_grid.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoffeeDetailsPage extends StatefulWidget {
  final CoffeeModel coffee;

  const CoffeeDetailsPage({super.key, required this.coffee});

  @override
  State<CoffeeDetailsPage> createState() => _CoffeeDetailsPageState();
}

class _CoffeeDetailsPageState extends State<CoffeeDetailsPage> {
  bool isFavorited = false;
  String selectedSize = 'M';
  final List<String> sizes = ['S', 'M', 'L'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          Hero(
              tag: widget.coffee.id,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                      child: Image.network(
                        widget.coffee.imageUrl,
                        fit: BoxFit.cover,
                        height: MediaQuery.of(context).size.height * .5,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * .1,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withOpacity(0.6),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).padding.top,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_back_ios,
                                color: Colors.white),
                            onPressed: () => Navigator.pop(context),
                          ),
                          IconButton(
                            icon: isFavorited
                                ? const Icon(
                                    Icons.favorite,
                                    color: Colors.pink,
                                  )
                                : const Icon(
                                    Icons.favorite_outline,
                                    color: Colors.white,
                                  ),
                            onPressed: () {
                              setState(() {
                                isFavorited = !isFavorited;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.coffee.title,
                            style: GoogleFonts.sora(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                          Text(
                            widget.coffee.subtitle,
                            style: GoogleFonts.sora(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star,
                            color: Color(0xFFE27D19), size: 24),
                        const SizedBox(width: 4),
                        Text(
                          widget.coffee.avaliation,
                          style: GoogleFonts.sora(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          widget.coffee.avaliationSize,
                          style: GoogleFonts.sora(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF808080)),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  'Description',
                  style: GoogleFonts.sora(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                Text(
                  widget.coffee.description,
                  style: GoogleFonts.sora(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                const SizedBox(height: 16),
                Text(
                  'Size',
                  style: GoogleFonts.sora(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                ToggleButtons(
                  borderColor: Colors.transparent,
                  fillColor: const Color(0xFFE27D19),
                  borderWidth: 2,
                  selectedBorderColor: Colors.transparent,
                  selectedColor: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  onPressed: (int index) {
                    setState(() {
                      selectedSize = sizes[index];
                    });
                  },
                  isSelected:
                      sizes.map((size) => size == selectedSize).toList(),
                  children: sizes
                      .map((size) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              size,
                              style: GoogleFonts.sora(),
                            ),
                          ))
                      .toList(),
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Price',
                          style: GoogleFonts.sora(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: const Color(0xFF9B9B9B),
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          '\$ ${widget.coffee.price}',
                          style: GoogleFonts.sora(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFFE27D19),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * .55,
                      height: MediaQuery.of(context).size.height * .07,
                      decoration: const BoxDecoration(
                          color: Color(0xFFE27D19),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: Text(
                        'Buy Now',
                        style: GoogleFonts.sora(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
