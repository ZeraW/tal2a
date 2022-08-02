import 'package:pluto_grid/pluto_grid.dart';

import '../common/custom_pluto_column.dart';

class PlutoColumnModel {
  String title, field;
  double width;

  PlutoColumnModel(
      {required this.title, required this.field, required this.width});


}

class CustomModels {
  String? name, city, area;

  CustomModels({
    this.name,
    this.city,
    this.area,
  });

   Map<String, PlutoCell> _row(CustomModels model) {
    return {
      'name': PlutoCell(value: '${model.name}'),
      'city': PlutoCell(value: '${model.city}'),
      'area': PlutoCell(value: '${model.area}'),
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
       customPlutoColumn(title: '',field: 'final',width: 0),
     ];
  }



}
