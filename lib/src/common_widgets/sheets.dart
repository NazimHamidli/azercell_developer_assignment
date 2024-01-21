import 'package:azercell_developer_assignment/src/app.dart';
import 'package:flutter/material.dart';

class Sheets {
  Sheets._();
  static void showCardDeleteSheet({
    required void Function() onClick,
  }) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16))),
      isScrollControlled: true,
      barrierColor: Colors.black.withOpacity(.5),
      context: navigatorKey.currentContext!,
      backgroundColor: const Color(0xffDED4F4),
      builder: (BuildContext context) {
        return Container(
          height: 270,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: const Color(0xffDED4F4),
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Center(
                child: Container(
                  width: 80.0,
                  height: 6.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14.0),
                    color: Colors.grey.shade400,
                  ),
                ),
              ),
              TextButton(
                  onPressed: onClick,
                  child: const Text(
                    "What is your reason to delete card?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600),
                  )),
              const SizedBox(
                height: 24,
              ),
              TextButton(
                  onPressed: onClick,
                  child: const Text(
                    "Changed my opinion",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
                  )),
              const SizedBox(
                height: 8,
              ),
              const Divider(
                height: 1,
              ),
              const SizedBox(
                height: 8,
              ),
              TextButton(
                  onPressed: onClick,
                  child: const Text(
                    "Financial problems",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
                  )),
            ],
          ),
        );
      },
    );
  }
}
