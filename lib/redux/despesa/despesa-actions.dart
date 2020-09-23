class GetDespesaFirstTime {
  GetDespesaFirstTime();
}

class GetDespesaFirstTimeSuccess {
  final List<dynamic> despesaList;
  GetDespesaFirstTimeSuccess(this.despesaList);
}

class RefreshDespesa {
  RefreshDespesa();
}

class RefreshDespesaSuccess {
  final List<dynamic> despesaList;
  RefreshDespesaSuccess(this.despesaList);
}

class CadastroDespesa {
  Map<String, dynamic> formValue;
  CadastroDespesa(this.formValue);
}

class CadastroDespesaSuccess {
  dynamic despesa;
  CadastroDespesaSuccess(this.despesa);
}

class CadastroDespesaError { 
  final dynamic errorMessage;
  CadastroDespesaError(this.errorMessage);
}

class EditFormDespesa {
  Map<String, dynamic> formValue;
  EditFormDespesa(this.formValue);
}

class EditFormDespesaSuccess {
  final dynamic despesa;
  EditFormDespesaSuccess(this.despesa);
}


class DespesaCleanState {
  DespesaCleanState();
}
