import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:provider/provider.dart';
import 'package:tal2a/presentation/resources/color_manager.dart';
import 'package:tal2a/presentation/resources/values_manager.dart';

import '../../models/models.dart';

class AllAdminsScreen extends StatelessWidget {
  const AllAdminsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AllAdmins? allUsers = context.watch<AllAdmins?>();
    List<Admin>? mList = allUsers?.allAdmins?.entries.map((entry) {
      Admin model = entry.value;
      return model;
    }).toList();
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p4),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(AppPadding.p12),
              child: ElevatedButton(
                  onPressed: () {
                    context.goNamed('register-admin');

                  }, child: const Text('تسجيل ادمن')),
            ),
            const Divider(color: ColorManager.grey3, height: AppSize.s0),
            Expanded(
              child: mList!=null ?Padding(
                padding: const EdgeInsets.all(8.0),
                child: PlutoGrid(
                    key: UniqueKey(),
                    columns: Admin().getColumns(context),
                    rows: Admin().getRows(mList),
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
              ):const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}