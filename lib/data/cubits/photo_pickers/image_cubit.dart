import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'image_state.dart';

class ImageCubit extends Cubit<ImageState> {
  ImageCubit() : super(ImageInitial());
  final picker = ImagePicker();
  Future<void> pickerPhoto() async {
    try {
      final imageData = await picker.pickImage(source: ImageSource.gallery);
      if (imageData != null) {
        emit(ImageLoaded(imageData.path));
      }
    } catch (e) {}
  }

  void reset() {
    emit(ImageInitial());
  }
}
