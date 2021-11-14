import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/news_app/cubit/appcu.dart';
import 'package:news/layout/news_app/cubit/cubit.dart';
import 'package:news/modules/search/search_screen.dart';
import 'package:news/network/remot/dio_helper.dart';
import 'package:news/shared/components/components.dart';
import 'cubit/states.dart';

class NewsLayout extends StatefulWidget {
  @override
  State<NewsLayout> createState() => _NewsLayoutState();
}

class _NewsLayoutState extends State<NewsLayout> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
          listener: (context, state) {},
          builder: (context, statee) {
            var cubit = NewsCubit.get(context);

            return Scaffold(
              appBar: AppBar(
                title:  Text('News App'),
                actions: [
                  IconButton(onPressed: () {

                 Navigator.push(context,   MaterialPageRoute(builder: (context) => SearchScreen()));
                  },
                      icon:  Icon(
                        Icons.search
                      ),
                  ) ,
                  IconButton(
                    icon:  Icon(
                        Icons.brightness_4_rounded
                    ),
                    onPressed: () {
                      AppCubit.get(context).changeMode();
                      print('success');
                    },
                  )
                ],
              ),
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: cubit.currentIndex,
                onTap: (index) {
                  cubit.changeBottomNavBar(index);
                },
                items: cubit.bottomItems,
              ),
              body: cubit.Screen[cubit.currentIndex],

            );
          },
        );

  }
}
