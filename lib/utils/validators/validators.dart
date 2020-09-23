import 'package:intl/intl.dart';

String emailValidator(dynamic value) {
  Pattern pattern =
  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = RegExp(pattern);
  if (value.isEmpty) {
    return 'Por favor digite um e-mail';
  }
  if (!regex.hasMatch(value)) {
    return 'Entre com um e-mail válido';
  }
  return null;
}

String passwordValidator(dynamic value) {
  if (value.isEmpty) {
    return 'Por favor digite uma senha';
  }
  return null;
}

String emptyValidator(dynamic value, String nome) {
  if (value == null || value.isEmpty) {
    return 'Por favor digite um$nome';
  }
  return null;
}

String nomeValidator(dynamic value) {
  if (value.isEmpty) {
    return 'Por favor digite um nome';
  }
  return null;
}

String dateValidator(dynamic value) {
  try {
    DateFormat('dd/MM/yyyy').parse(value);
  } on Exception {
    return 'Por favor digite uma data';
  }
  return null;
}

String dateValidatorMin(dynamic value) {
  DateTime now = DateTime.now();
  DateTime before = now.subtract(const Duration(days: 36500));
  DateTime dateFormatted;
  try {
    dateFormatted = DateFormat('dd/MM/yyyy').parse(value);
  } on Exception {
    return 'Por favor digite uma data';
  }
  if (dateFormatted.isAfter(before)) {
    return null;
  }
  return 'Por favor digite uma data válida';
}

String dateValidatorMax(dynamic value) {
  DateTime now = DateTime.now();
  DateTime later = now.add(const Duration(days: 36500));
  DateTime dateFormatted;
  try {
    dateFormatted = DateFormat('dd/MM/yyyy').parse(value);
  } on Exception {
    return 'Por favor digite uma data';
  }
  if (dateFormatted.isBefore(later)) {
    return null;
  }
  return 'Por favor digite uma data válida';
}

String dateTimeValidator(DateTime value) {
  if (value == null) {
    return 'Por favor digite uma data';
  }

  return null;
}

String dateTimeMinValidator(DateTime value) {
  DateTime now = DateTime.now();
  DateTime before = now.subtract(const Duration(days: 36500));

  if (value.isAfter(before)) {
    return null;
  }
  return 'Por favor digite uma data válida';
}

String dateTimeMaxValidator(DateTime value) {
  DateTime now = DateTime.now();
  DateTime later = now.add(const Duration(days: 36500));

  if (value.isBefore(later)) {
    return null;
  }
  return 'Por favor digite uma data válida';
}

String tryIntParseOrNull(dynamic value) {
  if (value.isEmpty) {
    return null;
  }
  if (int.tryParse(value) == null) {
    return 'Número inválido';
  }
  return null;
}

String emptyArrayValidator(dynamic value) {
  if (value == null || value.length == 0) {
    return 'Por favor selecione uma ou mais opções';
  }
  return null;
}
