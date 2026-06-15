class PageMeta {
  PageMeta({
    required this.currentPage,
    required this.lastPage,
    required this.perPage,
    required this.total,
  });

  final int currentPage;
  final int lastPage;
  final int perPage;
  final int total;

  bool get hasMore => currentPage < lastPage;

  factory PageMeta.fromJson(Map<String, dynamic> json) => PageMeta(
        currentPage: (json['current_page'] as num).toInt(),
        lastPage: (json['last_page'] as num).toInt(),
        perPage: (json['per_page'] as num).toInt(),
        total: (json['total'] as num).toInt(),
      );
}

class Paginated<T> {
  Paginated({required this.items, required this.meta});
  final List<T> items;
  final PageMeta meta;
}
