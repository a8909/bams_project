import 'package:bams_project/models/bankDetails_model.dart';
import 'package:flutter/material.dart';

class BeneficiariesAccount extends StatefulWidget {
  final BenAcc b;
  const BeneficiariesAccount({super.key, required this.b});

  @override
  State<BeneficiariesAccount> createState() => _BeneficiariesAccountState();
}

class _BeneficiariesAccountState extends State<BeneficiariesAccount> {
  bool icR = false;
  iconPress() {
    setState(() {
      icR = !icR;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("This is my present state..");
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 8, 0, 8),
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(7)),
            border: Border.all(color: Colors.black.withOpacity(0.5))),
        child: Row(
          children: [
            IconButton(
                onPressed: iconPress,
                icon: (icR == false)
                    ? const Icon(
                        Icons.circle_outlined,
                      )
                    : const Icon(Icons.check_circle_rounded)),
            Image.asset(
              widget.b.bnkImg,
              width: 50,
              height: 50,
            ),
            //  image should be passed from backend
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [Text(widget.b.tag), Text(widget.b.accNo)],
                ),
                Text(widget.b.accName)
              ],
            )
          ],
        ),
      ),
    );
  }
}
