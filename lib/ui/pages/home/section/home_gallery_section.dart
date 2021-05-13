import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:wedding_brand/ui/components/block_wrapper.dart';
import 'package:wedding_brand/ui/constant/constant.dart';

class HomeGallerySection extends StatefulWidget {

  @override
  _HomeGallerySectionState createState() => _HomeGallerySectionState();
}

class _HomeGallerySectionState extends State<HomeGallerySection> {
  final List<String> featuredList = [
    getPath("images/gallery-3.jpg"),
    getPath("images/gallery-4.jpg"),
    getPath("images/gallery-2.jpg"),
    getPath("images/gallery-1.jpg"),
  ];

  late int selectedHover = 99;
  void setSelectedHover(int value) {
    setState(() {
      selectedHover = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: BlockWrapper(
        child: Stack(
          children: [
            ResponsiveRowColumn(
              rowColumn: !ResponsiveWrapper.of(context).isSmallerThan(DESKTOP),
              rowCrossAxisAlignment: CrossAxisAlignment.center,
              columnCrossAxisAlignment: CrossAxisAlignment.center,
              columnMainAxisSize: MainAxisSize.min,
              columnSpacing: 0,
              rowMainAxisAlignment: MainAxisAlignment.center,
              rowSpacing: 0,
              rowPadding: EdgeInsets.all(0),  
              children: [
                _galleryItem(0),
                _galleryItem(1),
                _galleryItem(2),
                _galleryItem(3),
              ],
            ),

            !ResponsiveWrapper.of(context).isMobile
              ? Positioned(
                  bottom: 40,
                  left: 150,
                  child: _noteGalleryWidget(),
                )
              : SizedBox()
          ],
        ),
      ),
    );
  }

  ResponsiveRowColumnItem _galleryItem(int index) {
    return ResponsiveRowColumnItem(
      rowFlex: 1,
      rowFit: FlexFit.loose,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (val) => setSelectedHover(index),
          onExit: (val) => setSelectedHover(99),
          child: Transform.scale(
            scale: selectedHover == index ? 1.05 : 1,
            child: Container(
              width: 250,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(2),
                image: DecorationImage(
                  image: AssetImage(
                    featuredList[index]
                  ),
                  fit: BoxFit.cover
                )
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _noteGalleryWidget() {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(2)
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 5, left: 3, right: 3, bottom: 2),
            child: Text(
              "W",
              textAlign: TextAlign.center,
              style: styleSubtitle.copyWith(
                color: Colors.white,
                fontSize: 10,
              ),
            ),
          ),
        ),
        Container(
          width: 40,
          color: Colors.black,
          height: 1,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(2)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            child: Row(
              children: [
                Text(
                  "INSTA FOLLOW ",
                  style: styleCaption.copyWith(
                    color: Colors.white,
                    fontSize: 10,
                    letterSpacing: 2
                  ),
                ),
                Text(
                  "@leeyurani",
                  style: styleCaption.copyWith(
                    color: Colors.white,
                    fontSize: 10,
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}