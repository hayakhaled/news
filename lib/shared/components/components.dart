

import 'package:flutter/material.dart';
import 'package:news/modules/webview/webscreen.dart';

Widget MyDivider() =>Padding(
padding:  EdgeInsets.all(15.0),
child: Container(
width: double.infinity,
height: 1.0,
color: Colors.grey[300],
),
);

Widget buildArticleItems(article,context) => InkWell(
  onTap: (){
    Navigator.push(context,   MaterialPageRoute(builder: (context) => webViewScreen(article['url'])));
  },
  child:   Padding(padding:EdgeInsets.all(20.0),

    child: Row(

      children: [

        Container(

          width: 120,

          height: 120,

          decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(10.0),

              image:  DecorationImage(

                  image:  NetworkImage(

                    '${article['urlToImage']}',

                  ),

                  fit: BoxFit.cover

              )),

        ),

        SizedBox(

          width: 20.0,

        ),

        Expanded(

          child: Container(

            height: 120.0,

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,

              mainAxisAlignment:MainAxisAlignment.start ,



              children:[

                Expanded(

                  child: Text(

                    '${article['title']}',

                    style: Theme.of(context).textTheme.bodyText1,

                    maxLines: 4,

                    overflow: TextOverflow.ellipsis,

                  ),

                ),



                Expanded(

                  child: Text(

                    '${article['publishedAt']}',

                    style: TextStyle(

                        color: Colors.grey

                    ),

                  ),

                )

              ],

            ),

          ),

        )

      ],

    ),

  ),
);



