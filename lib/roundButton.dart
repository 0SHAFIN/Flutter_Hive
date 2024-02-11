import 'package:flutter/material.dart';

class roundButton extends StatelessWidget {
  String title;
  bool loading;
  final VoidCallback ontap;
  roundButton({
    super.key,
    required this.title,
    required this.ontap,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: Color(0xff7d5fff), borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: loading
              ? const CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 3,
                )
              : Text(title, style: const TextStyle(fontSize: 21)),
        ),
      ),
    );
  }
}
