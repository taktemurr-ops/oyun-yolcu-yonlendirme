import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_yolcu_yonlendirme/oyun_yolcu_yonlendirme.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(yolcuConfig.title.length, 33);
    expect(yolcuConfig.tagline.length, 33);
    for (final s in yolcuConfig.tutorial) {
      expect(s.text.length, 33);
    }
  });

  test('bölümler üretilir ve bot tarafından geçilir', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(yolcuRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: yolcuId, optionalMechanics: yolcuRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(yolcuRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
