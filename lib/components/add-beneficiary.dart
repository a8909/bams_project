import 'package:flutter/material.dart';

class Benf extends StatefulWidget {
  final TextEditingController contForm;

  final TextEditingController contForm2;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  const Benf(
      {super.key,
      required this.contForm,
      required this.contForm2,
      required this.onTap,
      required this.onChanged});

  @override
  State<Benf> createState() => _BenfState();
}

class _BenfState extends State<Benf> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 150,
          width: 300,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black.withOpacity(0.5))),
          margin: const EdgeInsets.fromLTRB(5, 10, 5, 10),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: widget.contForm,
                  decoration: const InputDecoration(
                      hintText: "Enter Acoount Number",
                      suffixIcon: Icon(Icons.keyboard_arrow_down_outlined)),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: widget.contForm2,
                  onChanged: (value) {
                    widget.onChanged!(value);
                  },
                  decoration: const InputDecoration(
                      hintText: "Enter Amount",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(7))),
                      focusedBorder: OutlineInputBorder(
                          // borderSide: const BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(7)))),
                )
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: widget.onTap,
          child: const Icon(Icons.disabled_by_default_outlined),
        )
      ],
    );
  }
}
