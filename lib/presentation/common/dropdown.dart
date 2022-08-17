import 'package:flutter/material.dart';
import 'package:tal2a/presentation/models/models.dart';
import 'package:tal2a/presentation/resources/color_manager.dart';
import 'package:tal2a/presentation/resources/values_manager.dart';
import '../resources/styles_manager.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class DropDownWidget extends StatelessWidget {
  final String title;
  final String? hint,selectedText;
  final double? width;
  final bool? isRequired;
  final String? errorText;
  final List<String> list;
  final Function(String?)? onChange;

  const DropDownWidget(
      {Key? key,
      required this.title,
      this.width = double.infinity,
      this.hint,
      this.isRequired = true,
      this.errorText = 'هذا الحقل مطلوب',required this.list, this.selectedText,  this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style:getBoldStyle(color: ColorManager.grey),
              ),
              const Spacer(),
              isRequired!
                  ? const Text(
                'مطلوب',
                style: TextStyle(
                    color: Colors.black38,
                    fontSize: 10,
                    fontWeight: FontWeight.bold),
              )
                  :const SizedBox(),
            ],
          ),
          const SizedBox(
            height: AppSize.s8,
          ),
          SizedBox(
            width: width,
            child: FormBuilderDropdown(
              name: title,
              key: key,
              decoration: InputDecoration(hintText: hint),
              onChanged: onChange,

              // initialValue: 'Male',
             // allowClear: isRequired!? false :true,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              dropdownColor: Colors.white,
              focusColor: Colors.transparent,
              menuMaxHeight: 200,
              validator: isRequired!
                  ? (value) {
                      if (value == null) {
                        return "× $errorText";
                      }
                      return null;
                    } : null,
              items: list.map((val) => DropdownMenuItem(
                        value: val,
                        child: Text(
                          val,
                        ),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
class DropDownDynamicWidget extends StatelessWidget {
  final String title;
  final String? hint;
  final double? width;
  final Function(dynamic) onChange;
  final dynamic selectedItem;

  final bool? isRequired;
  final String? errorText;
  final List<dynamic> list;

  const DropDownDynamicWidget(
      {Key? key,
        required this.title,
        this.width = double.infinity,
        this.hint,
        this.isRequired = true,
        this.errorText = 'هذا الحقل مطلوب',required this.list, required this.onChange, this.selectedItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style:getBoldStyle(color: ColorManager.grey),
              ),
              const Spacer(),
              isRequired!
                  ? const Text(
                'مطلوب',
                style: TextStyle(
                    color: Colors.black38,
                    fontSize: 10,
                    fontWeight: FontWeight.bold),
              )
                  :const SizedBox(),
            ],
          ),
          const SizedBox(
            height: AppSize.s8,
          ),
          SizedBox(
            width: width,
            child: FormBuilderDropdown(
              key: key,
              name: title,
              hint: Text(selectedItem != null ? selectedItem.id : hint),
              // initialValue: 'Male',
              // allowClear: true,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              dropdownColor: Colors.white,
              focusColor: Colors.transparent,
              menuMaxHeight: 200,
              onChanged: onChange,
              validator: isRequired!
                  ? (value) {
                if (selectedItem == null) {
                  return "× $errorText";
                }
                return null;
              } : null,
              items: list.map((val) => DropdownMenuItem(value: val, child: Text(val.id))).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class DropDownClientWidget extends StatelessWidget {
  final String title;
  final String? hint;
  final double? width;
  final Function(ClientModel?) onChange;
  final ClientModel? selectedItem;

  final bool? isRequired;
  final String? errorText;
  final List<ClientModel> list;

  const DropDownClientWidget(
      {Key? key,
        required this.title,
        this.width = double.infinity,
        this.hint,
        this.isRequired = true,
        this.errorText = 'هذا الحقل مطلوب',required this.list, required this.onChange, this.selectedItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style:getBoldStyle(color: ColorManager.grey),
              ),
              const Spacer(),
              isRequired!
                  ? const Text(
                'مطلوب',
                style: TextStyle(
                    color: Colors.black38,
                    fontSize: 10,
                    fontWeight: FontWeight.bold),
              )
                  :const SizedBox(),
            ],
          ),
          const SizedBox(
            height: AppSize.s8,
          ),
          SizedBox(
            width: width,
            child: FormBuilderDropdown(
              key: key,
              name: title,
              hint: Text('${selectedItem != null ? selectedItem?.name : hint}'),
              // initialValue: 'Male',
              // allowClear: true,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              dropdownColor: Colors.white,
              focusColor: Colors.transparent,
              menuMaxHeight: 200,
              onChanged: onChange,
              validator: isRequired!
                  ? (value) {
                if (selectedItem == null) {
                  return "× $errorText";
                }
                return null;
              } : null,
              items: list.map((val) => DropdownMenuItem(value: val, child: Text(val.name!))).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
