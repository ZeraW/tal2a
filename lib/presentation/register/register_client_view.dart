// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tal2a/presentation/common/text_field.dart';
import '../common/dropdown.dart';
import '../models/models.dart';
import '../provider/auth_provider.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';

class RegisterClientView extends StatefulWidget {
  const RegisterClientView({Key? key}) : super(key: key);

  @override
  _RegisterClientViewState createState() => _RegisterClientViewState();
}

class _RegisterClientViewState extends State<RegisterClientView> {
  @override
  Widget build(BuildContext context) {
    final xProvider = context.read<RegisterClientProvider>();
    Location? location = context.watch<Location?>();

    List<City>? cityList = location?.allCities?.entries.map((entry) {
      City city = entry.value;
      return city;
    }).toList();


    List<Area>? areaList = location?.allAreas?.entries.map((entry) {
      Area area = entry.value;
      return area;
    }).toList();


    return Card(
        child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(AppPadding.p12),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          xProvider.validate(context);
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
                Consumer<RegisterClientProvider>(
                  builder: (context, provider, child) {
                    return FormBuilder(
                      key: provider.formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: TextFormBuilder(
                                  controller: provider.code,
                                  errorText: 'هذا الحقل مطلوب',
                                  hint: 'كود العميل',
                                  isRequired: true,
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                flex: 2,
                                child: TextFormBuilder(
                                  controller: provider.name,
                                  errorText: "هذا الحقل مطلوب",
                                  hint: 'اسم العميل',
                                  isRequired: true,
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                flex: 2,
                                child: TextFormBuilder(
                                  controller: provider.companyName,
                                  errorText: 'هذا الحقل مطلوب',
                                  hint: 'اسم شركة العميل',
                                  isRequired: true,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: TextFormBuilder(
                                  controller: provider.phoneNumber,
                                  errorText: 'هذا الحقل مطلوب',
                                  hint: 'رقم الهاتف',
                                  isRequired: true,
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: TextFormBuilder(
                                  controller: provider.phoneNumber2,
                                  errorText: 'هذا الحقل مطلوب',
                                  hint: 'رقم هاتف بديل',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormBuilder(
                            controller: provider.addressLine,
                            errorText: 'هذا الحقل مطلوب',
                            hint: 'عنوان',
                            isRequired: true,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: cityList != null && areaList != null
                                      ? DropDownDynamicWidget(
                                      title: 'المدينة',
                                      hint: 'اختر مدينة',
                                      selectedItem: provider.city,
                                      onChange: (val) {
                                        provider.updateCity(val, areaList);
                                      },
                                      isRequired: true,
                                      list: cityList)
                                      : const SizedBox()),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                  child:DropDownDynamicWidget(
                                      title: 'المنطقة',
                                      hint: 'اختر منطقة',
                                      selectedItem: provider.area,


                                      onChange: (val) {
                                        provider.updateArea(val);
                                      },
                                      isRequired: true,
                                      list: provider.areaList)),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: TextFormBuilder(
                                  controller: provider.password,
                                  isPassword: true,
                                  errorText: 'هذا الحقل مطلوب',
                                  hint: 'كلمة المرور',
                                  isRequired: true,
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: TextFormBuilder(
                                  controller: provider.confirmPassword,
                                  isPassword: true,
                                  errorText: 'هذا الحقل مطلوب',
                                  hint: 'تأكيد كلمة المرور',
                                  isRequired: true,
                                ),
                              ),
                            ],
                          ),
                        ]),
                      ),
                    );
                  },
                ),
              ],
            )));
  }
}
