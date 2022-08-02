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

class AddShipmentsPreviewScreen extends StatelessWidget {
  const AddShipmentsPreviewScreen({Key? key}) : super(key: key);

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
                    style: btnStyle(color: ColorManager.lightPrimary),
                    onPressed: () {
                      context.goNamed('new-shipment');
                    },
                    child: const Text('إضافة شحنات')),
                const SizedBox(
                  width: AppSize.s12,
                ),
                ElevatedButton(
                  onPressed: () {
                    context.goNamed('import-excel');

                  },
                  child: const Text(
                    'تصدير واستيراد اكسيل',
                  ),
                  style: btnStyle(color: ColorManager.purple),
                ),
              ],
            ),
          ),
          Divider(color: ColorManager.grey3, height: AppSize.s0),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.p12),
              child: Column(
                children: const [
                  TextField(
                    maxLines: 1,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      hintText: 'ابحث هنا...',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
