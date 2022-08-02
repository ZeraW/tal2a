import 'package:flutter/material.dart';
import 'package:tal2a/presentation/resources/color_manager.dart';
import 'package:tal2a/presentation/resources/values_manager.dart';
import '../resources/responsive.dart';
import '../resources/styles_manager.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class DropDownWidget extends StatelessWidget {
  final String title;
  final String? hint;
  final double? width;
  final bool? isRequired;
  final String? errorText;
  final List<String> list;

  const DropDownWidget(
      {Key? key,
      required this.title,
      this.width = double.infinity,
      this.hint,
      this.isRequired = true,
      this.errorText = 'هذا الحقل مطلوب',required this.list})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
            decoration: InputDecoration(hintText: hint),

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
    );
  }
}
