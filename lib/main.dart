import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news/layout/news_app/cubit/appcu.dart';
import 'package:news/layout/news_app/cubit/cubit.dart';
import 'package:news/layout/news_app/cubit/states.dart';
import 'package:news/network/local/cach_helper.dart';

import 'layout/news_app/news_layout.dart';
import 'network/remot/dio_helper.dart';

void main() async{
 WidgetsFlutterBinding.ensureInitialized();
  DipHelper.init();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getData(key:'isDark');
  runApp( MyApp(isDark));
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  MyApp(
      this.isDark
      );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NewsCubit()..getBusiness(),),
    BlocProvider(
    create: (BuildContext context) => AppCubit()..changeMode(
    fromShared: isDark
    ),),
      ],
      child:
        BlocConsumer<AppCubit,NewsStates>(

          listener:(context,state) {},
          builder:(context , state) {
            return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme : ThemeData(
                    primarySwatch:Colors.orange,
                    floatingActionButtonTheme:FloatingActionButtonThemeData(
                        backgroundColor: Colors.orange
                    ),
                    scaffoldBackgroundColor: Colors.white,
                    appBarTheme:  const AppBarTheme(
                        backwardsCompatibility: false,
                        systemOverlayStyle: SystemUiOverlayStyle(
                          statusBarColor:Colors.white,
                          statusBarIconBrightness: Brightness.dark,
                        ),
                        backgroundColor:Colors.white,
                        elevation:0.0,
                        titleTextStyle: TextStyle(
                          color:Colors.black,
                          fontSize:20.0,
                          fontWeight:FontWeight.bold,
                        ),
                        iconTheme:IconThemeData(
                            color:Colors.orange
                        )
                    ),
                    bottomNavigationBarTheme:  BottomNavigationBarThemeData(
                      type: BottomNavigationBarType.fixed,
                      selectedItemColor: Colors.orange,
                      backgroundColor:Colors.white,
                      unselectedItemColor: Colors.black
                    ),
                    textTheme: TextTheme(
                        bodyText1:TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.black
                        )
                    )
                ),
                darkTheme: ThemeData(
                    primarySwatch:Colors.orange,
                    floatingActionButtonTheme:FloatingActionButtonThemeData(
                        backgroundColor: Colors.orange
                    ),
                    scaffoldBackgroundColor: HexColor('333739'),
                    appBarTheme:   AppBarTheme(
                        backwardsCompatibility: false,
                        systemOverlayStyle: SystemUiOverlayStyle(
                          statusBarColor: HexColor('333739'),
                          statusBarIconBrightness: Brightness.light,
                        ),
                        backgroundColor:HexColor('333739'),
                        elevation:0.0,
                        titleTextStyle: TextStyle(
                          color:Colors.white,
                          fontSize:20.0,
                          fontWeight:FontWeight.bold,
                        ),
                        iconTheme:IconThemeData(
                            color:Colors.white
                        )
                    ),
                    bottomNavigationBarTheme:  BottomNavigationBarThemeData(
                      unselectedItemColor: Colors.grey,
                      backgroundColor:HexColor('333739'),
                      type: BottomNavigationBarType.fixed,
                      selectedItemColor: Colors.orange,
                    ),
                    textTheme: TextTheme(
                        bodyText1:TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.black
                        )
                    )
                ),
                themeMode: AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
                home:NewsLayout()
            );
          } ,

        ),);

  }
}

