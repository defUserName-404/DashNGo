import 'package:flutter/material.dart';

import '../../../../util/theme/colors.dart';

class LocationSearchingWidget extends StatelessWidget {
  final String imageAssetPath;
  final String hintText;
  final TextEditingController? controller;

  const LocationSearchingWidget({
    super.key,
    required this.imageAssetPath,
    required this.hintText,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(imageAssetPath, height: 16, width: 16),
        SizedBox(width: 8.0),
        Expanded(
          child: TextField(
            controller: controller!,
            style: TextStyle(color: AppColors.colorTextDark),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: AppColors.colorTextSemiLight),
              filled: true,
              fillColor: AppColors.colorTextLight,
            ),
          ),
        ),
      ],
    );
  }
}
