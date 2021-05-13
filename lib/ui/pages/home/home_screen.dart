import 'package:flutter/material.dart';
import 'package:wedding_brand/ui/pages/home/section/home_about_section.dart';
import 'package:wedding_brand/ui/pages/home/section/home_footer_section.dart';
import 'package:wedding_brand/ui/pages/home/section/home_gallery_section.dart';
import 'package:wedding_brand/ui/pages/home/section/home_header_section.dart';
import 'package:wedding_brand/ui/pages/home/section/home_recent_section.dart';
import 'package:wedding_brand/ui/pages/home/section/home_welcome_section.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        
        cacheExtent: 2000,
        itemCount: itemList.length,
        itemBuilder: (context, index) {
          return itemList[index];
        }
      ),
    );
  }

  final List<Widget> itemList = [
    HomeHeaderSection(),
    HomeWelcomeSection(),
    HomeAboutSection(),
    HomeGallerySection(),
    HomeRecentSection(),
    HomeFooterSection(),
  ];
}