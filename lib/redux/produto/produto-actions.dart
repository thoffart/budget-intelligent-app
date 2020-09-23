class GetProdutoFirstTime {
  GetProdutoFirstTime();
}

class GetProdutoFirstTimeSuccess {
  final List<dynamic> produtoList;
  GetProdutoFirstTimeSuccess(this.produtoList);
}

class RefreshProduto {
  RefreshProduto();
}

class RefreshProdutoSuccess {
  final List<dynamic> produtoList;
  RefreshProdutoSuccess(this.produtoList);
}

class UpdateProdutoById {
  final List<dynamic> produtoList;
  UpdateProdutoById(this.produtoList);
}

class CadastroProduto {
  Map<String, dynamic> formValue;
  CadastroProduto(this.formValue);
}

class CadastroProdutoSuccess {
  dynamic produto;
  CadastroProdutoSuccess(this.produto);
}

class CadastroProdutoError { 
  final dynamic errorMessage;
  CadastroProdutoError(this.errorMessage);
}

class EditFormProduto {
  Map<String, dynamic> formValue;
  EditFormProduto(this.formValue);
}

class EditFormProdutoSuccess {
  final dynamic produto;
  EditFormProdutoSuccess(this.produto);
}


class ProdutoCleanState {
  ProdutoCleanState();
}
