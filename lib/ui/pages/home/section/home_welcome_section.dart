import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:wedding_brand/ui/components/block_wrapper.dart';
import 'package:wedding_brand/ui/constant/constant.dart';

class HomeWelcomeSection extends StatefulWidget {
  @override
  _HomeWelcomeSectionState createState() => _HomeWelcomeSectionState();
}

class _HomeWelcomeSectionState extends State<HomeWelcomeSection> {
  
  List<String> featuredList = [
    getPath("images/featured-1.jpg"),
    getPath("images/featured-2.jpg"),
    getPath("images/featured-3.jpg"),
  ];

  late int selectedHover = 99;
  void setSelectedHover(int value) {
    setState(() {
      selectedHover = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          color: Color(0xff6E6268),
          height: 350,
        ),
        Column(
          children: [
            Container(
              width: double.infinity,
              child: BlockWrapper(
                child: _headAbout()
              ),
            ),
            _featuredWidget()
          ],
        ),
      ],
    );
  }

  Widget _featuredWidget() {
    return Container(
      width: double.infinity,
      child: BlockWrapper(
        child: ResponsiveRowColumn(
          rowColumn: !ResponsiveWrapper.of(context).isSmallerThan(DESKTOP),
          rowCrossAxisAlignment: CrossAxisAlignment.center,
          columnCrossAxisAlignment: CrossAxisAlignment.center,
          columnMainAxisSize: MainAxisSize.min,
          columnSpacing: 0,
          rowMainAxisAlignment: MainAxisAlignment.center,
          rowSpacing: 0,
          rowPadding: EdgeInsets.all(0),
          // rowMainAxisSize: MainAxisSize.min,
          children: List.generate(featuredList.length, (index) => ResponsiveRowColumnItem(
            rowFlex: 1,
            rowFit: FlexFit.loose,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                onEnter: (val) => setSelectedHover(index),
                onExit: (val) => setSelectedHover(99),
                child: Transform.scale(
                  scale: selectedHover == index ? 1.1 : 1,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    width: 300,
                    height: 280,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white, width: 5),
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
          )).toList(),
        ),
      ),
    );
  }

  Widget _headAbout() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Color(0xff181818),
            borderRadius: BorderRadius.circular(2)
          ),
          margin: EdgeInsets.only(top: 20),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Text(
              "WE ARE SO HAPPY TO MEET YOU",
              style: styleSubtitle.copyWith(
                color: Colors.white,
                fontSize: 20,
                letterSpacing: 2
              ),
            ),
          ),
        ),
        Container(
          width: 2,
          color: Colors.black,
          height: 25,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(2)
          ),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              "W",
              textAlign: TextAlign.center,
              style: styleSubtitle.copyWith(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.15),
          child: Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam commodo aliquet purus, venenatis eleifend orci ullamcorper ut. Duis tempor sed nunc vitae auctor. Vivamus commodo sed erat posuere ullamcorper. Proin maximus purus vel ipsum aliquet porttitor.",
            textAlign: TextAlign.center,
            style: styleCaption.copyWith(
              color: Colors.black
            ),
          ),
        ),
        SizedBox(height: 20)
      ],
    );
  }
}