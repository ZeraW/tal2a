import 'package:flutter/material.dart';
import 'package:tal2a/presentation/resources/color_manager.dart';
import 'package:tal2a/presentation/resources/values_manager.dart';
import '../resources/styles_manager.dart';


class TextFieldWidget extends StatelessWidget {
  final String title;
  final String? hint;
  final int? maxLines;
  final double width;
  final TextEditingController? controller ;
  const TextFieldWidget({Key? key,required this.title, this.maxLines = 1,required this.width, this.controller, this.hint}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,style: getSemiBoldStyle(color: ColorManager.grey1)),
          const SizedBox(height: AppSize.s6,),
          SizedBox(
            width: width,
            child: TextField(
              controller: controller,
              maxLines: maxLines,
              minLines: 1,
              textAlign: TextAlign.start,
              decoration: InputDecoration(hintText: hint),
            ),
          ),
        ],
      ),
    );
  }
}
