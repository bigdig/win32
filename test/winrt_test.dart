@TestOn('windows')

import 'package:ffi/ffi.dart';
import 'package:test/test.dart';
import 'package:win32/win32.dart';
import 'version.dart';

void main() {
  if (isWindows10OrGreater()) {
    test('WinRT simple test', () {
      winrtInitialize();

      final object =
          CreateObject('Windows.Globalization.Calendar', IID_ICalendar);
      final calendar = ICalendar(object.cast());

      expect(calendar.Year, greaterThanOrEqualTo(2020));
      free(object);
      winrtUninitialize();
    });
  }
}
