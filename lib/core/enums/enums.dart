enum SweetsTypes {
  all('', 'كل الحلويات'),
  mawlidSweets('elmoled-sweets', 'حلويات المولد'),
  orientalSweets('Oriental Sweets', 'حلويات شرقية'),
  ramadanSweets('Ramadaniyat', 'حلويات رمضان');

  final String key;
  final String value;

  const SweetsTypes(this.key, this.value);
}

enum SortCriteria {
  latest('date', 'الأحدث', SortArrangements.DESC),
  earliest('date', 'الأقدم', SortArrangements.ASC),
  lowestPrice('price', 'السعر من الأقل للأكثر', SortArrangements.ASC),
  highestPrice('price', 'السعر من الأكثر للأقل', SortArrangements.DESC),
  AtoZ('alphabetical', ' أ - ي', SortArrangements.ASC),
  ZtoA('alphabetical', 'ي - أ', SortArrangements.DESC);

  final String key;
  final String value;
  final SortArrangements arrangement;

  const SortCriteria(this.key, this.value, this.arrangement);
}

enum SortArrangements {
  ASC,
  DESC,
}
