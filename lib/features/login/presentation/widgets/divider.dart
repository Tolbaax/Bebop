import 'package:flutter/material.dart';

class DividerLine extends StatelessWidget {
  const DividerLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Expanded(
            child: Divider(
          thickness: 1,
          indent: 40,
          endIndent: 12,
        )),
        Text(
          "OR",
          style: TextStyle(fontSize: 18.0, color: Colors.grey),
        ),
        Expanded(
            child: Divider(
          thickness: 1,
          endIndent: 40,
          indent: 12,
        )),
      ],
    );
  }
}
