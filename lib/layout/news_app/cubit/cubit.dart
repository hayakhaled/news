import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news/layout/news_app/cubit/states.dart';
import 'package:bloc/bloc.dart';
import 'package:news/modules/business1/business_screen.dart';
import 'package:news/modules/sciense/sciense_screen.dart';
import 'package:news/modules/settings_screen/setting.dart';
import 'package:news/modules/sports/sport_screen.dart';
import 'package:news/network/remot/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates>{
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex=0;

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(icon:
    Icon(
     Icons.business_sharp,

    ),
     label: 'Bussiness'
    ),
     BottomNavigationBarItem(icon:
    Icon(
      Icons.science

    ),
        label: 'Science'
    ),
     BottomNavigationBarItem(icon:
    Icon(
      Icons.sports,

    ),
        label: 'Sports'
    ),
  ];

  List<Widget> Screen = [
    BusinessScreen(),
    ScienseScreen(),
    SportScreen(),
  ];

  void changeBottomNavBar(int index){

    currentIndex = index;
    if(index == 2){
      getSports();
    }
    if(index ==1){
      getScience();
    }
    emit(NewsBottomNavState());
  }

  List<dynamic> business  = [];

  void getBusiness()
  {
    emit(NewsGetBusinessLoadingState());
    if(sports.length ==0){
      DipHelper.getData(url: 'v2/top-headlines', query: {
        'country' : 'eg',
        'category' : 'business',
        'apiKey' : '172fbbd1b9254da9bceffdb0999f8382'
      }).then((value) {
        //print(value.data['articles'][0]['title']);
        business = value.data['articles'];
        print(business[0]['title']);
        emit(NewsGetBusinessSuccessState());
      }).catchError((error){
        print(error.toString());
        emit(NewsGetBusinessErrorState(error.toString()));
      });

    }else{
      emit(NewsGetBusinessSuccessState());
    }

  }

  List<dynamic> sports  = [];

  void getSports()
  {
    emit(NewsSportLoadingState());
    if(sports.length ==0){
      DipHelper.getData(url: 'v2/top-headlines', query: {
        'country' : 'eg',
        'category' : 'sports',
        'apiKey' : '172fbbd1b9254da9bceffdb0999f8382'
      }).then((value) {
        //print(value.data['articles'][0]['title']);
        sports = value.data['articles'];
        print(sports[0]['title']);
        emit(NewsGetSportSuccessState());
      }).catchError((error){
        print(error.toString());
        emit(NewsGetSportErrorState(error.toString()));
      });

    }else{
      emit(NewsGetSportSuccessState());
    }

  }


  List<dynamic> science  = [];

  void getScience()
  {
    emit(NewsScienceLoadingState());
    if(sports.length ==0){
      DipHelper.getData(url: 'v2/top-headlines', query: {
        'country' : 'eg',
        'category' : 'science',
        'apiKey' : '172fbbd1b9254da9bceffdb0999f8382'
      }).then((value) {
        //print(value.data['articles'][0]['title']);
        science = value.data['articles'];
        print(science[0]['title']);
        emit(NewsGetScienceSuccessState());
      }).catchError((error){
        print(error.toString());
        emit(NewsGetScienceErrorState(error.toString()));
      });

    }else{
      emit(NewsGetScienceSuccessState());
    }

  }

  List<dynamic> search  = [];

  void getsearch(String value)
  {
    emit(NewsSearchLoadingState());
    if(sports.length ==0){
      DipHelper.getData(url: 'v2/everything', query: {
        'q' : '$value',
        'category' : 'science',
        'apiKey' : '172fbbd1b9254da9bceffdb0999f8382'
      }).then((value) {
        //print(value.data['articles'][0]['title']);
        search = value.data['articles'];
        print(search[0]['title']);
        emit(NewsGetSearchSuccessState());
      }).catchError((error){
        print(error.toString());
        emit(NewsGetSearchErrorState(error.toString()));
      });

    }else{
      emit(NewsGetSearchSuccessState());
    }

  }

  }
