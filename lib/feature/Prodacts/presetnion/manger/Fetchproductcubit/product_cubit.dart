import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store/feature/Prodacts/doman/entites/podact_model.dart';
import 'package:store/feature/Prodacts/doman/usecse/Porductusecases.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.uscase) : super(ProductInitial());
  Productusecase uscase;
  getlist() async {
    emit(Productlodaing());
    var res = await uscase.prodactlist();
    res.fold(
        (l) => emit(ProductError(l.messege)), (r) => emit(ProductSucsses(r)));
  }

  additemlist() {
    emit(Productlistviewlodaing());
  }

  @override
  void onChange(Change<ProductState> change) {
    // TODO: implement onChange
    super.onChange(change);
    print(change);
  }
}
