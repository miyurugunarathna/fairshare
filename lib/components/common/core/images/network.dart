import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fairshare/components/common/core/skeleton.dart';

class CustomNetworkImage extends StatelessWidget {
  final String? url;
  final double? width;
  final double? height;
  final double? size;
  final BoxShape? shape;
  final BorderRadius? radius;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onPressed;
  final Widget? placeholder;
  final Widget? errorWidget;
  final BoxFit? fit;
  final Function? onImageLoad;

  const CustomNetworkImage({
    super.key,
    this.url,
    this.width,
    this.height,
    this.size,
    this.shape,
    this.radius,
    this.margin,
    this.onPressed,
    this.placeholder,
    this.errorWidget,
    this.fit,
    this.onImageLoad,
  });

  @override
  Widget build(BuildContext context) {
    final skeleton = Skeleton(height: height ?? size, width: width ?? size, radius: radius ?? BorderRadius.circular(12), shape: shape, margin: margin);
    return CachedNetworkImage(
      imageUrl: url ?? "",
      placeholder: (context, url) => placeholder ?? skeleton,
      errorWidget: (context, url, error) => errorWidget ?? placeholder ?? skeleton,
      imageBuilder: (context, imageProvider) {
        if (onImageLoad != null) {
          onImageLoad!(imageProvider);
        }
        return GestureDetector(
          onTap: () {
            if (onPressed != null) onPressed!();
          },
          child: Container(
            height: height ?? size,
            width: width ?? size,
            margin: margin ?? EdgeInsets.zero,
            decoration: BoxDecoration(
              shape: shape ?? BoxShape.rectangle,
              borderRadius: shape == null ? radius ?? BorderRadius.circular(12) : null,
              image: DecorationImage(image: imageProvider, fit: fit ?? BoxFit.cover),
            ),
          ),
        );
      },
    );
  }
}
