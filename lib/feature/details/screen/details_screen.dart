import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/widgets/custom_button_widget.dart';
import 'package:news/feature/details/screen/widgets/details_details_section.dart';
import 'package:news/feature/details/screen/widgets/details_image_section.dart';
import 'package:news/feature/details/screen/widgets/details_title_section.dart';

class DetailsScreen extends StatelessWidget {
  dynamic title;
  dynamic image;
  dynamic shortSummary;
  dynamic details;
  DetailsScreen(
      {super.key,
      required this.title,
      required this.image,
      required this.shortSummary,
      required this.details});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.teal.shade700,
          title: Text(
            "تفاصيل الخبر",
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18.sp,
                color: Colors.white),
            overflow: TextOverflow.ellipsis,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              children: [
                SizedBox(
                  height: 50.h,
                ),
                DetailsImageSection(image: image),
                SizedBox(
                  height: 15.h,
                ),
                DetailsTitleSection(title: title),
                SizedBox(
                  height: 15.h,
                ),
                DetailsDetailsSection(details: details),
                SizedBox(
                  height: 25.h,
                ),
                customButton(
                  onTap: () async {
                    FlutterClipboard.copy(details).then((value) =>
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.green,
                          content: Center(child: Text('تم نسخ الخبر')),
                        )));
                  },
                  text: 'مشاركه الخبر',
                  iconBtton: Icon(
                    Icons.link_outlined,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
