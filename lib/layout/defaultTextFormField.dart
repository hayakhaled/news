// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:news/modules/webview/webscreen.dart';

Widget defaultFormFiled({
  required Function() ? onTab(value),
  required TextEditingController controller,
  required TextInputType type,
  var labelText,
  required IconData icon,
  required Function  validator,
}) =>
    Container(
      decoration: BoxDecoration(
        // border: Border.all(
        //   color: Colors.black12,
        // ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 13.0),
        child: TextFormField(
          onTap:onTab(''),
          keyboardType: type,
          controller: controller,

          decoration: InputDecoration(
            labelText: labelText,
            labelStyle: TextStyle(
              color: Colors.black26,
              fontSize: 15,
            ),
            prefixIcon:Icon(
                icon
            ),
          ),
        ),
      ),
    );

Widget buildTaskItem(Map model)=> InkWell(
  onTap: (){

  },
  child:   Padding(
  
    padding: const EdgeInsets.all(20.0),
  
    child: Row(
  
      children: [
  
        CircleAvatar(
  
          radius: 40.0,
  
          child: Text('${model['title']}'),
  
        ),
  
        SizedBox(
  
          width: 20.0,
  
        ),
  
        Column(
  
          mainAxisSize: MainAxisSize.min,
  
          children: [
  
            Text(
  
              "${model['time']}",
  
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
  
            ),
  
            Text(
  
              "${model['date']}",
  
              style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold,
  
                  color: Colors.grey
  
              ),
  
            )
  
          ],
  
        )
  
      ],
  
    ),
  
  ),
);

Widget buildArticleItem(article , context) => InkWell(
onTap: (){
   Navigator.push(context,   MaterialPageRoute(builder: (context) => webViewScreen(article['url'])));
},
);

// class DefualtTextFelid extends StatelessWidget {
//
//
//   @override
//   Widget build(BuildContext context) {
//     @required var textcontroller = TextEditingController();
//     @required var textType = TextInputType.text;
//     @required var textValidator = '';
//     @required var labelText = '' ;
//     return Form(
//       child: Container(
//         decoration: BoxDecoration(
//             border: Border.all(
//                 color:Colors.black12
//             )
//         ),
//         child: TextFormField(
//           keyboardType:textType,
//           controller: textcontroller,
//           validator: (value) {
//             if (value == '') {
//               return textValidator;
//             } else {
//               return null;
//             }
//           },
//           decoration: InputDecoration(
//             labelText: labelText,
//             labelStyle: TextStyle(
//               color: Colors.black26,
//               fontSize: 15,
//             ),            ),
//         ),
//       ),
//     );
//   }
// }
