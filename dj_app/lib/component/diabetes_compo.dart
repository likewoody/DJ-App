import 'package:flutter/material.dart';

class DiabetesCompo extends StatelessWidget {
  final String titleName;
  const DiabetesCompo({super.key, required this.titleName});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primaryContainer,
      width: MediaQuery.of(context).size.width,
      child: Text(
        titleName,
        style: const TextStyle(
          fontSize: 23,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}