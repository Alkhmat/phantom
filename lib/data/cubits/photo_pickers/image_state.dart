part of 'image_cubit.dart';

sealed class ImageState {}

final class ImageInitial extends ImageState {}

final class ImageLoaded extends ImageState {
  final String images;

  ImageLoaded(this.images);
}
