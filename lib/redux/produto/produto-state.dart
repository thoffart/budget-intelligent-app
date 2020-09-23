import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class ProdutoState {
  final bool isFirstTimeAccess;
  final Map<String, Map<String, dynamic>> produtoById;

  ProdutoState({
    @required this.isFirstTimeAccess,
    @required this.produtoById,
  });

  factory ProdutoState.initial() {
    return ProdutoState(
      isFirstTimeAccess: true,
      produtoById: {},
    );
  }

  ProdutoState copyWith({
    bool isFirstTimeAccess,
    Map<String, Map<String, dynamic>> produtoById,
  }) {
    return ProdutoState(
      isFirstTimeAccess: isFirstTimeAccess ?? this.isFirstTimeAccess,
      produtoById: produtoById ?? this.produtoById,
    );
  }
}
