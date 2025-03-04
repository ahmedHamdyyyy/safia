import 'package:safiaa/features/auth/data/models/register_model.dart';

class GlobalModel {
  RegisterModel? registerModel;
//singleton
  static final GlobalModel _instance = GlobalModel._internal();
  factory GlobalModel() => _instance;

  GlobalModel._internal();

  setRegisterModel(RegisterModel registerModel) {
    this.registerModel = registerModel;
  }

//geter to get the registerModel
  RegisterModel? getRegisterModel() {
    return registerModel;
  }

  //clear the registerModel
  void clearRegisterModel() {
    registerModel = null;
  }
}
