import 'package:tcc_app/redux/produto/produto-actions.dart';
import 'package:tcc_app/redux/produto/produto-state.dart';
import 'package:tcc_app/utils/normalizer/normalizer.dart';
import 'package:redux/redux.dart';

final Reducer<ProdutoState> produtoReducer = combineReducers<ProdutoState>([
  TypedReducer<ProdutoState, GetProdutoFirstTime>(_getProdutoFirstTime),
  TypedReducer<ProdutoState, GetProdutoFirstTimeSuccess>(_getProdutoFirstTimeSuccess),
  TypedReducer<ProdutoState, RefreshProduto>(_refreshProduto),
  TypedReducer<ProdutoState, RefreshProdutoSuccess>(_refreshProdutoSuccess),
  TypedReducer<ProdutoState,CadastroProduto>(_cadastroProduto),
  TypedReducer<ProdutoState,CadastroProdutoSuccess>(_cadastroProdutoSuccess),
  TypedReducer<ProdutoState,CadastroProdutoError>(_cadastroProdutoError),
  TypedReducer<ProdutoState,EditFormProduto>(_editFormProduto),
  TypedReducer<ProdutoState,EditFormProdutoSuccess>(_editFormProdutoSuccess),
  TypedReducer<ProdutoState,ProdutoCleanState>(_produtoCleanState),
]);

ProdutoState _cadastroProduto(ProdutoState state, CadastroProduto action) => state;

ProdutoState _cadastroProdutoSuccess(ProdutoState state, CadastroProdutoSuccess action) {
  final Map<String, Map<String, dynamic>> dataNormalized = Normalizer.normalizeList([action.produto], 'id').cast<String, Map<String, dynamic>>();
  final Map<String, Map<String, dynamic>> newProdutoById = {...dataNormalized, ...state.produtoById};
  return state.copyWith(produtoById: newProdutoById);
}

ProdutoState _cadastroProdutoError(ProdutoState state, CadastroProdutoError action) => state;

ProdutoState _produtoCleanState(ProdutoState state, ProdutoCleanState action) => ProdutoState.initial();

ProdutoState _editFormProduto(ProdutoState state, EditFormProduto action) => state;

ProdutoState _editFormProdutoSuccess(ProdutoState state, EditFormProdutoSuccess action) {
  final Map<String, Map<String, dynamic>> dataNormalized = Normalizer.normalizeList([action.produto], 'id').cast<String, Map<String, dynamic>>();
  final Map<String, Map<String, dynamic>> newProdutoById = {...dataNormalized, ...state.produtoById};
  return state.copyWith(produtoById: newProdutoById);
}

ProdutoState _getProdutoFirstTime(ProdutoState state, GetProdutoFirstTime action) => state;

ProdutoState _getProdutoFirstTimeSuccess(ProdutoState state, GetProdutoFirstTimeSuccess action) {
  final Map<String, Map<String, dynamic>> dataNormalized = Normalizer.normalizeList(action.produtoList, 'id').cast<String, Map<String, dynamic>>();
  final Map<String, Map<String, dynamic>> newProdutoById = {...dataNormalized, ...state.produtoById};
  return state.copyWith(produtoById: newProdutoById, isFirstTimeAccess: false);
}

ProdutoState _refreshProduto(ProdutoState state, RefreshProduto action) => state;

ProdutoState _refreshProdutoSuccess(ProdutoState state, RefreshProdutoSuccess action) {
  final Map<String, Map<String, dynamic>> dataNormalized = Normalizer.normalizeList(action.produtoList, 'id').cast<String, Map<String, dynamic>>();;
  final Map<String, Map<String, dynamic>> newProdutoById = {...dataNormalized, ...state.produtoById};
  return state.copyWith(produtoById: newProdutoById);
}