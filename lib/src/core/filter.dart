/// Typedefs and simple filter helpers.

typedef Filter<T> = T Function(T value);

/// A simple interface for string filters.
abstract class StringFilter {
  String apply(String value);
}

/// Chains multiple string filters together.
class CompositeFilter implements StringFilter {
  final List<StringFilter> filters;
  CompositeFilter(this.filters);

  @override
  String apply(String value) => filters.fold(value, (v, f) => f.apply(v));
}
