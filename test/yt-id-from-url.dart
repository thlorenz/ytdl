import '../lib/yt-id-from-url.dart' as sut;
import 'package:test/test.dart';

void main() {
  group('valid urls', () {
    const id = '7IG5kRFIMZw';
    const validURL1 = 'https://www.youtube.com/watch?v=$id&list=PL4k64We';
    const validURL2 =
        'https://www.youtube.com/watch?list=PL4k64We&v=$id&index=3&t=0s';
    const validURL3 = 'https://www.youtube.com/watch?v=$id';

    test(validURL1, () {
      expect(sut.ytIdFromUrl(validURL1), id);
    });
    test(validURL2, () {
      expect(sut.ytIdFromUrl(validURL2), id);
    });
    test(validURL3, () {
      expect(sut.ytIdFromUrl(validURL3), id);
    });
  });

  group('invalid urls', () {
    const id = '7IG5kRFIMZw';
    const validURL1 = 'https://www.youtube.com/watch?list=PL4k64Wev=$id&index=3&t=0s';
    const validURL2 = 'https://www.youtube.com/watchv=$id';

    test(validURL1, () {
      expect(sut.ytIdFromUrl(validURL1), null);
    });
    test(validURL2, () {
      expect(sut.ytIdFromUrl(validURL2), null);
    });
  });
}
