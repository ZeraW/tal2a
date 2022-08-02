import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:tal2a/presentation/resources/color_manager.dart';

import '../resources/styles_manager.dart';




PlutoColumn customPlutoColumn(
    {required String title, required String field, double? width}) {
  return PlutoColumn(
      title: title,
      field: field,
      textAlign: PlutoColumnTextAlign.center,
      titleTextAlign: PlutoColumnTextAlign.center,
      width: width ?? 0,
      renderer: (c) {
        return Align(
          alignment: Alignment.center,
          child: Text(
            c.cell.value.toString(),
            maxLines: 2,
            style: getMediumStyle(color: ColorManager.darkGrey),
          ),
        );
      },
      hide: false,
      type: PlutoColumnType.text(),
      enableColumnDrag: false,
      enableAutoEditing: false,
      enableRowDrag: false,
      enableEditingMode: false,
      enableContextMenu: false,
      enableDropToResize: false,
      enableFilterMenuItem: false,
      enableHideColumnMenuItem: false,
      enableRowChecked: false,
      enableSetColumnsMenuItem: false,
      backgroundColor: Colors.indigo[200],
      readOnly: true,
      applyFormatterInEditing: false);
}

