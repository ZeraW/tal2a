import 'package:flutter/material.dart';
import 'package:tal2a/presentation/common/mold/main_mold.dart';
import 'package:tal2a/presentation/resources/assets_manager.dart';
import 'package:tal2a/presentation/resources/color_manager.dart';
import 'package:tal2a/presentation/resources/values_manager.dart';

import '../common/text_field.dart';
import '../resources/styles_manager.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return MoldView(title: 'لوحة التحكم', child: const AddPickUpScreen());
  }
}

class PickUpScreen extends StatelessWidget {
  const PickUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p4),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(AppPadding.p12),
              child: ElevatedButton(
                  onPressed: () {}, child: const Text('إضافة بيك اب')),
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
      ),
    );
  }
}

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
                  onPressed: () {},
                  child: Row(
                    children: const [
                      Icon(Icons.check_outlined),
                      SizedBox(
                        width: AppSize.s8,
                      ),
                      Text('حفظ'),
                    ],
                  ),
                  style: correctStyle(),
                ),
                const SizedBox(
                  width: AppSize.s12,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    children: const [
                      Icon(Icons.close),
                      SizedBox(
                        width: AppSize.s8,
                      ),
                      Text('إلغاء'),
                    ],
                  ),
                  style: wrongStyle(),
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
                children:  const[
                  TextFieldWidget(title: 'عنوان العميل', width: 366,maxLines: 2,), TextFieldWidget(title: 'رسوم الاستلام',width: 200),
                  TextFieldWidget(title: 'عدد الشحنات',width: 150),TextFieldWidget(title: 'تاريخ الاستلام',width: 200),
                  TextFieldWidget(title: 'طريقة الدفع',width: 150),TextFieldWidget(title: 'ملاحظات',width: 366,maxLines: 3),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

