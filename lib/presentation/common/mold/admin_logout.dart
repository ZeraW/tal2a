
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:tal2a/presentation/resources/color_manager.dart';

class AdminLogOut extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


  return  DropdownButton<String>(
      icon: Row(
        children: [
          CircleAvatar(radius: 20,backgroundColor: Colors.white,child: Icon(Icons.admin_panel_settings,color: ColorManager.primary,),),
          const SizedBox(width: 15,),
          const Text('Name',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17),),
          const SizedBox(width: 8,),
          const Icon(Icons.keyboard_arrow_down,color: Colors.white,)
        ],
      ),
      underline: const SizedBox(),
      dropdownColor: ColorManager.white,

      items: <String>['Profile','Logout'].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (v)async{

      },
    ) ;
  }
}
