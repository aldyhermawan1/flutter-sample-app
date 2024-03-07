import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:sample/values/dimensions.dart';

class BaseTextField extends StatelessWidget {
  final String name;
  final Widget? prefixIcon;
  final String? hintText;
  final String? errorMessage;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final FormFieldValidator<String>? validator;
  final void Function(String?)? onChanged;
  final void Function(String?)? onSaved;
  final void Function(String?)? onSubmitted;
  final void Function()? onReset;
  final void Function()? onEditingComplete;
  final void Function()? onTap;
  final dynamic Function(String?)? valueTransformer;
  final bool enabled;
  final bool readOnly;
  final AutovalidateMode? autoValidateMode;
  final TextEditingController? controller;
  final String? restorationId;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final Widget? suffixIcon;
  final int? minLines;
  final int? maxLines;

  const BaseTextField({
    required this.name,
    super.key,
    this.prefixIcon,
    this.hintText,
    this.keyboardType,
    this.textInputAction,
    this.validator,
    this.onChanged,
    this.onSaved,
    this.onSubmitted,
    this.onReset,
    this.onEditingComplete,
    this.onTap,
    this.valueTransformer,
    this.enabled = true,
    this.readOnly = false,
    this.autoValidateMode,
    this.controller,
    this.restorationId,
    this.inputFormatters,
    this.errorMessage,
    this.focusNode,
    this.suffixIcon,
    this.minLines,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      onSaved: onSaved,
      onReset: onReset,
      autovalidateMode: autoValidateMode,
      controller: controller,
      onEditingComplete: onEditingComplete,
      onSubmitted: onSubmitted,
      inputFormatters: inputFormatters,
      enabled: enabled,
      readOnly: readOnly,
      onChanged: onChanged,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      validator: validator,
      valueTransformer: valueTransformer,
      restorationId: restorationId,
      autocorrect: false,
      onTap: onTap,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      focusNode: focusNode,
      minLines: minLines,
      maxLines: maxLines,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(Dimensions.SIZE16),
        isDense: true,
        prefixIcon: prefixIcon != null
            ? Container(
          margin: const EdgeInsets.only(
            left: Dimensions.SIZE12,
            right: Dimensions.SIZE8,
          ),
          child: prefixIcon,
        )
            : prefixIcon,
        hintText: hintText,
        hintMaxLines: 2,
        errorText: errorMessage,
        suffixIcon: suffixIcon != null
            ? Container(
          margin: const EdgeInsets.only(
            right: Dimensions.SIZE12,
            left: Dimensions.SIZE8,
          ),
          child: suffixIcon,
        )
            : suffixIcon,
      ),
    );
  }
}
