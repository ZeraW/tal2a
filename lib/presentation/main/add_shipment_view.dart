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
import '../common/text_with_green_background.dart';
import '../models/pluto_model.dart';
import '../resources/styles_manager.dart';
class AddNewShipmentScreen extends StatelessWidget {
  final ScrollController controller = ScrollController(keepScrollOffset: false);

  AddNewShipmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  onPressed: () {},
                  child: const Text(
                    'طباعة جميع الشحنات',
                  ),
                  style: btnStyle(color: ColorManager.purple),
                ),
              ],
            ),
          ),
          Divider(color: ColorManager.grey3, height: AppSize.s0),
          Expanded(
            child: Scrollbar(
              controller: controller,
              thumbVisibility: true,
              child: SingleChildScrollView(
                controller: controller,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(AppPadding.p12),
                  alignment: AlignmentDirectional.centerStart,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          const TextWithGreenBack(text: 'بيانات الراسل'),
                          Row(
                            children: [
                              Expanded(
                                  flex: Responsive.isMobile(context) ? 1 : 2,
                                  child:
                                  const TextFieldWidget(title: 'العميل')),
                              const Expanded(
                                  child: TextFieldWidget(title: 'التاريخ')),
                              const Expanded(
                                  child: TextFieldWidget(title: 'اليوم')),
                            ],
                          ),
                          Divider(
                              color: ColorManager.grey3, height: AppSize.s12),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: AppPadding.p8, bottom: AppPadding.p12),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'حفظ',
                                    ),
                                    style: btnStyle(color: ColorManager.black),
                                  ),
                                ),
                                const SizedBox(
                                  width: AppSize.s12,
                                ),
                                const Expanded(
                                    child: TextWithGreenBack(
                                        text: 'بيانات الشحنة')),
                              ],
                            ),
                          ),
                        ],
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                            maxWidth: !Responsive.isMobile(context)
                                ? 600
                                : double.infinity),
                        child: Column(
                          children: [
                            Row(
                              children: const [
                                Expanded(
                                    child: TextFieldWidget(
                                        title: 'كود تاجر الشحنة')),
                                Expanded(
                                    child: DropDownWidget(
                                        title: 'استلام الشحنة بفرع',
                                        hint: 'اختر الفرع',
                                        list: [
                                          '1',
                                          '2',
                                        ])),
                              ],
                            ),
                            Row(
                              children: const [
                                Expanded(
                                    child:
                                    TextFieldWidget(title: 'اسم المستلم')),
                                Expanded(
                                    child: TextFieldWidget(title: 'موبايل')),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Expanded(
                                    child: DropDownWidget(
                                      title: 'من مدينة',
                                      hint: 'اختر مدينة',
                                      list: [
                                        '1',
                                        '2',
                                      ],
                                    )),
                                Expanded(
                                    child: DropDownWidget(
                                        title: 'الي مدينة',
                                        hint: 'اختر مدينة',
                                        list: [
                                          '1',
                                          '2',
                                        ])),
                                Expanded(
                                    child: DropDownWidget(
                                        title: 'المنطقة',
                                        hint: 'اختر منطقة',
                                        list: [
                                          '1',
                                          '2',
                                        ])),
                              ],
                            ),
                            const TextFieldWidget(
                              title: 'عنوان التسليم',
                              maxLines: 2,
                            ),
                            Row(
                              children: const [
                                Expanded(
                                    flex: 3,
                                    child:
                                    TextFieldWidget(title: 'محتوي الشحنة')),
                                Expanded(
                                    child: TextFieldWidget(title: 'الكمية')),
                              ],
                            ),
                            Row(
                              children: const [
                                Expanded(
                                    child: DropDownWidget(
                                        title: 'شحن علي',
                                        hint: 'اختر',
                                        list: [
                                          '1',
                                          '2',
                                        ])),
                                Expanded(
                                    child:
                                    TextFieldWidget(title: 'قيمه الشحنة')),
                                Expanded(
                                    child:
                                    TextFieldWidget(title: 'تكلفة الشحن')),
                                Expanded(
                                    child: TextFieldWidget(title: 'الاجمالي')),
                              ],
                            ),
                            const TextFieldWidget(
                                title: 'ملاحظات', maxLines: 3),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
