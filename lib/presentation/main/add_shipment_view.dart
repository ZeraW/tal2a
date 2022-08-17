import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tal2a/presentation/resources/color_manager.dart';
import 'package:tal2a/presentation/resources/responsive.dart';
import 'package:tal2a/presentation/resources/values_manager.dart';
import '../../app/server/shipments_api.dart';
import '../common/dropdown.dart';
import '../common/text_field.dart';
import '../common/text_with_green_background.dart';
import '../models/models.dart';
import '../provider/add_shipment_provider.dart';
import '../resources/styles_manager.dart';

class AddNewShipmentScreen extends StatelessWidget {
  final ScrollController controller = ScrollController(keepScrollOffset: false);

  AddNewShipmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.read<AddShipmentProvider>();

    Location? location = context.watch<Location?>();
    AllClients? clients = context.watch<AllClients?>();
    List<ClientModel>? clientList = clients?.allClients?.entries.map((entry) {
      ClientModel model = entry.value;
      return model;
    }).toList();

    List<City>? cityList = location?.allCities?.entries.map((entry) {
      City model = entry.value;
      return model;
    }).toList();

    List<Area>? areaList = location?.allAreas?.entries.map((entry) {
      Area model = entry.value;
      return model;
    }).toList();

    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(AppPadding.p12),
            child: Row(
              children: [
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      provider.validate(context);
                    },
                    style: btnStyle(color: ColorManager.black),
                    child: const Text(
                      'حفظ',
                    ),
                  ),
                ),
                const SizedBox(
                  width: AppSize.s12,
                ),
                ElevatedButton(
                    style: btnStyle(color: ColorManager.orange),
                    onPressed: () {
                      context.pop();
                    },
                    child: const Text('عودة')),
              ],
            ),
          ),
          const Divider(color: ColorManager.grey3, height: AppSize.s0),
          Expanded(
            child: Scrollbar(
              controller: controller,
              thumbVisibility: true,
              child: FormBuilder(
                key: provider.formKey,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Consumer<AddShipmentProvider>(
                                  builder: (context, consumer, child) {
                                    return Expanded(
                                        flex: Responsive.isMobile(context)
                                            ? 1
                                            : 2,
                                        child: clientList != null
                                            ? DropDownClientWidget(
                                                title: 'العميل',
                                                hint: 'اختر عميل',
                                                key: UniqueKey(),
                                                selectedItem:
                                                    consumer.clientModel,
                                                onChange: (val) {
                                                  consumer.update(
                                                      clientData: val!);
                                                },
                                                isRequired: true,
                                                list: clientList)
                                            : const SizedBox());
                                  },
                                ),
                                const Expanded(
                                    child: TextFieldWidget(title: 'التاريخ')),
                                const Expanded(
                                    child: TextFieldWidget(title: 'اليوم')),
                              ],
                            ),
                            const Divider(
                                color: ColorManager.grey3, height: AppSize.s12),
                            const Padding(
                              padding: EdgeInsets.only(
                                  top: AppPadding.p8, bottom: AppPadding.p12),
                              child: TextWithGreenBack(text: 'بيانات الشحنة'),
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
                                children: [
                                  Expanded(
                                      child: TextFormBuilder(
                                          controller: provider.code,
                                          enabled: false,
                                          hint: 'كود تاجر الشحنة')),
                                  const Expanded(
                                      child: TextFieldWidget(
                                          title: 'استلام الشحنة بفرع')),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                      child: TextFormBuilder(
                                          controller: provider.name,
                                          isRequired: true,
                                          hint: 'اسم المستلم')),
                                  Expanded(
                                      child: TextFormBuilder(
                                          controller: provider.phoneNumber,
                                          isRequired: true,
                                          hint: 'موبايل')),
                                ],
                              ),
                              Consumer<AddShipmentProvider>(
                                builder: (context, consumer, child) {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                          child: TextFormBuilder(
                                              controller: provider.fromCity,
                                              enabled: false,
                                              hint: 'من مدينة')),
                                      Expanded(
                                          child: cityList != null &&
                                                  areaList != null
                                              ? DropDownDynamicWidget(
                                                  title: 'الي المدينة',
                                                  hint: 'اختر مدينة',
                                                  key: UniqueKey(),
                                                  selectedItem: consumer.toCity,
                                                  onChange: (val) {
                                                    consumer.update(
                                                        toCity: val,
                                                        areaList: areaList);
                                                  },
                                                  isRequired: true,
                                                  list: cityList)
                                              : const SizedBox()),
                                      Expanded(
                                          child: DropDownDynamicWidget(
                                              title: 'المنطقة',
                                              hint: 'اختر منطقة',
                                              key: UniqueKey(),
                                              selectedItem: consumer.toArea,
                                              onChange: (val) {
                                                consumer.update(toArea: val);
                                              },
                                              isRequired: true,
                                              list: consumer.areaList)),
                                    ],
                                  );
                                },
                              ),
                              TextFormBuilder(
                                controller: provider.addressLine,
                                isRequired: true,
                                hint: 'عنوان التسليم',
                                maxLines: 2,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      flex: 3,
                                      child: TextFormBuilder(
                                          controller: provider.content,
                                          isRequired: true,
                                          maxLines: 2,
                                          hint: 'محتوي الشحنة')),
                                  Expanded(
                                      child: TextFormBuilder(
                                          controller: provider.qty,
                                          isRequired: true,
                                          hint: 'الكمية')),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                      child: DropDownWidget(
                                          title: 'شحن علي',
                                          hint: 'اختر',
                                          selectedText: provider.shipmentOn,
                                          onChange: (val) {
                                            provider.update(shipmentOn: '$val');
                                          },
                                          list: const [
                                        'البائع',
                                        'العميل',
                                      ])),
                                  Expanded(
                                      child: TextFormBuilder(
                                          controller: provider.cost,
                                          isRequired: true,
                                          hint: 'قيمه الشحنة')),
                                  Expanded(
                                      child: TextFormBuilder(
                                          controller: provider.shippingCost,
                                          isRequired: true,
                                          hint: 'تكلفة الشحن')),
                                  Expanded(
                                      child: TextFormBuilder(
                                          enabled: false,
                                          controller: provider.totalCost,
                                          hint: 'الاجمالي')),
                                ],
                              ),
                              TextFormBuilder(
                                  controller: provider.info,
                                  hint: 'ملاحظات',
                                  maxLines: 3),
                            ],
                          ),
                        ),
                      ],
                    ),
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
