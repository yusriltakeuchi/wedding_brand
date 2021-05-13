import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:wedding_brand/ui/components/block_wrapper.dart';
import 'package:wedding_brand/ui/constant/constant.dart';

class HomeRecentSection extends StatefulWidget {
  @override
  _HomeRecentSectionState createState() => _HomeRecentSectionState();
}

class _HomeRecentSectionState extends State<HomeRecentSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Color(0xff6E6268),
      child: BlockWrapper(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              _titleRecent(),
              _recentItem()
            ],
          ),
        ),
      ),
    );
  }

  Widget _recentItem() {
    return ResponsiveRowColumn(
      rowColumn: !ResponsiveWrapper.of(context).isSmallerThan(DESKTOP),
      rowCrossAxisAlignment: CrossAxisAlignment.center,
      columnCrossAxisAlignment: CrossAxisAlignment.center,
      columnMainAxisSize: MainAxisSize.min,
      columnSpacing: 0,
      rowMainAxisAlignment: MainAxisAlignment.center,
      rowSpacing: 0,
      rowPadding: EdgeInsets.all(0),
      children: [
        ResponsiveRowColumnItem(
          rowFlex: 1,
          rowFit: FlexFit.loose,
          child: Padding(
            padding: EdgeInsets.only(top: 20),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  image: DecorationImage(
                    image: AssetImage(getPath("images/recent.jpg")),
                    fit: BoxFit.cover
                  ),
                ),
              ),
            ),
          ),
        ),
        ResponsiveRowColumnItem(
          rowFlex: 1,
          rowFit: FlexFit.loose,
          child: Container(
            width: ResponsiveWrapper.of(context).isLargerThan(MOBILE) ? 100 : 1,
            color: Colors.black,
            height: ResponsiveWrapper.of(context).isLargerThan(MOBILE) ? 1 : 100,
          ),
        ),
        ResponsiveRowColumnItem(
          rowFlex: 1,
          rowFit: FlexFit.loose,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: ResponsiveWrapper.of(context).isMobile ? 40 : 0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xff181818),
                    borderRadius: BorderRadius.circular(2)
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Yusril's Wedding Party",
                          style: styleTitle.copyWith(
                            color: Colors.white,
                            fontSize: 20,
                            letterSpacing: 2
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          '"Dengan kalimat basmalah dilantunkan ijap kabul dengan lantang sebagai jalan menuju hidup baru"',
                          textAlign: TextAlign.center,
                          style: styleCaption.copyWith(
                            color: Colors.white,
                            fontSize: 13,
                            wordSpacing: 2
                          ),
                        ),
                        SizedBox(height: 20),
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "View Press Here",
                                  textAlign: TextAlign.center,
                                  style: styleTitle.copyWith(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                                Icon(Icons.arrow_right, color: Colors.white, size: 18,),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    width: 1,
                    margin: EdgeInsets.only(right: 40),
                    color: Colors.black,
                    height: 40,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: _viewMoreButton()
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _viewMoreButton() {
    return TextButton(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Color(0xff181818)),
        overlayColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.hovered))
              return Color(0xff181818);
            if (states.contains(MaterialState.focused) ||
                states.contains(MaterialState.pressed))
              return textPrimary;
            return textPrimary;
          },
        ),
        shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.focused) ||
                states.contains(MaterialState.pressed))
              return RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(1)
              );
            return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(1)
            );
          },
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 3),
              child: Text(
                "VIEW MORE PRESS",
                style: styleSubtitle.copyWith(
                  color: Colors.white,
                  letterSpacing: 2,
                  fontSize: 10
                ),
              ),
            ),
            Icon(Icons.arrow_right, color: Colors.white, size: 18)
          ],
        ),
      ),
    );
  }

  Widget _titleRecent() {
    return Column(
      children: [
        Text(
          "RECENT PRESS",
          style: styleSubtitle.copyWith(
            fontSize: 15,
            color: Colors.white,
            letterSpacing: 4
          ),
        ),
        SizedBox(height: 5),
        Container(
          width: 40,
          height: 2,
          color: Colors.white,
        ),
      ],
    );
  }
}