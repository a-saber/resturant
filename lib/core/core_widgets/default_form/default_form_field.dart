import 'package:flutter/material.dart';
import 'package:restaurant/core/resources_manager/colors_manager.dart';
import 'package:restaurant/core/resources_manager/size_manager.dart';
import 'package:restaurant/core/resources_manager/style_manager.dart';

class DefaultFormField extends StatelessWidget {
  const DefaultFormField({
    super.key,
    this.enabled = true,
    required this.controller,
    this.suffixIcon,
    this.textInputType = TextInputType.text,
    this.isPassword = false,
    this.onChange,
    this.validator,
    this.maxLines = 1,
  });

  final int maxLines;
  final bool enabled;
  final bool? isPassword;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final TextInputType textInputType;
  final void Function(String)? onChange;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator ??
              (value) {
        if (value!.isEmpty) {
          return 'لا يجب ان يكون فارغا';
        }
        return null;
      },
      keyboardType: textInputType,
      controller: controller,
      onChanged: onChange,
      style: StyleManager.textStyleDark24,
      obscureText: isPassword!,
      obscuringCharacter: '●',
      cursorColor: ColorsManager.primary,
      enabled: enabled,
      decoration: InputDecoration(
        suffixIcon: Padding(
          padding: const EdgeInsetsDirectional.only(end: 5.0),
          child: suffixIcon,
        ),
          errorStyle: StyleManager.textStyleDark24.copyWith(color: ColorsManager.red),
          filled: true,
          fillColor: ColorsManager.secondary,
          contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderManager.fromFieldBorderRadius,
            borderSide: const BorderSide(color: ColorsManager.secondary)
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderManager.fromFieldBorderRadius,
              borderSide: const BorderSide(
                color:  ColorsManager.primary,
              )
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderManager.fromFieldBorderRadius,
              borderSide: const BorderSide(
                color:  ColorsManager.red,
              )
          ),
          errorBorder:  OutlineInputBorder(
              borderRadius: BorderManager.fromFieldBorderRadius,
              borderSide: const BorderSide(
                color:  ColorsManager.red,
              )
          ),
      ),
    );
  }
}

