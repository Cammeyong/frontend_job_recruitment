import 'package:flutter/material.dart';

class CustomPaginator extends StatefulWidget {
  const CustomPaginator({super.key});

  @override
  State<CustomPaginator> createState() => _CustomPaginatorState();
}

class _CustomPaginatorState extends State<CustomPaginator> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const TextButton(onPressed: null, child: Text("Previous")),
          TextButton(onPressed: () {}, child: const Text("1")),
          TextButton(onPressed: () {}, child: const Text("2")),
          TextButton(onPressed: () {}, child: const Text("Next")),
        ],
      ),
    );
  }
}
