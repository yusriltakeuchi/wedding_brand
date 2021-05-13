import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:wedding_brand/ui/constant/constant.dart';

class HomeAboutSection extends StatefulWidget {
  @override
  _HomeAboutSectionState createState() => _HomeAboutSectionState();
}

class _HomeAboutSectionState extends State<HomeAboutSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * (ResponsiveWrapper.of(context).isMobile ? 0.5 : 0.5),
      child: ResponsiveRowColumn(
        rowColumn: !ResponsiveWrapper.of(context).isSmallerThan(DESKTOP),
        rowCrossAxisAlignment: CrossAxisAlignment.start,
        columnCrossAxisAlignment: CrossAxisAlignment.center,
        columnMainAxisSize: MainAxisSize.min,
        columnSpacing: 0,
        rowSpacing: 0,
        children: [
          ResponsiveRowColumnItem(
            rowFlex: 1,
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
              child: _fieldAbout()
            ),
          ),
        ],
      ),
    );
  }

  Widget _fieldAbout() {
    return Container(
      color: Color(0xffECEBE8),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: (ResponsiveWrapper.of(context).isMobile ? 30 : 200), vertical: 35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "ABOUT WEDDING",
              style: styleTitle.copyWith(
                fontSize: 25,
                letterSpacing: 1,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 5),
            Container(
              width: 80,
              height: 2,
              color: Colors.black,
            ),
            SizedBox(height: 30),
            Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam commodo aliquet purus, venenatis eleifend orci ullamcorper ut. Duis tempor sed nunc vitae auctor. Vivamus commodo sed erat posuere ullamcorper. Proin maximus purus vel ipsum aliquet porttitor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam commodo aliquet purus. Proin maximus purus vel ipsum aliquet porttitor.",
              textAlign: TextAlign.justify,
              style: styleCaption.copyWith(
                wordSpacing: 5
              ),
            ),
            SizedBox(height: 30),
            _readMoreButton()
          ],
        ),
      ),
    );
  }

  Widget _fieldHeaderImage() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            getPath("images/about-1.jpg")
          ),
          fit: BoxFit.cover
        )
      ),
    );
  }

  Widget _readMoreButton() {
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
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 3),
              child: Text(
                "READ MORE",
                style: styleSubtitle.copyWith(
                  color: Colors.white,
                  letterSpacing: 2,
                  fontSize: 15
                ),
              ),
            ),
            Icon(Icons.arrow_right, color: Colors.white)
          ],
        ),
      ),
    );
  }
}