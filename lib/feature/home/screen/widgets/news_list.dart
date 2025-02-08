import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/feature/home/manager/home_manager_cubit.dart';
import 'package:news/feature/home/screen/widgets/news_item.dart';


class NewsList extends StatelessWidget {
  const NewsList({super.key});

  @override
  Widget build(BuildContext context) {
    var newsList = HomeManagerCubit.get(context).newsList;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: NewsItem(
                  details: newsList[index]['details'],
                  image: newsList[index]['image'],
                  title: newsList[index]['title'],
                  shortSummary: newsList[index]['short_summary'],
                ),
          ),
          separatorBuilder: (context, index) => Divider(),
          itemCount: HomeManagerCubit.get(context).newsList.length),
    );
  }
}
