import 'package:hive/hive.dart';
import 'package:store/feature/Cart/doman/entites/LocalmodelsCart/modelcart.dart';

abstract class CartRepo {
  Box<Modelcart> getcartitems();
}
