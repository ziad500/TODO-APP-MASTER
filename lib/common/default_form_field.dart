import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DefaultFormField extends StatelessWidget {
  const DefaultFormField(
      {super.key,
      required this.controller,
      required this.hint,
      this.maxLines = 1,
      this.textInputType = TextInputType.text,
      required this.validator,
      this.suffix,
      this.borderColro,
      this.onChanged,
      this.onEditingComplete,
      this.obscureText = false,
      this.onFieldSubmitted,
      this.maxLength,
      this.onTap,
      this.prefix,
      this.onSuffixTap,
      this.enabled = true,
      this.textColor = Colors.grey,
      this.bottomBorderColor = Colors.transparent,
      this.width = double.infinity,
      this.contentPadding,
      this.inputFormatters,
      this.title,
      this.errorOcure = true});
  final TextEditingController controller;
  final String hint;
  final int? maxLines;
  final double width;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefix;
  final TextInputType textInputType;
  final FormFieldValidator validator;
  final Widget? suffix;
  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final bool obscureText;
  final Color? borderColro;
  final Function(String)? onFieldSubmitted;
  final int? maxLength;
  final void Function()? onTap;
  final void Function()? onSuffixTap;
  final Color textColor;
  final Color bottomBorderColor;
  final EdgeInsetsGeometry? contentPadding;
  final bool enabled;
  final String? title;
  final bool errorOcure;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Text(
            title!,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(
            height: 8,
          )
        ],
        Container(
          width: width,
          decoration: BoxDecoration(border: Border(bottom: BorderSide(color: bottomBorderColor))),
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(color: textColor, fontSize: 16),
            inputFormatters:
                (textInputType == TextInputType.number || textInputType == TextInputType.phone)
                    ? <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ]
                    : inputFormatters,
            keyboardType: textInputType,
            onTapOutside: (event) {
              FocusScope.of(context).unfocus();
            },
            onEditingComplete: () => onEditingComplete ?? FocusScope.of(context).nextFocus(),
            enableSuggestions: true,
            maxLength: maxLength,
            validator: validator,
            obscureText: obscureText,
            controller: controller,
            enabled: enabled,
            onChanged: onChanged,
            onFieldSubmitted: onFieldSubmitted,
            maxLines: maxLines,
            onTap: onTap,
            decoration: InputDecoration(
              counterText: "",
              errorMaxLines: 3,
              isDense: true,
              hintStyle: TextStyle(color: textColor),
              contentPadding: contentPadding ?? const EdgeInsets.symmetric(horizontal: 20),

              suffixIcon: InkWell(onTap: onSuffixTap, child: suffix ?? const SizedBox()),
              hintText: hint,
              prefixIcon: prefix != null
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: prefix,
                    )
                  : null,

              //border party!

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: borderColro ?? Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: borderColro ?? Colors.grey),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: borderColro ?? Colors.grey),
              ),
              errorStyle: TextStyle(color: Colors.red.shade800, fontSize: errorOcure ? 16 : 0),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: borderColro ?? Colors.red),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: borderColro ?? Colors.grey),
              ), /*   hintStyle: StyleManager.greyTextStyle14 */
            ),
          ),
        ),
      ],
    );
  }
}
