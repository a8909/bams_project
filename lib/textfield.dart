// ignore_for_file: constant_pattern_never_matches_value_type

import 'package:bams_project/App-string.dart';
import 'package:flutter/material.dart';

class TxtField extends StatefulWidget {
  final String label;

  const TxtField({
    super.key,
    required this.label,
  });

  @override
  State<TxtField> createState() => _TxtFieldState();
}

class _TxtFieldState extends State<TxtField> {
  // late final String label;
  bool visible = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
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
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.all(Radius.circular(7)))),
    );
  }
}

class AppField extends StatelessWidget {
  final String hint;
  final double heigth;
  const AppField({super.key, required this.hint, required this.heigth});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          label: Text(hint),
          hintText: hint,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(heigth))),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
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

// enum Accounts { own, others }

class SwitchAccount extends StatefulWidget {
  bool accountType = true;
  SwitchAccount({super.key, required this.accountType});

  @override
  State<SwitchAccount> createState() => _SwitchAccountState();
}

class _SwitchAccountState extends State<SwitchAccount> {
  bool accounts = true;
  void changeAccount() {
    setState(() {
      accounts = !accounts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              changeAccount();
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                color: Colors.white.withOpacity(0.5),
                width: 100,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(AppStrings.ownaccount),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 40,
          ),
          GestureDetector(
            onTap: () {
              changeAccount();
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: 100,
                color: Colors.white.withOpacity(0.5),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(AppStrings.otheraccount),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
