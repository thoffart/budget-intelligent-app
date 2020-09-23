import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class DespesaState {
  final bool isFirstTimeAccess;
  final Map<String, Map<String, dynamic>> despesaById;

  DespesaState({
    @required this.isFirstTimeAccess,
    @required this.despesaById,
  });

  factory DespesaState.initial() {
    return DespesaState(
      isFirstTimeAccess: true,
      despesaById: {},
    );
  }

  DespesaState copyWith({
    bool isFirstTimeAccess,
    Map<String, Map<String, dynamic>> despesaById,
    List<int> despesaAllIds,
  }) {
    return DespesaState(
      isFirstTimeAccess: isFirstTimeAccess ?? this.isFirstTimeAccess,
      despesaById: despesaById ?? this.despesaById,
    );
  }
}
