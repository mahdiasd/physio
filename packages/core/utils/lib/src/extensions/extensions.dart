extension Logger on Object {
  void dLog({String key = 'MyLog', String plusKey = ''}) {
    final timestamp = DateTime.now().toIso8601String();
    final logHeader = '🔹[$key${plusKey.isNotEmpty ? ' - $plusKey' : ''}]';
    print('$logHeader at $timestamp:\n$this\n');
  }
}
