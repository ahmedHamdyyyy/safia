import 'package:bloc/bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
import 'package:safiaa/features/orders/data/models/add_order_model.dart';
import 'package:safiaa/features/orders/domain/repositories/add_order_repo.dart';

part 'add_order_state.dart';

class AddOrderCubit extends Cubit<AddOrderState> {
  AddOrderCubit(this.addOrderRepo) : super(AddOrderInitial());

  final AddOrderRepo addOrderRepo;

  Future<void> addOrder(AddOrderModel addOrderModel) async {
    emit(AddOrderLoading());
    var result = await addOrderRepo.addOrder(addOrderModel);
    result.fold((failure) => emit(AddOrderError(failure.message)), (order) {
      emit(AddOrderSuccess(order));
       Fluttertoast.showToast(
          msg: "تمت اضافة الطلب ✅",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );

    });
  }
}
