import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomLoading extends StatefulWidget {
  const CustomLoading({super.key});

  @override
  State<CustomLoading> createState() => _CustomLoadingState();
}

class _CustomLoadingState extends State<CustomLoading> {
  @override
  Widget build(BuildContext context) {
    return Lottie.asset('assets/lottie/loading.json', width: 100);
  }
}
