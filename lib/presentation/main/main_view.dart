import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tal2a/presentation/common/mold/main_mold.dart';

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







