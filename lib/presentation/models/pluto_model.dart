import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';
import '../common/custom_pluto_column.dart';

class PlutoColumnModel {
  String title, field;
  double width;

  PlutoColumnModel(
      {required this.title, required this.field, required this.width});


}

class CustomModels {
  String? id,name, city, area;

  CustomModels({
    this.id,
    this.name,
    this.city,
    this.area,
  });

   Map<String, PlutoCell> _row(CustomModels model) {
    return {
      'name': PlutoCell(value: '${model.name}'),
      'city': PlutoCell(value: '${model.city}'),
      'area': PlutoCell(value: '${model.area}'),
      'action': PlutoCell(value: '${model.id}'),
      'final': PlutoCell(value: ''),
    };
  }

  List<PlutoRow> getRows(List<CustomModels> mList) {
    return mList.map((e) => PlutoRow(cells: _row(e))).toList();
  }

  List<PlutoColumn> getColumns(){
     return [
       customPlutoColumn(title: 'الاسم',field: 'name',width: 100),
       customPlutoColumn(title: 'المدينة',field: 'city',width: 100),
       customPlutoColumn(title: 'المنطقة',field: 'area',width: 100),
       customPlutoColumn(title: 'خيارات',field: 'action',width: 110,renderer: (c){
         return Align(
           alignment: Alignment.center,
           child: Row(
               mainAxisSize: MainAxisSize.min,
               children: [
             IconButton(
               icon: const Icon(
                 Icons.edit,
               ),
               onPressed: () {

               },
               iconSize: 18,
               color: Colors.green,
               padding: const EdgeInsets.all(0),
             ),
             IconButton(
               icon: const Icon(
                 Icons.delete_forever,
               ),
               onPressed: () {
                 print(c.cell.value.toString());
               },
               iconSize: 18,
               color: Colors.red,
               padding: const EdgeInsets.all(0),
             )

           ]),
         );
       }),
       customPlutoColumn(title: '',field: 'final',width: 0),
     ];
  }



}
