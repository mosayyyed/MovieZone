import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

import '../../../generated/l10n.dart';
import '../themes/app_styles.dart';
import '../utils/build_input_decoration.dart';

class CustomPhoneField extends StatelessWidget {
  final String labelText;
  final String? hintText;
  final TextEditingController? controller;
  final Function(PhoneNumber)? onChanged;
  final void Function(String)? onSubmitted;
  final FutureOr<String?> Function(PhoneNumber?)? validator;

  const CustomPhoneField({
    super.key,
    required this.labelText,
    this.hintText,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.validator,
  });
  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      disableAutoFillHints: false,
      keyboardType: TextInputType.phone,
      cursorColor: Theme.of(context).colorScheme.primary,
      textAlign: TextAlign.start,
      invalidNumberMessage: S.of(context).phoneNumberInvalidError,
      initialValue: "01",
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      decoration: buildInputDecoration(
          labelText: labelText, hintText: hintText, context: context),
      initialCountryCode: 'EG',
      languageCode: Localizations.localeOf(context).languageCode,
      dropdownTextStyle: Styles.textStyle16,
      pickerDialogStyle: PickerDialogStyle(
        searchFieldPadding: const EdgeInsets.all(10),
        countryCodeStyle: Styles.textStyle14,
        listTileDivider: const Divider(
          indent: 20,
          endIndent: 20,
          color: Colors.transparent,
        ),
        searchFieldCursorColor: Theme.of(context).colorScheme.primary,
        searchFieldInputDecoration: buildInputDecoration(
          labelText: S.of(context).phoneSearchLabel,
          hintText: S.of(context).phoneSearchHint,
          prefixIcon: const Icon(Icons.search_rounded),
          context: context,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      dropdownIcon: Icon(
        Icons.keyboard_arrow_down_rounded,
        color: Theme.of(context).colorScheme.onSurface,
      ),
    );
  }
}
