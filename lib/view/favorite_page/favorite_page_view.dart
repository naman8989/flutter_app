import 'package:flutter/material.dart';
import 'package:food_order_ui/configuration/food.dart';
import 'widgets/foodData.dart';
import 'package:food_order_ui/configuration/food_list.dart';
import 'package:food_order_ui/view/cart_page/widgets/food_list_widget/food_text.dart';
import 'package:food_order_ui/view/favorite_page/widgets/favorite_cart_icon.dart';
import 'package:food_order_ui/view/favorite_page/widgets/favorite_icon.dart';
import 'package:food_order_ui/view/favorite_page/widgets/favorite_image.dart';
import 'package:food_order_ui/view/home_page/components/size_config.dart';

class FavoritePageView extends StatefulWidget {
  const FavoritePageView({Key? key}) : super(key: key);

  @override
  _FavoritePageViewState createState() => _FavoritePageViewState();
}

class _FavoritePageViewState extends State<FavoritePageView>
    with TickerProviderStateMixin {
  late TabController _tabController;
  // late final List<FoodType> _foodTypes = FoodType.values;
  late int currentFoodTypeIndex;
  //initialized as pizzas
  // late List<Food> currentFoods;
  List<Tab> foodCatTabs = <Tab>[];
  bool addTab(String a, String imageName) {
    print("$a , $imageName");
    try {
      foodCatTabs.add(
        Tab(
          text: '$a',
          icon: Image.asset(
            "assets/menu/menuImage/${imageName}",
            height: 30,
            width: 30,
          ),
        ),
      );
      return true;
    } catch (e) {
      print('Error while adding tab : ${e}');
      return false;
    }
  }

  @override
  void initState() {
    super.initState();

    bool res = false;
    for (int i = 0; i < foodCat.length; i++) {
      res = addTab(foodCat[i][0], foodCat[i][1]);
    }
    currentFoodTypeIndex = 0;
    _tabController = TabController(
      initialIndex: currentFoodTypeIndex,
      vsync: this,
      length: foodCatTabs.length,
    );
    // _tabController = TabController(length: _foodTypes.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Menu",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Color(0xffffffff),
        iconTheme: IconThemeData(color: Colors.black),
        bottom: TabBar(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white,
          controller: _tabController,
          tabs: foodCatTabs,
          onTap: (index) {
            setState(() {
              index = _tabController.index;
            });
          },
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: foodCatTabs.map((Tab tab) {
          final String label = tab.text!.toLowerCase();
          return fetchFoodDetails(_tabController.index, label);
        }).toList(),
      ),
    );
  }
}

Widget fetchFoodDetails(int ind, String whichTab) {
  int numListGen = foodDetails[ind].length;
  return Center(
    child: GridView.count(
      crossAxisCount: 2,
      padding: const EdgeInsets.all(10.0),
      crossAxisSpacing: 5.0,
      mainAxisSpacing: 5.0,
      children: List.generate(numListGen, (index) {
        return Center(
          child: Container(
            height: 200,
            child: Align(
              alignment: Alignment(0.0, 2.5),
              child: FractionallySizedBox(
                heightFactor: 0.5,
                child: Text('Child Widget'),
              ),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/menu/menuImage/burger.png"),
              ),
              borderRadius: BorderRadius.circular(50),
              color: Color(0xfff6f6f6),
              boxShadow: [
                BoxShadow(
                  color: Color(0xffc6c6c6),
                  blurRadius: 5.0,
                ),
              ],
            ),
          ),
        );
      }),
    ),
  );
}
