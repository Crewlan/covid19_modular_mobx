import 'package:covid19_modular_mobx/app/models/mundo_model.dart';

class Pais extends Mundo {
  String nome;
  int morteHoje;
  int criticos;
  String urlBandeira;

  Pais(
      {this.nome,
      this.criticos,
      this.morteHoje,
      this.urlBandeira,
      int casos,
      int mortes,
      int recuperados})
      : super(casos: casos, mortes: mortes, recuperados: recuperados);

  factory Pais.fromJson(Map doc) {
    return Pais(
      casos: doc['cases'],
      mortes: doc['deaths'],
      recuperados: doc['recovered'],
      morteHoje: doc['todayDeaths'],
      nome: doc['country'],
      criticos: doc['critical'],
      urlBandeira: doc['countryInfo']['flag'],
    );
  }
}
