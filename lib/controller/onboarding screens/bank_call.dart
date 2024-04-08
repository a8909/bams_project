import 'package:bams_project/home.dart';
import 'package:flutter/material.dart';

class BankObject {
  String name;
  BankObject({required this.name});
}

class Views extends StatefulWidget {
  final String bankName;
  final String bankImage;
  final BankObject bankobj;
  const Views(
      {super.key,
      required this.bankName,
      required this.bankImage,
      required this.bankobj});

  @override
  State<Views> createState() => _ViewsState();
}

class _ViewsState extends State<Views> {
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        final controller = TextEditingController();

        return Container(
          child: Column(
            children: [
              TextFormField(
                // onEditingComplete: () =>  ,
                onChanged: (value) => widget.bankobj.name = value,
                onSaved: (newValue) => widget.bankobj.name == newValue,
                controller: controller,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7))),
                    hintText: "Enter account number",
                    labelText: "Enter account number"),
              ),
              const SizedBox(height: 10),
              container(widget.bankName, widget.bankImage),
            ],
          ),
        );
      },
    );
  }
}
