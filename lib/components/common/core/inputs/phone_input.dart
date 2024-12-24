import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fairshare/components/common/core/core.dart';
import 'package:fairshare/config/themes/themes.dart';
import 'package:fairshare/state/global/global_bloc.dart';

class PhoneInput extends StatefulWidget {
  final String? value;
  final TextEditingController? controller;
  final String placeholder;
  final String? hint;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool showFlags;
  final bool ignoreBlank;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final Function(PhoneNumber)? onChange;
  final bool readOnly;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final String? Function(String?)? validator;

  const PhoneInput({
    super.key,
    this.controller,
    required this.placeholder,
    this.hint,
    this.value,
    this.prefixIcon,
    this.suffixIcon,
    this.showFlags = true,
    this.ignoreBlank = false,
    this.padding,
    this.onChange,
    this.borderRadius,
    this.readOnly = false,
    this.floatingLabelBehavior,
    this.validator,
  });

  @override
  State<PhoneInput> createState() => _PhoneInputState();
}

class _PhoneInputState extends State<PhoneInput> {
  Future<PhoneNumber>? _phoneNumberFuture;

  @override
  void initState() {
    _phoneNumberFuture = getPhoneNumber();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant PhoneInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value && widget.value != null && widget.value!.isNotEmpty) {
      PhoneNumber.getRegionInfoFromPhoneNumber(widget.value!).then((value) {
        if (value.phoneNumber != null) {
          setState(() {
            _phoneNumberFuture = Future.value(value);
          });
        }
      }).catchError((e) {});
    }
  }

  Future<PhoneNumber> getPhoneNumber() {
    return widget.value == null || widget.value!.isEmpty
        ? Future.value(PhoneNumber(isoCode: 'AE', phoneNumber: widget.value!, dialCode: '+971'))
        : PhoneNumber.getRegionInfoFromPhoneNumber(widget.value!);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PhoneNumber>(
        future: _phoneNumberFuture,
        builder: (context, snapshot) {
          return InternationalPhoneNumberInput(
            onInputChanged: widget.onChange,
            selectorConfig: SelectorConfig(
              selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
              setSelectorButtonAsPrefixIcon: true,
              leadingPadding: 14,
              trailingSpace: false,
              showFlags: widget.showFlags,
            ),
            ignoreBlank: widget.ignoreBlank,
            autoValidateMode: AutovalidateMode.disabled,
            selectorTextStyle: Theme.of(context).textTheme.bodyLarge,
            initialValue: snapshot.data,
            textFieldController: widget.controller,
            formatInput: true,
            keyboardType: const TextInputType.numberWithOptions(signed: true, decimal: true),
            inputDecoration: inputDecoration.copyWith(
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.suffixIcon,
              labelText: widget.placeholder,
              labelStyle: Theme.of(context).textTheme.bodyLargePlaceholder,
              hintText: widget.hint ?? widget.placeholder,
              hintStyle: Theme.of(context).textTheme.bodyLargePlaceholder,
              fillColor: AppColors.inputBackground,
              filled: !widget.readOnly,
              contentPadding: widget.padding ?? EdgeInsets.symmetric(horizontal: widget.readOnly ? 15 : 10, vertical: widget.readOnly ? 2 : 10),
              enabled: !widget.readOnly,
              floatingLabelBehavior: widget.floatingLabelBehavior ?? (widget.readOnly ? FloatingLabelBehavior.always : FloatingLabelBehavior.never),
              floatingLabelStyle: Theme.of(context).textTheme.bodyLargePlaceholder.copyWith(fontSize: 17),
            ),
            searchBoxDecoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 8),
              hintStyle: Theme.of(context).textTheme.bodyLargePlaceholder,
              hintText: AppLocalizations.of(context)!.searchByCountryNameOrDialCode,
            ),
            textStyle: Theme.of(context).textTheme.bodyLarge,
            validator: widget.validator,
            isEnabled: !widget.readOnly,
            locale: context.read<GlobalBloc>().state.locale,
          );
        });
  }
}
