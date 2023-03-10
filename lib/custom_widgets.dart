import 'package:flutter/material.dart';

class HeadingText extends StatelessWidget {
  final String? text;
  const HeadingText({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
        text!,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class TitleText extends StatelessWidget {
  final String? text;
  const TitleText({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: const TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class SubtitleText extends StatelessWidget {
  final String? text;
  final Color? color;
  const SubtitleText({Key? key, this.text, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.normal,
        color: color ?? Colors.black,
      ),
    );
  }
}

class RegularText extends StatelessWidget {
  final String? text;
  final double? fontSize;
  const RegularText({Key? key, this.text, this.fontSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
        fontSize: fontSize ?? 13,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class RedText extends StatelessWidget {
  final String? text;
  final double? fontSize;
  const RedText({Key? key, this.text, this.fontSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
        fontSize: fontSize ?? 13,
        fontWeight: FontWeight.w500,
        color: Colors.red,
      ),
    );
  }
}

class GreenText extends StatelessWidget {
  final String? text;
  final double? fontSize;
  const GreenText({Key? key, this.text, this.fontSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
        fontSize: fontSize ?? 13,
        fontWeight: FontWeight.w500,
        color: Colors.green,
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  final Widget? child;
  const CustomContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(2, 3),
          ),
        ],
      ),
      child: child,
    );
  }
}


