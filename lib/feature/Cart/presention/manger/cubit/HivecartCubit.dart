// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:bloc/bloc.dart';


import 'package:hive/hive.dart';


import 'package:meta/meta.dart';


import 'package:store/feature/Cart/doman/entites/LocalmodelsCart/modelcart.dart';


part 'HivecartState.dart';


class HivecartCubit extends Cubit<HiveCartState> {

  Box<Modelcart> models;


  HivecartCubit(

    this.models,

  ) : super(HiveCartInitial());


  addtocart({required Modelcart modelcart, int? numberofproduct}) async {

    emit(HiveCartloading());


    try {

      var list = models.values.toList();


      int? indx =

          list.indexWhere((element) => (modelcart.image == element.image));


      indx < 0

          ? await models.add(modelcart).then((value) {

              print('==$numberofproduct');


              numberofproduct == null

                  ? emit(HiveCartADD())

                  : emit(HiveAddporductlist(index: numberofproduct));

            })

          : addtoitem(
              index: indx,
              qunttay: modelcart.quntity,
              numberofproduct: numberofproduct);

    } catch (e) {

      emit(HiveCartError(e.toString()));

    }

  }


  addtoitem({required int index, int? qunttay, int? numberofproduct}) async {

    Modelcart model = models.getAt(index)!;


    if (model.quntity! < 9) {

      if (qunttay != null) {

        int number = model.quntity! + qunttay;


        number < 9 ? model.quntity = number : model.quntity = 9;

      } else {

        model.quntity = (model.quntity! + 1);

      }

    }


    await models.putAt(index, model);


    emit(HiveAddporductlist(index: numberofproduct));

  }


  removefromitem(int index) async {

    Modelcart model = models.getAt(index)!;


    if (model.quntity! > 1) {

      model.quntity = (model.quntity! - 1);

    }


    await models.putAt(index, model);


    emit(HiveCartRemove());

  }


  delteitem(int index) async {

    await models.deleteAt(index);


    emit(HiveCartDeletitem());

  }


  int totlacount() {

    int price = 0;


    models.values.forEach((element) {

      price = price + (element.price! * element.quntity!);

    });


    return price;

  }


  deleteall() async {

    await models.clear();


    emit(HiveCartDeletall());

  }


  @override

  void onChange(Change<HiveCartState> change) {

    // TODO: implement onChange


    super.onChange(change);


    print(change);

  }

}

