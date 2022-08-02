import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tal2a/presentation/resources/color_manager.dart';
import 'package:tal2a/presentation/resources/values_manager.dart';
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
                  style: btnStyle(color: ColorManager.purple),
                  child: const Text(
                    'تصدير واستيراد اكسيل',
                  ),
                ),
              ],
            ),
          ),
          const Divider(color: ColorManager.grey3, height: AppSize.s0),
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
