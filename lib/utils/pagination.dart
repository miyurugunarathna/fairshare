import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:fairshare/types/server_data.dart';

extension PagingControllerExt on PagingController {
  Future processRequest<T>(Future<PaginatedResponse<T>> Function(int, int) request, int? page, {int pageSize = 10, T Function(T)? transfomer}) async {
    page ??= firstPageKey ?? 1;
    if (page == firstPageKey && itemList != null && itemList!.isNotEmpty) {
      clear();
    }
    final response = await request(page!, pageSize);
    if (transfomer != null) {
      response.runTransformers([transfomer]);
    }
    if (response.items.length < pageSize) {
      appendLastPage(response.items);
    } else {
      final nextPageKey = page + 1;
      appendPage(response.items, nextPageKey);
    }
  }

  void clear() {
    itemList = null;
    nextPageKey = firstPageKey;
  }
}
