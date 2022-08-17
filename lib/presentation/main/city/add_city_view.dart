import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:tal2a/presentation/models/models.dart';
import 'package:tal2a/presentation/resources/values_manager.dart';
import '../../../app/server/city_api.dart';
import '../../common/text_field.dart';
import '../../resources/styles_manager.dart';

class AddCityScreen extends StatelessWidget {
  final TextEditingController cityTEC = TextEditingController();
  final TextEditingController cityCostTEC = TextEditingController();

  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  AddCityScreen({Key? key}) : super(key: key);
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
                      await  CityApi().addData(add: City(id: cityTEC.text.toLowerCase(),cost: cityCostTEC.text)).then((value) => context.pop());
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
                        hint: 'اسم المدينة',
                        maxLines: 1,
                        isRequired: true,
                        controller: cityTEC,
                        errorText: 'هذا الحقل مطلوب',
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Expanded(
                      child: TextFormBuilder(
                        hint: 'سعر الشحن',
                        maxLines: 1,
                        isRequired: true,
                        controller: cityCostTEC,
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
