import 'dart:io';

import 'package:bebop/features/profile/presentation/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../data/models/memory_model.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileIntialState());

  static ProfileCubit get(context) => BlocProvider.of(context);

  final btnController = RoundedLoadingButtonController();
  final titleController = TextEditingController();
  final timeController = TextEditingController();
  final dateController = TextEditingController();
  final descController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final List<MemoryModel> memory = [];
  final picker = ImagePicker();
  File? memoryImage;

  Future getMemoryImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      memoryImage = File(pickedFile.path);
      // final appDir = await getApplicationDocumentsDirectory();
      // final fileName = path.basename(memoryImage!.path);
      // final saveImage = await memoryImage!.copy('$appDir/$fileName');
      // memoryImage = saveImage;
      emit(MemoryImagePickedSuccess());
    }
  }

  void addMemory() async {
    if (formKey.currentState!.validate()) {
      try {
        memory.add(
          MemoryModel(
            image: 'memoryImage',
            title: titleController.text,
            time: timeController.text,
            date: dateController.text,
            desc: descController.text,
          ),
        );
        btnController.success();
        emit(AddMemorySuccess());
      } catch (e) {
        emit(AddMemoryError());
      }
    } else {
      btnController.error();
      Future.delayed(const Duration(seconds: 1), () {
        btnController.reset();
      });
    }
  }
}
