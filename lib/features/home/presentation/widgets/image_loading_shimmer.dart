import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ImageFieldLoadingShimmer extends StatelessWidget {
  final double height;

  const ImageFieldLoadingShimmer({super.key, this.height = 100.0});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          width: double.infinity,
          height: 8.0,
          color: Colors.white,
        ),
      ),
    );
  }
}
