import 'package:flutter/material.dart';

class Weathericon extends StatelessWidget {
  const Weathericon(
      {super.key,
      required this.image,
      required this.cond,
      required this.value});
  final String image;
  final String cond;
  final num value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          image,
          width: 30,
        ),
        const SizedBox(
          width: 5,
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: cond,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xff9B9EAD),
                ),
              ),
              const WidgetSpan(
                child: SizedBox(
                  width: 8,
                ),
              ),
              TextSpan(
                text: value.toString(),
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const TextSpan(
                text: '%',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
