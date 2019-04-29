final RegExp _urlRx = new RegExp(r'[?&]v=([^&=]+)');

String ytIdFromUrl(String url) {
  var match = _urlRx.firstMatch(url);
  if (match == null || match.groupCount == 0) return null;
  return match.groups([1]).first;
}
