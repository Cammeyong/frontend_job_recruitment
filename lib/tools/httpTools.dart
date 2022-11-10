class PagedFiltered {
  int? limit;
  int? page;
  List<String> filterFields = [];
  List<Object> filterValues = [];

  PagedFiltered({this.limit, this.page, List<String>? fields, List<Object>? values}) {
    filterFields.addAll(fields ?? []);
    filterValues.addAll(values ?? []);
  }

  String getQueryString() {
    bool paging = limit != null && page != null;

    bool filtering = filterFields.isNotEmpty &&
        filterValues.isNotEmpty &&
        filterValues.length == filterFields.length;

    bool both = paging && filtering;

    String pageString = paging ? 'limit=$limit&page=$page' : '';

    String filterString = '';

    if (filtering) {
      for (int i = 0; i < filterFields.length; i++) {
        filterString += 'field=${filterFields[i]}&';
      }
      for (int i = 0; i < filterValues.length; i++) {
        filterString +=
        i == filterValues.length ? 'value=${filterValues[i]}&' : 'value=${filterValues[i]}';
      }
    }

    return '$pageString${both ? '&' : ''}$filterString';
  }
}