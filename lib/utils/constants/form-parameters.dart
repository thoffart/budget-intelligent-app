class FormParameters {

  static const List<Map<String, dynamic>> produto = [ 
    {
      'key': 'nome',
      'hasMask': false,
    },
    {
      'key': 'valor',
      'hasMask': true,
      'mask': 'money',
    },
    {
      'key': 'quantidade',
      'hasMask': false,
    }
  ];

}