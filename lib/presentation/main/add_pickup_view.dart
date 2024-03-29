import 'package:flutter/material.dart';
import 'package:tal2a/presentation/resources/values_manager.dart';

import '../common/text_field.dart';
import '../resources/styles_manager.dart';

class AddPickUpScreen extends StatelessWidget {
  const AddPickUpScreen({Key? key}) : super(key: key);

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
                  onPressed: () {

                  },
                  style: correctStyle(),
                  child: Row(
                    children: const [
                      Icon(Icons.check_outlined),
                      SizedBox(
                        width: AppSize.s8,
                      ),
                      Text('حفظ'),
                    ],
                  ),
                ),
                const SizedBox(
                  width: AppSize.s12,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: wrongStyle(),
                  child: Row(
                    children: const [
                      Icon(Icons.close),
                      SizedBox(
                        width: AppSize.s8,
                      ),
                      Text('إلغاء'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(
              color: Colors.black12, indent: 0, endIndent: 0, height: 0),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Wrap(
                children: const [
                  TextFieldWidget(
                    title: 'عنوان العميل',
                    width: 366,
                    maxLines: 2,
                  ),
                  TextFieldWidget(title: 'رسوم الاستلام', width: 200),
                  TextFieldWidget(title: 'عدد الشحنات', width: 150),
                  TextFieldWidget(title: 'تاريخ الاستلام', width: 200),
                  TextFieldWidget(title: 'طريقة الدفع', width: 150),
                  TextFieldWidget(title: 'ملاحظات', width: 366, maxLines: 3),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
