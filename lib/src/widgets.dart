import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header(this.heading, {super.key});
  final String heading;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          heading,
          style: TextStyle(
              fontSize: 24, color: Color.fromARGB(255, 204, 192, 156)),
        ),
      );
}

class Paragraph extends StatelessWidget {
  const Paragraph(this.content, {super.key});
  final String content;
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Text(
          content,
          style: TextStyle(
              fontSize: 18, color: Color.fromARGB(255, 204, 192, 156)),
        ),
      );
}

class IconAndDetail extends StatelessWidget {
  const IconAndDetail(this.icon, this.detail, {super.key});
  final IconData icon;
  final String detail;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(
              icon,
              color: Color.fromARGB(255, 204, 192, 156),
            ),
            const SizedBox(width: 8),
            Text(
              detail,
              style: const TextStyle(
                  fontSize: 18, color: Color.fromARGB(255, 204, 192, 156)),
            )
          ],
        ),
      );
}

class StyledButton extends StatelessWidget {
  const StyledButton({required this.child, required this.onPressed, super.key});
  final Widget child;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) => OutlinedButton(
        style: OutlinedButton.styleFrom(
            foregroundColor: Color.fromARGB(255, 219, 201, 250),
            textStyle: TextStyle(fontSize: 16),
            side: const BorderSide(color: Color.fromARGB(255, 219, 201, 250))),
        onPressed: onPressed,
        child: child,
      );
}
