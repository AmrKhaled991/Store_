import 'package:bloc/bloc.dart';
import 'package:store/feature/Home/doman/entites/Categoremodel.dart';
import 'package:store/feature/Home/doman/entites/brandmodel.dart';
import 'package:store/feature/Home/doman/uscases/CatUsecases.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.catUsecases) : super(HomeInitial());
  CatUsecases catUsecases;
  categories() async {
    emit(HomeCatLoading());
    var res = await catUsecases.Categories();

    res.fold((l) => emit(HomeCatError(l.messege)),
        (r) => emit(HomeCategoriesSucsses(r)));
  }

  @override
  void onChange(Change<HomeState> change) {
    // TODO: implement onChange
    super.onChange(change);
    print(change);
  }
}

class BrandCubit extends Cubit<HomeState> {
  BrandCubit(this.catUsecases) : super(HomeInitial());
  CatUsecases catUsecases;
  brands() async {
    emit(HomeBrandLoading());
    var res = await catUsecases.brands();
    res.fold((l) => emit(HomeBrandError(l.messege)),
        (r) => emit(HomeBrandsSucsses(r)));
  }

  @override
  void onChange(Change<HomeState> change) {
    // TODO: implement onChange
    super.onChange(change);
    print(change);
  }
}
