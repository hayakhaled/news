import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/news_app/cubit/states.dart';
import 'package:news/network/local/cach_helper.dart';

class AppCubit extends Cubit<NewsStates> {
  AppCubit() : super(NewsInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  // List<Widget> Screens = [
  //   NewTasksScreen(),
  //   DoneTasksScreen(),
  //   ArchivedTasksScreen(),
  // ];
  List<String> Titles = ['New Tasks', 'Done Tasks', 'Archived Tasks'];

  void changeIndex(int index) {
    currentIndex = index;
    // emit(AppChangeBottomNavBarState());
  }

  // late Database database;
  List<Map> tasks = [];

  void createDatabase() {
    // openDatabase('todo.db', version: 1, onCreate: (database, version) {
    //   database
    //       .execute(
    //       'CREATE TABLE tasks(id INTEGER PRIMARY KEY , title TEXT , date TEXT , time TEXT , status TEXT)')
    //       .then((value) => () {
    //     print('Table Create');
    //   })
    //       .catchError((error) {
    //     print("error when create table ${error.toString()}");
    //   });
    // }, onOpen: (database) {
    //
    //     print('database opened');
    //   }).then((value) {
    //     database = value;
    //     // emit(AppCreateDatabaseState());
    //   });
    // }

    insertToDatabase({
      required String title,
      required String time,
      required String date,
    }) async {
      // await database.transaction((txn) async {
      //   txn.rawInsert(
      //       'INSERT INTO tasks(title, date, time, status) VALUES("$title" ,"$time","$date","new")')
      //       .then((value) => {print("$value Insert successfully")});
      //   // emit(AppInsertDatabaseState());
      //
      //   getDataFromDatabase(database).then((value) {
      //     tasks = value;
      //     print(tasks);
      //     // emit(AppGetDatabaseState());
      //   });
      //
      // });
    }

    Future<List<Map>> getDataFromDatabase(database) async {
      return await database.rawQuery('SELECT * FROM tasks');
    }

    bool isBottomSheetShow = false;
    IconData fabIcon = Icons.edit;

    void changeBottomSheetState({
      required bool isShow,
      required IconData icon,
    }) {
      isBottomSheetShow = isShow;
      fabIcon = icon;
      // emit(AppChangeBottomNavBarState());}
    }
  }
  bool isDark = false;

  void changeMode({ bool ?  fromShared}){

    if(fromShared !=null){
      isDark = fromShared;
      emit(AppChangeMode());
    }else{
      isDark = !isDark;
      CacheHelper.putData(key:'isDark', value: isDark).then((value) {
        emit(AppChangeMode());
      });
    }



  }
}




