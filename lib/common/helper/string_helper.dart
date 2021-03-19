class StringHelper {
  limit(String string, {int length = 20, String endStr = '...'}) {
    assert(length - endStr.length >= 0);

    final label = string.split('\n').first;

    // 指定した長さより文字列が長い場合切り取る
    return label.length > length
        ? label.substring(0, length - endStr.length) + endStr
        : label;
  }
}
