class DartNormalizer<T> {
  
  static List normalizeMergeList(List a, List b, String key) {
    final Map aMap = Map.fromIterable(a, key: (v) => v[key], value: (v) => v);
    final Map bMap = Map.fromIterable(b, key: (v) => v[key], value: (v) => v);
    final Map mergeMap = {...aMap, ...bMap };
    final List mergeList = mergeMap.values.toList();
    return mergeList;
  }

  //TODO: Normalizar listas com objetos que contém relaçāo n-n [https://redux.js.org/recipes/structuring-reducers/normalizing-state-shape#relationships-and-tables]

  static Map<dynamic, Map<String, dynamic>> normalizeList(List valueList, String key, [List<NestedObject> nestedObjectList]) {
    final Map<dynamic, Map<String, dynamic>> valueNormalized = (nestedObjectList != null && nestedObjectList.isNotEmpty)
      ? Map<dynamic, Map<String, dynamic>>.fromIterable(valueList, key: (value) => value[key], value: (value) {
        nestedObjectList.forEach((nestedObject) {
          (value[nestedObject.objectKey] is List)
            ? value[nestedObject.objectKey] = List.generate(value[nestedObject.objectKey].length, (index) => value[nestedObject.objectKey][index][nestedObject.objectIdKey])
            : value[nestedObject.objectKey] = value[nestedObject.objectKey][nestedObject.objectIdKey];
        });
        return value;
      })
      : Map<dynamic, Map<String, dynamic>>.fromIterable(valueList, key: (value) => value[key], value: (value) => value);
    return valueNormalized;
  }

  List<T> normalizeMergeListWithCustomType(List<T> a, List<T> b, String key) {
    final Map aMap = Map.fromIterable(a, key: (v) => v[key], value: (v) => v);
    final Map bMap = Map.fromIterable(b, key: (v) => v[key], value: (v) => v);
    final Map mergeMap = {...aMap, ...bMap };
    final List<T> mergeList = List<T>.from(mergeMap.values.toList());
    return mergeList;
  }
  
}

class NestedObject {
  String objectKey;
  String objectIdKey;

  NestedObject({
    this.objectIdKey,
    this.objectKey,
  });

}