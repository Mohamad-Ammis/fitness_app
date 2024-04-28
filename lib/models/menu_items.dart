import 'package:fitnessapp/models/menu_item.dart';
import 'package:flutter/material.dart';


class Menuitems{
  static const home = Menuitem("Gym_Home", Icons.sports_gymnastics_outlined);
  static const pre = Menuitem("Gym_premium", Icons.workspace_premium_sharp);
  static const shop = Menuitem("Shops", Icons.shopify_rounded);
  static const food = Menuitem("Health & food", Icons.food_bank_outlined);
  static const media = Menuitem("media", Icons.mark_unread_chat_alt_outlined);
 

 static const all = <Menuitem>[
  home ,
  pre ,
  shop ,
  food ,
  media
 ];


}