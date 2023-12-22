import 'package:hive/hive.dart';
import 'package:store/feature/Cart/doman/entites/LocalmodelsCart/modelcart.dart';
import 'package:store/feature/Cart/doman/repo/CartRepo.dart';

class LocalCartRepoimp extends CartRepo {
  @override
  Box<Modelcart> getcartitems() {
    var models = Hive.box<Modelcart>('cartitems');
    return models;
  }
}
