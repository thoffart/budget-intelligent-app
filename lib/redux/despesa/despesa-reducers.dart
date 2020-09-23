
import 'package:tcc_app/redux/despesa/despesa-actions.dart';
import 'package:tcc_app/redux/despesa/despesa-state.dart';
import 'package:tcc_app/utils/normalizer/normalizer.dart';
import 'package:redux/redux.dart';

final Reducer<DespesaState> despesaReducer = combineReducers<DespesaState>([
  TypedReducer<DespesaState, GetDespesaFirstTime>(_getDespesaFirstTime),
  TypedReducer<DespesaState, GetDespesaFirstTimeSuccess>(_getDespesaFirstTimeSuccess),
  TypedReducer<DespesaState, RefreshDespesa>(_refreshDespesa),
  TypedReducer<DespesaState, RefreshDespesaSuccess>(_refreshDespesaSuccess),
  TypedReducer<DespesaState, CadastroDespesa>(_cadastroDespesa),
  TypedReducer<DespesaState, CadastroDespesaSuccess>(_cadastroDespesaSuccess),
  TypedReducer<DespesaState, CadastroDespesaError>(_cadastroDespesaError),
  TypedReducer<DespesaState, EditFormDespesa>(_editFormDespesa),
  TypedReducer<DespesaState, EditFormDespesaSuccess>(_editFormDespesaSuccess),
  TypedReducer<DespesaState, DespesaCleanState>(_despesaCleanState),
]);

DespesaState _cadastroDespesa(DespesaState state, CadastroDespesa action) => state;

DespesaState _cadastroDespesaSuccess(DespesaState state, CadastroDespesaSuccess action) {
  final Map<String, Map<String, dynamic>> dataNormalized = Normalizer.normalizeList([action.despesa], 'id').cast<String, Map<String, dynamic>>();
  final Map<String, Map<String, dynamic>> newDespesaById = {...dataNormalized, ...state.despesaById};
  return state.copyWith(despesaById: newDespesaById);
}

DespesaState _cadastroDespesaError(DespesaState state, CadastroDespesaError action) => state;

DespesaState _despesaCleanState(DespesaState state, DespesaCleanState action) => DespesaState.initial();

DespesaState _editFormDespesa(DespesaState state, EditFormDespesa action) => state;

DespesaState _editFormDespesaSuccess(DespesaState state, EditFormDespesaSuccess action) {
  final Map<String, Map<String, dynamic>> dataNormalized = Normalizer.normalizeList([action.despesa], 'id').cast<String, Map<String, dynamic>>();
  final Map<String, Map<String, dynamic>> newDespesaById = {...dataNormalized, ...state.despesaById};
  return state.copyWith(despesaById: newDespesaById);
}

DespesaState _getDespesaFirstTime(DespesaState state, GetDespesaFirstTime action) => state;

DespesaState _getDespesaFirstTimeSuccess(DespesaState state, GetDespesaFirstTimeSuccess action) {
  final Map<String, Map<String, dynamic>> dataNormalized = Normalizer.normalizeList(action.despesaList, 'id').cast<String, Map<String, dynamic>>();
  final Map<String, Map<String, dynamic>> newDespesaById = {...dataNormalized, ...state.despesaById};
  return state.copyWith(despesaById: newDespesaById, isFirstTimeAccess: false);
}

DespesaState _refreshDespesa(DespesaState state, RefreshDespesa action) => state;

DespesaState _refreshDespesaSuccess(DespesaState state, RefreshDespesaSuccess action) {
  final Map<String, Map<String, dynamic>> dataNormalized = Normalizer.normalizeList(action.despesaList, 'id').cast<String, Map<String, dynamic>>();;
  final Map<String, Map<String, dynamic>> newDespesaById = {...dataNormalized, ...state.despesaById};
  return state.copyWith(despesaById: newDespesaById);
}
