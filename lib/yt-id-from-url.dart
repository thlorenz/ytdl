final RegExp _urlRx = new RegExp(r'youtube.+[?&]v=([^&=]+)');
final RegExp _shareUrlRx = new RegExp(r'youtu\.be\/([^\s]+)');
final RegExp _idRx = new RegExp(r'^[A-Za-z0-9_-]{8,20}');

String ytIdFromUrl(String url) {
  url = url.trim();
  if (_idRx.hasMatch(url)) return url;

  var match = null; 
  if (_urlRx.hasMatch(url)) match = _urlRx.firstMatch(url);
  else if (_shareUrlRx.hasMatch(url)) match = _shareUrlRx.firstMatch(url);
      
  if (match == null || match.groupCount == 0) return null;
  return match.groups([1]).first;
}
