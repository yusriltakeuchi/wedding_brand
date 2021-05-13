import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:wedding_brand/ui/constant/constant.dart';

class HomeHeaderSection extends StatefulWidget {

  @override
  _HomeHeaderSectionState createState() => _HomeHeaderSectionState();
}

class _HomeHeaderSectionState extends State<HomeHeaderSection> {
  List<String> menuList = [
    "HOME",
    "ABOUT",
    "BLOG",
    "CONTACT"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Color(0xffECEBE8),
      height: MediaQuery.of(context).size.height * (ResponsiveWrapper.of(context).isMobile ? 0.7 : 0.5),
      child: ResponsiveRowColumn(
        rowColumn: !ResponsiveWrapper.of(context).isSmallerThan(DESKTOP),
        rowCrossAxisAlignment: CrossAxisAlignment.start,
        columnCrossAxisAlignment: CrossAxisAlignment.center,
        columnMainAxisSize: MainAxisSize.min,
        columnSpacing: 0,
        rowSpacing: 0,
        children: [

          ResponsiveRowColumnItem(
            rowFlex: 3,
            rowFit: FlexFit.loose,
            child: Container(
              width: double.infinity,
              child: _fieldHeaderImage(),
            ),
          ),
          ResponsiveRowColumnItem(
            rowFlex: 1,
            rowFit: FlexFit.loose,
            child: Container(
              width: double.infinity,
              child: _fieldWelcome()
            ),
          ),
        ],
      ),
    );
  }

  Widget _fieldHeaderImage() {
    return Container(
      height: ResponsiveWrapper.of(context).isMobile ? 200 : null,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            getPath("images/background_header.png")
          ),
          fit: BoxFit.cover
        )
      ),
    );
  }

  Widget _fieldWelcome() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "WEDDING",
              style: styleTitle.copyWith(
                fontSize: 30,
                letterSpacing: 6,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 10),
            Text(
              "When a word of love is spoken, that's where your world will merge into one and can't be separated",
              textAlign: TextAlign.center,
              style: styleCaption.copyWith(
                fontSize: 15
              ),
            ),
            SizedBox(height: 40),
            _menuList(),
            SizedBox(height: 40),
            _footerHeader()
          ],
        ),
      ),
    );
  }

  Widget _menuList() => Column(
    children: List.generate(menuList.length, (index) => MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text(
            menuList[index],
            style: styleSubtitle.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    )).toList(),
  );

  Widget _footerHeader() {
    return Text(
      "Made with ♥ by Yusril Rapsanjani",
      style: styleCaption,
    );
  }
}