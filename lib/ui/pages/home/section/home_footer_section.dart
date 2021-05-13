import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wedding_brand/ui/components/block_wrapper.dart';
import 'package:wedding_brand/ui/constant/constant.dart';

class HomeFooterSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Color(0xff181818),
      child: BlockWrapper(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Copyright © 2021 ",
                style: styleSubtitle.copyWith(
                  fontSize: 15,
                  color: Colors.white
                ),
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Text(
                  "Yusril Rapsanjani",
                  style: styleSubtitle.copyWith(
                    fontSize: 15,
                    color: Colors.white
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}