import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/feature/home/manager/home_manager_cubit.dart';
import 'package:news/feature/home/screen/widgets/news_list.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeManagerCubit, HomeManagerState>(
        builder: (context, state) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.teal.shade700,
          title: Text('News',style: TextStyle(color: Colors.white),),
          centerTitle: true,
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [Expanded(child: NewsList())],
            ),
          ),
        ),
      );
    });
  }
}
