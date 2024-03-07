import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../values/vectors.dart';

class NetworkImageLoader extends StatelessWidget {
  const NetworkImageLoader({
    required this.imageUrl,
    super.key,
    this.placeHolder,
    this.errorWidget,
    this.loadingBuilder,
    this.imageBuilder,
    this.fit = BoxFit.contain,
    this.size,
  });

  final String imageUrl;
  final PlaceholderWidgetBuilder? placeHolder;
  final LoadingErrorWidgetBuilder? errorWidget;
  final ProgressIndicatorBuilder? loadingBuilder;
  final ImageWidgetBuilder? imageBuilder;
  final BoxFit fit;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: imageBuilder,
      placeholder: placeHolder,
      errorWidget: errorWidget ?? _defaultError,
      progressIndicatorBuilder: loadingBuilder,
      filterQuality: FilterQuality.medium,
      fit: fit,
      width: size,
      height: size,
    );
  }

  Widget _defaultError(context, url, error) {
    return SvgPicture.asset(
      Vectors.icBrokenImage,
    );
  }
}
