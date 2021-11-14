import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/defaultTextFormField.dart';
import 'package:news/layout/news_app/cubit/cubit.dart';
import 'package:news/layout/news_app/cubit/states.dart';
import 'package:news/shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context,state){},
      builder: (context ,state ){

        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(

          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFormFiled(

                    type: TextInputType.text,
                    validator: (String value) {

                    },
                    controller: searchController,
                    icon: Icons.search,
                    onTab: (value) {
                      // NewsCubit.get(context).getsearch(value);
                    }),
              ),
              buildArticleItems(list , context)
            ],
          ),
        );
      },
    );
  }
}
