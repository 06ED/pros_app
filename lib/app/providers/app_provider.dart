import '/config/decoders.dart';
import '/config/design.dart';
import '/config/theme.dart';
import '/config/validation_rules.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '/config/localization.dart';

class AppProvider implements NyProvider {
  @override
  boot(Nylo nylo) async {
    await NyLocalization.instance.init(
      localeType: localeType,
      languageCode: languageCode,
      languagesList: languagesList,
      assetsDirectory: assetsDirectory,
      valuesAsMap: valuesAsMap,
    );

    nylo.addLoader(loader);
    nylo.addLogo(logo);
    nylo.addThemes(appThemes);
    nylo.addValidationRules(validationRules);
    nylo.addModelDecoders(modelDecoders);
    nylo.addControllers(controllers);
    nylo.addApiDecoders(apiDecoders);

    return nylo;
  }

  @override
  afterBoot(Nylo nylo) async {

  }
}