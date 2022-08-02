import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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

class ImportExcelScreen extends StatefulWidget {
  ImportExcelScreen({Key? key}) : super(key: key);

  @override
  State<ImportExcelScreen> createState() => _ImportExcelScreenState();
}

class _ImportExcelScreenState extends State<ImportExcelScreen> {
  late PlutoGridStateManager stateManager;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.read<MiProvider>();

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
                    provider.update();
                  },
                  child: const Text(
                    'تصدير قالب اكسيل',
                  ),
                  style: btnStyle(color: ColorManager.purple),
                ),
              ],
            ),
          ),
          Divider(color: ColorManager.grey3, height: AppSize.s0),
          Expanded(
              child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppPadding.p12),
            alignment: AlignmentDirectional.topStart,
            child: SingleChildScrollView(
                child: Wrap(
              /*crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,*/
              children: [
                IntrinsicWidth(
                  child: Padding(
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
                        Row(
                          children: [
                            ElevatedButton(
                                style: btnStyle(color: ColorManager.grey),
                                onPressed: () {},
                                child: const Text('اضغط لأختيار ملف')),
                            const SizedBox(
                              width: AppSize.s12,
                            ),
                            SizedBox(
                              width: 140,
                              child: Text('اسم الملف هيظهر هنا',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: getRegularStyle(
                                      color: ColorManager.grey1)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width:
                          !Responsive.isMobile(context) ? 600 : double.infinity,
                      child: Row(
                        children: [
                          const Expanded(
                              child: DropDownWidget(
                                  title: 'استلام الشحنات بفرع',
                                  hint: 'اختر الفرع',
                                  list: [
                                '1',
                                '2',
                              ])),
                          const Expanded(
                              child: DropDownWidget(
                                  title: 'الشحن من مدينة',
                                  hint: 'اختر المدينة',
                                  list: [
                                '1',
                                '2',
                              ])),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: AppSize.s22),
                              child: ElevatedButton(
                                  style: btnStyle(
                                      color: ColorManager.black,
                                      padding:
                                          const EdgeInsets.all(AppPadding.p18)),
                                  onPressed: () {},
                                  child: const Text('عرض البيانات')),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          style: btnStyle(
                              color: ColorManager.lightPrimary,
                              padding: const EdgeInsets.symmetric(
                                  vertical: AppPadding.p18, horizontal: 80)),
                          onPressed: () {},
                          child: const Text('حفظ الشحنات')),
                    ),
                  ],
                ),
                Consumer<MiProvider>(
                  builder: (context, xPro, child) {
                    print(provider.mList.length);
                    return SizedBox(
                      height: 340,
                      child: PlutoGrid(
                          key: UniqueKey(),
                          columns: CustomModels().getColumns(),
                          rows: xPro.getRow(),
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
                            stateManager.setPageSize(6,
                                notify: true); // Can be omitted. (Default 40)
                            return PlutoPagination(stateManager);
                          },
                          onSelected: (x) {
                            print('onSelected');
                            print(x.cell?.row.cells.values.first.value);
                          }),
                    );
                  },
                ),
              ],
            )),
          )),
        ],
      ),
    );
  }
}

class MiProvider extends ChangeNotifier {
  List<CustomModels> mList2 = [
    CustomModels(name: 'الاسم', area: 'المنطقة', city: 'المدينة'),
    CustomModels(name: '2', area: '2', city: '2'),
    CustomModels(name: '3', area: '3', city: '3')
  ];
  List<CustomModels> mList = List.generate(
    4,
    (index) => CustomModels(name: 'الاسم', area: 'المنطقة', city: 'المدينة'),
  );

  List<PlutoRow> getRow() {
    return CustomModels().getRows(mList);
  }

  void update() {
    mList.add(CustomModels(name: 'x', area: 'x', city: 'x'));
    notifyListeners();
  }
}
