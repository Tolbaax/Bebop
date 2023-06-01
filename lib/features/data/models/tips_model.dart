import 'package:bebop/core/utils/app_strings.dart';
import 'package:bebop/core/utils/assets_manager.dart';

class TipsModel {
  final String image;
  final String title;
  final String description;
  final String time;

  const TipsModel({
    required this.image,
    required this.title,
    required this.description,
    required this.time,
  });
}

List<TipsModel> tips = [
  const TipsModel(
    image: ImageAssets.baby6,
    title: AppStrings.tipTitle1,
    description: AppStrings.tipDesc1,
    time: 'Sa 11/6/2023',
  ),
  const TipsModel(
    image: ImageAssets.baby5,
    title: AppStrings.tipTitle2,
    description: AppStrings.tipDesc2,
    time: 'Su 12/5/2023',
  ),
  const TipsModel(
    image: ImageAssets.baby1,
    title: AppStrings.tipTitle3,
    description: AppStrings.tipDesc3,
    time: 'Mon 13/6/2023',
  ),
  const TipsModel(
    image: ImageAssets.baby7,
    title: AppStrings.tipTitle4,
    description: AppStrings.tipDesc4,
    time: 'Tu 14/6/2023',
  ),
];
