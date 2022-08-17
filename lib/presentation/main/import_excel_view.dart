// ignore_for_file: prefer_const_constructors_in_immutables

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:provider/provider.dart';
import 'package:tal2a/presentation/resources/color_manager.dart';
import 'package:tal2a/presentation/resources/responsive.dart';
import 'package:tal2a/presentation/resources/values_manager.dart';
import '../common/dropdown.dart';
import '../common/excel_to_json.dart';
import '../models/from_excel.dart';
import '../models/models.dart';
import '../models/pluto_model.dart';
import '../resources/styles_manager.dart';

class ImportExcelScreen extends StatefulWidget {
  ImportExcelScreen({Key? key}) : super(key: key);

  @override
  State<ImportExcelScreen> createState() => _ImportExcelScreenState();
}

class _ImportExcelScreenState extends State<ImportExcelScreen> {
  late PlutoGridStateManager stateManager;
  List<OrderFromExcel> list =[];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    //print('${modelList.length}');
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(AppPadding.p12),
            child: Row(
              children: [
                ElevatedButton(
                    style: btnStyle(color: ColorManager.orange),
                    onPressed: () {
                      context.pop();
                    },
                    child: const Text('عودة')),
                const SizedBox(
                  width: AppSize.s12,
                ),
                ElevatedButton(
                  onPressed: () {
                  },
                  style: btnStyle(color: ColorManager.purple),
                  child: const Text(
                    'تصدير قالب اكسيل',
                  ),
                ),
              ],
            ),
          ),
          const Divider(color: ColorManager.grey3, height: AppSize.s0),

          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(AppSize.s8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('اختر ملف',
                        style: getSemiBoldStyle(color: ColorManager.grey1)),
                    const SizedBox(
                      height: AppSize.s6,
                    ),
                    ElevatedButton(
                        style: btnStyle(color: ColorManager.grey),
                        onPressed: () async{

                          MyExcelToJson().convert().then((onValue) {

                            list= List<OrderFromExcel>.from(json.decode(onValue!).map((x) => OrderFromExcel.fromJson(x)));
                            setState(() {

                            });
                          });
                        },
                        child: const Text('اضغط لأختيار ملف')),

                  ],
                ),
              ),
              const IntrinsicWidth(
                  child: DropDownWidget(
                      title: 'العميل',
                      hint: 'اختر عميل',
                      list: [
                        'محسن السيد احمد',
                        '2',
                      ])),
              const SizedBox(width: 8,),

              Padding(
                padding: const EdgeInsets.only(top: AppSize.s22),
                child: ElevatedButton(
                    style: btnStyle(
                        color: ColorManager.lightPrimary,
                        padding:
                        const EdgeInsets.symmetric(vertical: AppPadding.p18,horizontal: AppPadding.p12)),
                    onPressed: () {},
                    child: const Text('حفظ الشحنات')),
              ),
            ],
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: PlutoGrid(
                  key: UniqueKey(),
                  columns: OrderFromExcel().getColumns(context),
                  rows: OrderFromExcel().getRows(list),
                  mode: PlutoGridMode.select,
                  configuration: PlutoGridConfiguration(

                    style: PlutoGridStyleConfig(
                      gridBorderColor: Colors.black54,
                      columnFilterHeight: 1,
                      activatedBorderColor: Colors.indigo,
                      iconColor: Colors.black54,
                      disabledIconColor: Colors.black12,
                      gridBorderRadius: BorderRadius.circular(5)
                          .resolve(TextDirection.rtl),
                      columnHeight: 40,
                      activatedColor: Colors.black12,
                      rowHeight: 40,
                      borderColor: Colors.black12,
                    ),

                  ),
                  createFooter: (stateManager) {
                    stateManager.setPageSize(10,
                        notify: true); // Can be omitted. (Default 40)
                    return PlutoPagination(stateManager);
                  },
                  onSelected: (x) {
                    print('onSelected');
                    print(x.cell?.row.cells.values.first.value);
                  }),
            ),
          ),
        ],
      ),
    );
  }



}


