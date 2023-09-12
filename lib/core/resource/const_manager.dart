import 'package:flutter/material.dart';
import 'package:jessy_mall/featuers/Favorite/presentation/pages/favorite.dart';
import 'package:jessy_mall/featuers/cart/presentation/pages/my_cart.dart';
import 'package:jessy_mall/featuers/home/presintation/page/home_page.dart';
import 'package:jessy_mall/featuers/profile/presentation/page/profile_page.dart';

class ConstManager {
  static String baseUrl = 'https://mall.yaakoot.com.au/api';
  static String baseUrlImage = 'https://mall.yaakoot.com.au';
  static String clothesCategory = 'Clothes';
  static String marketCategory = 'Market';

  static String makeupCategory = 'MakeUp';
  static String furnitureCategory = 'Furniture';

  static String deliveryManagerRole = 'delivery_manager';
  static String warehouseManagerRole = 'warehouse_manager';
  static String customerRole = 'customer';
  static String investorRole = 'investor';

  static final List<Widget> pageOptions = [
    const HomePage(),
    const MyCartPage(),
    const FavoritePage(),
    const ProfilePage()
  ];
}
