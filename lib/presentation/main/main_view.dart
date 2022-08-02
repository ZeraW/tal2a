import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:provider/provider.dart';
import 'package:tal2a/presentation/common/mold/main_mold.dart';
import 'package:tal2a/presentation/resources/color_manager.dart';
import 'package:tal2a/presentation/resources/responsive.dart';
import 'package:tal2a/presentation/resources/values_manager.dart';
import 'dart:ui' as ui;

import '../common/dropdown.dart';
import '../common/text_field.dart';
import '../models/pluto_model.dart';
import '../resources/styles_manager.dart';
import 'import_excel_view.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return MoldView(
        title: 'لوحة التحكم',
        child: ChangeNotifierProvider.value(
            value: MiProvider(), child: ImportExcelScreen()));
  }
}







