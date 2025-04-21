import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';

///Extends the properties based on image type
extension ImageTypeExtension on String {
  ///This method identifies the image type
  ImageType get imageType {
    if (startsWith('http') || startsWith('https')) {
      return ImageType.network;
    } else if (endsWith('.svg')) {
      return ImageType.svg;
    } else if (startsWith('file://')) {
      return ImageType.file;
    } else {
      return ImageType.png;
    }
  }
}

///Image Type
enum ImageType {
  svg,
  png,
  network,
  file,
  unknown
}

/// A custom image view widget that can display images from various sources.
class CustomImageView extends StatelessWidget {
  /// Creates a [CustomImageView] widget.
  const CustomImageView({
    Key? key,
    required this.imagePath,
    this.width,
    this.height,
    this.color,
    this.fit = BoxFit.cover,
    this.alignment = Alignment.center,
    this.onTap,
    this.radious,
    this.margin,
    this.border,
    this.placeholder = 'assets/images/image_not_found.png',
  }) : super(key: key);

  ///[imagePath] is required parameter for showing image
  final String imagePath;

  /// Declares the width of image
  final double? width;

  /// Declares the height of image
  final double? height;

  /// Declares the color of image
  final Color? color;

  /// The fit of the image
  final BoxFit? fit;

  /// Alignment of the image
  final Alignment? alignment;

  /// Call when image tapped
  final VoidCallback? onTap;

  /// Radious of the image
  final BorderRadius? radious;

  /// The margin around the image
  final EdgeInsetsGeometry? margin;

  /// The border of the image
  final BoxBorder? border;

  /// Place holder while loading image
  final String placeholder;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
      alignment: alignment ?? Alignment.center,
      child: _buildWidget(),
    )
        : _buildWidget();
  }

  /// Build the main widget based on properties
  Widget _buildWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: InkWell(
        onTap: onTap,
        child: _buildCircleImage(),
      ),
    );
  }

  ///build the image with border radius
  Widget _buildCircleImage() {
    if (radious != null) {
      return ClipRRect(
        borderRadius: radious ?? BorderRadius.zero,
        child: _buildImageView(),
      );
    } else {
      return _buildImageView();
    }
  }

  ///Build image with different types of image
  Widget _buildImageView() {
    if (imagePath.isNotEmpty) {
      switch (imagePath.imageType) {
        case ImageType.svg:
          return SizedBox(
            height: height,
            width: width,
            child: SvgPicture.asset(
              imagePath,
              width: width,
              height: height,
              fit: fit ?? BoxFit.contain,
              colorFilter:
              color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
            ),
          );
        case ImageType.file:
          return Image.file(
            File(imagePath),
            width: width,
            height: height,
            fit: fit ?? BoxFit.cover,
            color: color,
          );
        case ImageType.network:
          return CachedNetworkImage(
            height: height,
            width: width,
            fit: fit,
            imageUrl: imagePath,
            color: color,
            placeholder: (context, url) => SizedBox(
              height: 30,
              width: 30,
              child: LinearProgressIndicator(
                color: Colors.grey.shade200,
                backgroundColor: Colors.grey.shade100,
              ),
            ),
            errorWidget: (context, url, error) => Image.asset(
              placeholder,
              width: width,
              height: height,
              fit: fit ?? BoxFit.cover,
            ),
          );
        case ImageType.png:
        default:
          return Image.asset(
            imagePath,
            width: width,
            height: height,
            fit: fit ?? BoxFit.cover,
            color: color,
          );
      }
    }
    return const SizedBox();
  }
}
