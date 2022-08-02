import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';
import 'package:tal2a/presentation/common/text_field.dart';
import '../common/dropdown.dart';
import '../common/hoverd.dart';
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
    final provider = context.read<RegisterClientProvider>();

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
                          provider.validate();

                        },
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

                FormBuilder(
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
                children: const[
                  Expanded(child: DropDownWidget(
                      title: 'المدينة',
                      hint: 'اختر مدينة',
                      isRequired: true,
                      list: [
                        '1',
                        '2',
                      ])),
                   SizedBox(
                    width: 20,
                  ),
                  Expanded(child: DropDownWidget(
                      title: 'المنطقة',
                      hint: 'اختر منطقة',
                      isRequired: true,

                      list: [
                        '1',
                        '2',
                      ])),
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
    ),
              ],
            )));
  }
}
