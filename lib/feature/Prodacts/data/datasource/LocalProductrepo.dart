import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:store/core/errors/Failure.dart';
import 'package:store/feature/Cart/doman/entites/LocalmodelsCart/modelcart.dart';

abstract class LocalProductrepo {
  Future<Either<Failure, void>> addtocart(Modelcart modelcart);
}

class LocalProductrepoimp extends LocalProductrepo {
  @override
  Future<Either<Failure, void>> addtocart(Modelcart modelcart) async {
    try {
      await Hive.box<Modelcart>('cartitems').add(modelcart);
      return right(());
    } catch (e) {
      return left(ServierError(e.toString()));
    }
  }
}
