import 'package:flutter/material.dart';

class Refresh extends StatefulWidget {
  const Refresh({super.key});

  @override
  State<Refresh> createState() => _RefreshState();
}

class _RefreshState extends State<Refresh> {
  bool refresh = false;
  Future _handleRefresh() async {
    setState(() {
      refresh = true;
    });
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _handleRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragDown: (details) {
        if (!refresh) {
          _handleRefresh();
        }
      },
      child: Center(
          child: refresh
              ? const CircularProgressIndicator()
              : const Text("No internet access")),
    );
  }
}
