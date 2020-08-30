import 'package:covid19_modular_mobx/app/models/mundo_model.dart';
import 'package:covid19_modular_mobx/app/models/pais_model.dart';
import 'package:covid19_modular_mobx/app/repositories/covidapi_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final api = Modular.get<CovidApiRepository>();

  _HomeControllerBase() {
    getInfoMundo();
    getInfoPais();
  }

  @observable
  int currentIndex = 0;

  @observable
  TextEditingController textEditingController = TextEditingController();

  @observable
  Mundo mundo;

  @observable
  Pais pais;

  @action
  getInfoMundo() async {
    mundo = await api.getMundo();
  }

  @action
  getInfoPais({String nomePais = 'brazil'}) async {
    try {
      pais = await api.getPais(pais: nomePais);
    } catch (exception) {
      return Container();
    }
  }

  @action
  changePage(int index) {
    currentIndex = index;
  }
}
