import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widgets/build_top_bar.dart';
import 'widgets/coffee_grid.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  List<CoffeeModel> coffes = [
    CoffeeModel(
        title: 'Cappuccino',
        subtitle: 'with Chocolate',
        avaliation: '4.8',
        price: '4.53'),
    CoffeeModel(
        title: 'Cappuccino',
        subtitle: 'with Oat Milk',
        avaliation: '4.9',
        price: '3.90'),
    CoffeeModel(
        title: 'Cappuccino',
        subtitle: 'with Chocolate',
        avaliation: '4.5',
        price: '4.80'),
    CoffeeModel(
        title: 'Cappuccino',
        subtitle: 'with Oat Milk',
        avaliation: '4.0',
        price: '3.53'),
    CoffeeModel(
        title: 'Cappuccino',
        subtitle: 'with Chocolate',
        avaliation: '4.8',
        price: '5.40'),
    CoffeeModel(
        title: 'Cappuccino',
        subtitle: 'with Oat Milk',
        avaliation: '4.6',
        price: '4.60'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          buildTopBar(context),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16),
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              dividerHeight: 0,
              tabAlignment: TabAlignment.start,
              labelColor: Colors.white,
              unselectedLabelColor: const Color(0xFF2F4B4E),
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                color: const Color(0xFFC67C4E),
                borderRadius: BorderRadius.circular(12),
              ),
              tabs: [
                _customTab('Cappuccino', 0),
                _customTab('Macchiato', 1),
                _customTab('Latte', 2),
                _customTab('Americano', 3),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                CoffeeGrid(
                  coffees: coffes,
                ),
                CoffeeGrid(
                  coffees: coffes,
                ),
                CoffeeGrid(
                  coffees: coffes,
                ),
                CoffeeGrid(
                  coffees: coffes,
                ),
              ],
            ),
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

  Widget _customTab(String text, int index) {
    return Tab(
      child: AnimatedBuilder(
        animation: _tabController,
        builder: (context, child) {
          bool isSelected = _tabController.index == index;
          return Text(
            text,
            style: GoogleFonts.sora(
              fontSize: 14,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
