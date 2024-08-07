// ignore_for_file: constant_pattern_never_matches_value_type

import 'package:bams_project/components/App-string.dart';
import 'package:flutter/material.dart';

class TxtField extends StatefulWidget {
  final String label;
  final keyboardType;
  final void Function(String)? onChanged;
  final TextEditingController controller;

  const TxtField({
    super.key,
    required this.label,
    required this.keyboardType,
    required this.onChanged,
    required this.controller,
  });

  @override
  State<TxtField> createState() => _TxtFieldState();
}

class _TxtFieldState extends State<TxtField> {
  // late final String label;
  bool visible = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: TextField(
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        onChanged: (value) {
          widget.onChanged!(value);
        },
        // controller: widget.controller,
        obscureText: visible,
        decoration: InputDecoration(
            label: Text(widget.label),
            hintText: widget.label,
            suffixIcon: TextButton(
                onPressed: () {
                  setState(() {
                    visible = !visible;
                  });
                },
                child: Column(
                  children: [
                    visible
                        ? const Text(AppStrings.show)
                        : const Text(AppStrings.hide)
                  ], //conditional statement for show text toggle
                )),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(7))),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.all(Radius.circular(7)))),
      ),
    );
  }
}

class AppField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final double heigth;
  final Function(String) onChangecallback;
  final keyboardType;
  const AppField(
      {super.key,
      required this.hint,
      required this.heigth,
      required this.controller,
      required this.onChangecallback,
      required this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      onChanged: (value) {
        onChangecallback(value);
      },
      controller: controller,
      decoration: InputDecoration(
          label: Text(hint),
          hintText: hint,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(heigth))),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.blue),
              borderRadius: BorderRadius.all(Radius.circular(heigth)))),
    );
  }
}

class HelperPassword extends StatefulWidget {
  final String helper;
  const HelperPassword({super.key, required this.helper});

  @override
  State<HelperPassword> createState() => _HelperPasswordState();
}

class _HelperPasswordState extends State<HelperPassword> {
  bool visible = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) => value,
      obscureText: visible,
      decoration: InputDecoration(
          helperText: widget.helper,
          label: const Text(AppStrings.password),
          hintText: AppStrings.password,
          suffixIcon: TextButton(
              onPressed: () {
                setState(() {
                  visible = !visible;
                });
              },
              child: Column(
                children: [
                  visible
                      ? const Text(AppStrings.show)
                      : const Text(AppStrings.hide)
                ], //conditional statement for show text toggle
              )),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(7))),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.all(Radius.circular(7)))),
    );
  }
}
