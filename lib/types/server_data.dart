import 'package:equatable/equatable.dart';
import 'package:optional/optional_internal.dart';

class DataObject<T> extends Equatable {
  late final bool loading;
  late final bool initialFetchComplete;
  late final T data;
  late final String? error;

  DataObject<T> copyWith({bool? loading, bool? initialFetchComplete, T? data, Optional<String>? error}) => DataObject<T>(
        data ?? this.data,
        loading: loading ?? this.loading,
        initialFetchComplete: initialFetchComplete ?? this.initialFetchComplete,
        error: error != null ? error.orElseNull : this.error,
      );

  DataObject(this.data, {this.loading = true, this.initialFetchComplete = false, this.error});

  @override
  List<Object?> get props => [loading, initialFetchComplete, data, error];
}

class DataList<T> extends Equatable {
  late final bool loading;
  late final bool initialFetchComplete;
  late final List<T> data;
  late final String? error;

  DataList<T> copyWith({bool? loading, bool? initialFetchComplete, List<T>? data, Optional<String>? error}) => DataList<T>(
        data ?? this.data,
        loading: loading ?? this.loading,
        initialFetchComplete: initialFetchComplete ?? this.initialFetchComplete,
        error: error != null ? error.orElseNull : this.error,
      );

  DataList(this.data, {this.loading = true, this.initialFetchComplete = false, this.error});

  @override
  List<Object?> get props => [loading, initialFetchComplete, data, error];
}

class PaginatedResponse<T> extends Equatable {
  List<T> items;
  final int totalItems;
  final int itemsPerPage;
  final int totalPages;
  final int currentPage;

  PaginatedResponse({
    required this.items,
    this.totalItems = 0,
    this.itemsPerPage = 0,
    this.totalPages = 0,
    this.currentPage = 0,
  });

  factory PaginatedResponse.fromJson(Map<String, dynamic> json, T Function(Map<String, dynamic>) fromJson) {
    final meta = json['meta'];
    return PaginatedResponse(
      items: json['items'] is List ? json['items'].map((item) => fromJson(item)).cast<T>().toList() : [],
      totalItems: meta?['totalItems'] ?? 0,
      itemsPerPage: meta?['itemsPerPage'] ?? 0,
      totalPages: meta?['totalPages'] ?? 0,
      currentPage: meta?['currentPage'] ?? 0,
    );
  }

  void runTransformers(List<T Function(T)> transformers) {
    for (final transformer in transformers) {
      items = items.map((item) => transformer(item)).toList();
    }
  }

  @override
  List<Object?> get props => [items, totalItems, itemsPerPage, totalPages, currentPage];
}
