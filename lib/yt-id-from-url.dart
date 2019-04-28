final RegExp urlRx = new RegExp(r'[?&]v=([^&=]+)');

String ytIdFromUrl(String url) {
  var match = urlRx.firstMatch(url);
  if (match == null || match.groupCount == 0) return null;
  return match.groups([1]).first;
}
