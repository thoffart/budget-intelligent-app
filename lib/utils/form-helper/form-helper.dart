import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

// Exemplo de uso
// TextFormField(
//   controller: formHelper.attributes['pessoa_nome']['controller'],
//   onSaved: (value) {
//     addValueFormClientes({'pessoa_nome': value});
//   },
//   textInputAction: TextInputAction.next,
//   style: TextStyle(color: Colors.black),
//   keyboardType: TextInputType.emailAddress,
//   validator: (value) {
//     if (value.isEmpty) 
//       return "Digite o nome";
//     return null;
//   },
//   onFieldSubmitted: (value) {
//     FocusScope.of(context).requestFocus(formHelper.attributes['pessoa_apelido']['focusNode']);
//   },
//   decoration: inputFormClientesDecoration(
//     'Nome',
//   ),
// ), 

class FormHelper {
  final dynamic infos;
  final Map<String, dynamic> attributes;

  FormHelper({
    @required this.infos,
    this.attributes,
  });

  factory FormHelper.clean() {
    return FormHelper(
      infos: null,
      attributes: null,
    );
  }

  factory FormHelper.create(infos) {
    dynamic newInfo = infos.map((info) {
      if (info['hasMask']) {
        return { 'key': info['key'], 'controller': info['mask'] == 'money' ? MoneyMaskedTextController(leftSymbol: 'R\$ ', decimalSeparator: ',', thousandSeparator: '.') : MaskedTextController(mask: info['mask']) };
      }
      return { 'key': info['key'], 'controller': TextEditingController() };
    }).toList();
    Map<String, dynamic> listAttributes = Map.fromIterable(
      newInfo, 
      key: (info) => info['key'],
      value: (info) => {
        'controller': info['controller'],
        'focusNode': FocusNode(),
      }
    );
    return FormHelper(
      infos: infos,
      attributes: listAttributes,
    );
  }

  factory FormHelper.createWithValues(infos, values) {
    dynamic newInfo = infos.map((info) {
      if (info['hasMask']) {
        return { 'key': info['key'], 'controller': info['mask'] == 'money' ? MoneyMaskedTextController(leftSymbol: 'R\$ ', decimalSeparator: ',', thousandSeparator: '.', initialValue: (values[info['key']] !=  null ? (values[info['key']] is double) ? (values[info['key']]) : (values[info['key']]).toDouble() : 0) ) : MaskedTextController(mask: info['mask'], text: (values[info['key']] ?? '').toString()) };
      }
      if (values[info['key']] is String || values[info['key']] == null || values[info['key']] is int || values[info['key']] is double) {
        return { 'key': info['key'], 'controller': TextEditingController(text: (values[info['key']] ?? '').toString()) };
      }
      return { 'key': info['key'], 'controller': TextEditingController(text: (values[info['key']]['nome'] ?? '').toString()) };
    }).toList();
    Map<String, dynamic> listAttributes = Map.fromIterable(
      newInfo, 
      key: (info) => info['key'],
      value: (info) => {
        'controller': info['controller'],
        'focusNode': FocusNode(),
      }
    );
    return FormHelper(
      infos: infos,
      attributes: listAttributes,
    );
  }

  static Map<String, dynamic> handleFormValues(List infos, dynamic values) {
    Map<String, dynamic> formValues = { }; 
    infos.forEach((info) {
      formValues.addAll({ info.keys.first.toString(): values[info.keys.first]['value'] });
    });
    return formValues;
  }
}