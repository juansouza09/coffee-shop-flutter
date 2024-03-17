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
        id: 1,
        title: 'Cappuccino',
        subtitle: 'with Chocolate',
        avaliation: '4.8',
        avaliationSize: '2.330',
        price: '4.53',
        description:
            'A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the fo.. Read More',
        imageUrl:
            'https://loucodocafe.com.br/wp-content/uploads/2020/08/cappuccino-1.jpg'),
    CoffeeModel(
        id: 2,
        title: 'Cappuccino',
        subtitle: 'with Oat Milk',
        avaliation: '4.9',
        avaliationSize: '1.290',
        price: '3.90',
        description:
            'A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the fo.. Read More',
        imageUrl:
            'https://perfectdailygrind.com/pt/wp-content/uploads/sites/5/2021/02/Cappuccino-1-1-e1614286541519.jpg'),
    CoffeeModel(
        id: 3,
        title: 'Cappuccino',
        subtitle: 'with Chocolate',
        avaliation: '4.5',
        avaliationSize: '451',
        price: '4.80',
        description:
            'A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the fo.. Read More',
        imageUrl:
            'https://coffeelounge.com.br/wp-content/uploads/2020/06/cappuccino-chocolate-square.jpg'),
    CoffeeModel(
        id: 4,
        title: 'Cappuccino',
        subtitle: 'with Oat Milk',
        avaliation: '4.0',
        avaliationSize: '755',
        price: '3.53',
        description:
            'A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the fo.. Read More',
        imageUrl:
            'https://static.itdg.com.br/images/auto-auto/40ea2d90b068df7dfb5e98a66ab502cc/cappuccino.jpg'),
    CoffeeModel(
        id: 5,
        title: 'Cappuccino',
        subtitle: 'with Chocolate',
        avaliation: '4.8',
        avaliationSize: '2.500',
        price: '5.40',
        description:
            'A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the fo.. Read More',
        imageUrl:
            'https://coffeeaffection.com/wp-content/uploads/2021/02/does-a-cappuccino-have-caffeine.jpg'),
    CoffeeModel(
        id: 6,
        title: 'Cappuccino',
        subtitle: 'with Oat Milk',
        avaliation: '4.6',
        avaliationSize: '2.330',
        price: '4.60',
        description:
            'A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the fo.. Read More',
        imageUrl:
            'https://uniquecafes.com.br/wp-content/uploads/2022/04/Destaque-Cappuccino.webp'),
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
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
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
