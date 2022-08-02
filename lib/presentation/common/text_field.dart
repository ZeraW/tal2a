// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:tal2a/presentation/resources/color_manager.dart';
import 'package:tal2a/presentation/resources/values_manager.dart';
import '../resources/styles_manager.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:tal2a/presentation/resources/styles_manager.dart';
class TextFieldWidget extends StatelessWidget {
  final String title;
  final String? hint;
  final int? maxLines;
  final double? width;
  final TextEditingController? controller;

  const TextFieldWidget(
      {Key? key,
      required this.title,
      this.maxLines = 1,
       this.width=double.infinity,
      this.controller,
      this.hint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: getSemiBoldStyle(color: ColorManager.grey1)),
          const SizedBox(
            height: AppSize.s6,
          ),
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



class TextFormBuilder extends StatefulWidget {
  final String hint;
  final TextInputType? keyType;
  final bool isPassword, enabled, isRequired;

  final TextEditingController controller;
  final String errorText;
  final int? maxLength, maxLines;
  final Color? activeBorderColor;
  final FocusNode? focusNode;

  const TextFormBuilder(
      {required this.hint,
        this.keyType,
        this.isPassword = false,
        required this.controller,
        this.focusNode,
        required this.errorText,
        this.maxLines = 1,
        this.maxLength,
        this.enabled = true,
        this.isRequired = false,
        this.activeBorderColor ,Key? key}): super(key: key);

  @override
  _TextFormBuilderState createState() => _TextFormBuilderState();
}

class _TextFormBuilderState extends State<TextFormBuilder> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              widget.hint,
              style:getBoldStyle(color: ColorManager.grey),
            ),
            const Spacer(),
            widget.isRequired
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
          height: 8,
        ),
        FormBuilderTextField(
          focusNode: widget.focusNode,
          autovalidateMode: widget.isRequired
              ? AutovalidateMode.onUserInteraction
              : AutovalidateMode.disabled,
          name: widget.hint,
          maxLength: widget.maxLength,
          controller: widget.controller,
          cursorColor: widget.activeBorderColor ??Colors.indigoAccent,
          style: getBoldStyle(color: ColorManager.grey),
          validator: widget.isRequired
              ? (value) {
            if (value!.isEmpty) {
              return "× ${widget.errorText}";
            }
            return null;
          }
              : null,
          enabled: widget.enabled,
          maxLines: widget.maxLines,
          textInputAction: TextInputAction.next,

          //onChanged: onChange,
          keyboardType:
          widget.keyType ?? TextInputType.text,
          obscureText: widget.isPassword,
        ),
      ],
    );
  }
}

class LoginTextFormBuilder extends StatefulWidget {
  final String hint;
  final TextInputType? keyType;
  final bool isPassword, enabled;

  final TextEditingController controller;
  final int? maxLength, maxLines;
  final Color? activeBorderColor;
  final FocusNode? focusNode;
  final FormFieldValidator<String>? validator;

  const LoginTextFormBuilder(
      {required this.hint,
        this.keyType,
        this.isPassword = false,
        required this.controller,
        this.focusNode,
        this.maxLines = 1,
        this.validator,
        this.maxLength,
        this.enabled = true,
        this.activeBorderColor,Key? key}): super(key: key);

  @override
  _LoginTextFormBuilderState createState() => _LoginTextFormBuilderState();
}

class _LoginTextFormBuilderState extends State<LoginTextFormBuilder> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.hint,
          style:getBoldStyle(color: ColorManager.grey),
        ),
        const SizedBox(
          height: 8,
        ),
        FormBuilderTextField(
          focusNode: widget.focusNode,
          name: widget.hint,
          maxLength: widget.maxLength,
          controller: widget.controller,
          style: getBoldStyle(color: ColorManager.grey),
          validator: widget.validator,
          enabled: widget.enabled,
          maxLines: widget.maxLines,
          textInputAction: TextInputAction.next,

          //onChanged: onChange,
          keyboardType:
          widget.keyType ?? TextInputType.text,
          obscureText: widget.isPassword,
        ),
      ],
    );
  }
}
