String emptyValidator(String v) {
  if (v != null && v.trim() != '') {
    return null;
  }
  return '入力されていません';
}
