import 'package:fitnessapp/models/menuItem.dart';
import 'package:flutter/material.dart';


class Menuitems{
  static const home = Menuitem("Home", Icons.sports_gymnastics_outlined);
  static const pre = Menuitem("premium", Icons.workspace_premium_sharp);
  static const shop = Menuitem("Shops", Icons.shopify_rounded);
  static const food = Menuitem("Health & food", Icons.food_bank_outlined);
  static const media = Menuitem("media", Icons.mark_unread_chat_alt_outlined);
  static const chat = Menuitem("Chat Commuinty", Icons.mode_comment_rounded);
  static const aboutUs = Menuitem("About us", Icons.info);
  
 

 static const all = <Menuitem>[
  home ,
  pre ,
  shop ,
  food ,
  media,
  chat,
  aboutUs
 ];


}