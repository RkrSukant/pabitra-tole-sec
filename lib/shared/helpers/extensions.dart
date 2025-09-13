
import 'package:flutter/cupertino.dart';

extension Iterables<E> on Iterable<E> {
  Map<K, List<E>> groupBy<K>(K Function(E) keyFunction) => fold(
      <K, List<E>>{},
          (Map<K, List<E>> map, E element) =>
      map..putIfAbsent(keyFunction(element), () => <E>[]).add(element));
}

extension SumOfExtension<T> on Iterable<T> {
  num sumOf(num Function(T) mapper) {
    num sum = 0;
    for (T element in this) {
      sum += mapper(element);
    }
    return sum;
  }
}

extension PrintStackTrace on Object {
  void printStackTrace() {
    if (this is Error) {
      final error = this as Error;
      debugPrint(error.stackTrace.toString());
    } else {
      debugPrint('No stack trace available for this object.');
    }
  }
}

extension Extensions on String? {
  bool isNotNullOrEmpty() {
    return this != null && this != "";
  }

  bool isNullOrEmpty() {
    return this == null || this == '';
  }
}