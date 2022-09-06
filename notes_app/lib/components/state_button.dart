import 'package:flutter/material.dart';

class StatefullButton extends StatefulWidget {
  const StatefullButton({super.key});

  @override
  State<StatefullButton> createState() => _StatefullButtonState();
}

class _StatefullButtonState extends State<StatefullButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: null,
    );
  }
}
