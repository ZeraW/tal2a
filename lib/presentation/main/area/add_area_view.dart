import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:tal2a/app/server/area_api.dart';
import 'package:tal2a/presentation/resources/values_manager.dart';
import '../../common/text_field.dart';
import '../../models/models.dart';
import '../../resources/styles_manager.dart';

class AddAreaScreen extends StatelessWidget {
  final TextEditingController areaTEC = TextEditingController();
  final TextEditingController costTEC = TextEditingController();
  final String route;

  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  AddAreaScreen({Key? key, required this.route}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Card(
      child: FormBuilder(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(AppPadding.p12),
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () async{
                      final form = formKey.currentState;
                      if (form!.validate()) {
                        await  AreaApi().addData(add: Area(id: areaTEC.text.toLowerCase(),cityId: route,cost: costTEC.text)).then((value) => context.pop());
                      } else {}
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
                    onPressed: () {
                      context.pop();
                    },
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
                child: Row(
                  children:  [
                    Expanded(
                      child: TextFormBuilder(
                        hint: 'اسم المنطقة',
                        maxLines: 1,
                        isRequired: true,
                        controller: areaTEC,
                        errorText: 'هذا الحقل مطلوب',
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Expanded(
                      child: TextFormBuilder(
                        hint: 'سعر شحن اضافي',
                        maxLines: 1,
                        isRequired: true,
                        controller: costTEC,
                        errorText: 'هذا الحقل مطلوب',
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
