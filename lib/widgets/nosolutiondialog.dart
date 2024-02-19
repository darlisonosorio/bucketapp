import 'package:bucketapp/constants/texts.dart';
import 'package:flutter/material.dart';

class NoSolutionDialog extends StatelessWidget {
  const NoSolutionDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 73),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      title: const Text(
        Texts.noSolution,
        style: TextStyle(fontSize: 18),
        textAlign: TextAlign.left,
      ),
      actions: [
        Align(
          alignment: Alignment.centerRight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 14,
                    right: 16,
                  ),
                  child: Text(
                    Texts.btnOk.toUpperCase(),
                    style: const TextStyle(fontSize: 15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
