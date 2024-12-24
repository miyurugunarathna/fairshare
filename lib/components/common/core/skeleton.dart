import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:fairshare/config/themes/colors.dart';

class Skeleton extends StatelessWidget {
  final double? height;
  final double? width;
  final double? size;
  final BorderRadiusGeometry? radius;
  final EdgeInsetsGeometry? margin;
  final BoxShape? shape;
  final Widget? child;

  const Skeleton({super.key, this.height, this.width, this.size, this.radius, this.margin, this.shape, this.child});

  @override
  Widget build(BuildContext context) {
    final container = Container(
      height: height ?? size,
      width: width ?? size,
      margin: margin ?? EdgeInsets.zero,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: shape ?? BoxShape.rectangle,
        borderRadius: shape == null ? radius ?? BorderRadius.circular(8) : null,
      ),
    );
    return Shimmer.fromColors(
      baseColor: AppColors.skeletonBase,
      highlightColor: AppColors.skeletonHighlight,
      child: child ?? container,
    );
  }
}
