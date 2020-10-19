import 'package:intl/intl.dart';
import 'package:tcc_app/app-state.dart';
import 'package:reselect/reselect.dart';
import 'package:memoize/function_defs.dart';
import 'package:collection/collection.dart';

Map<String, Map<String, dynamic>> produtoByIdSelector (AppState state) => state.produtoState.produtoById;


double Function(Map<String, Map<String, dynamic>>) valorTotalOfProdutosMemoizer(Func1<Map<String, Map<String, dynamic>>, double> combiner) {
  Map<String, Map<String, dynamic>> previousProdutosById;
  double previousValorTotal;
  return ((Map<String, Map<String, dynamic>> produtosById) {
    if (identical(produtosById, previousProdutosById)) {
      return previousValorTotal;
    } else {
      previousProdutosById = produtosById;
      previousValorTotal = combiner(produtosById);
      return previousValorTotal;
    }
  });
}

List Function(Map<String, Map<String, dynamic>>) gastosPorDiaMemoizer(Func1<Map<String, Map<String, dynamic>>, List > combiner) {
  Map<String, Map<String, dynamic>> previousProdutosById;
  List  previousValorTotal;
  return ((Map<String, Map<String, dynamic>> produtosById) {
    if (identical(produtosById, previousProdutosById)) {
      return previousValorTotal;
    } else {
      previousProdutosById = produtosById;
      previousValorTotal = combiner(produtosById);
      return previousValorTotal;
    }
  });
}

final double Function(AppState appState) valorTotalOfProdutos = createSelector1(
  produtoByIdSelector,
  (Map<String, Map<String, dynamic>> produtosById) {
    double valorTotal = 0;
    produtosById.forEach((key, value) {
      valorTotal += value['valor'];
    });
    return valorTotal;
  },
  memoize: valorTotalOfProdutosMemoizer,
);

final List Function(AppState appState) gastosPorDia = createSelector1(
  produtoByIdSelector,
  (Map<String, Map<String, dynamic>> produtosById) {
    final dateFormat = DateFormat('dd/MM');
    final filterDate = DateTime.now().subtract(const Duration(days: 7));
    produtosById
      .map((key, value) {
      String formatedCreatedAt = (value['created_at'] as String).substring(0,10);
      value['created_at'] = DateTime.tryParse((formatedCreatedAt));
      return MapEntry(key, value);
      });
    produtosById.removeWhere((key, value) => value['created_at'].compareTo(filterDate) < 0);
    final groupedByDateProdutos = groupBy(produtosById.values, (obj) => obj['created_at']);
    final groupedByDateProdutosValor = groupedByDateProdutos.map<String, double>((key, value) {
      double valorTotal = 0;
      value.forEach((element) {
        valorTotal += element['valor'];
      });
      return MapEntry(dateFormat.format(key), valorTotal);
    });
    final List listOfProdutosValorTotalByDate = groupedByDateProdutosValor.entries.map( (entry) => {
      'name': entry.key,
      'value': entry.value,
    }).toList();
    return listOfProdutosValorTotalByDate;
  },
  memoize: gastosPorDiaMemoizer,
);