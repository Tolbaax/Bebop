import 'package:bebop/core/utils/assets_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utils/app_color.dart';
import '../buttons/edit_button.dart';

class MyCachedNetImage extends StatelessWidget {
  final String imageUrl;
  final double radius;
  final bool haveButton;

  const MyCachedNetImage({
    Key? key,
    required this.imageUrl,
    required this.radius,
    this.haveButton = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        ClipOval(
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            height: radius.sp * 2,
            width: radius.sp * 2,
            placeholder: (context, url) => _buildPlaceholderWidget(),
            errorWidget: (context, url, error) => _buildErrorWidget(),
            fit: BoxFit.cover,
            fadeOutDuration: const Duration(seconds: 1),
            fadeInDuration: const Duration(seconds: 2),
          ),
        ),
        if (haveButton)
          Positioned(
            bottom: 2.8.sp,
            right: 2.8.sp,
            child: const EditButton(),
          ),
      ],
    );
  }

  Widget _buildPlaceholderWidget() {
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipOval(
          child: Image.asset(ImageAssets.baby1, fit: BoxFit.cover),
        ),
        SpinKitPulse(color: AppColors.primary),
      ],
    );
  }

  Widget _buildErrorWidget() {
    return ClipOval(
      child: Image.asset(ImageAssets.baby1, fit: BoxFit.cover),
    );
  }
}
