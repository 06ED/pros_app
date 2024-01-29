import '../app/models/user.dart';
import '/config/providers.dart';
import 'package:nylo_framework/nylo_framework.dart';

/// Boot methods for Nylo.
class Boot {
  static Future<Nylo> nylo() async => await bootApplication(providers);

  static Future<void> finished(Nylo nylo) async {
    await bootFinished(nylo, providers);
    // Auth.set(
    //   User(
    //     name: "Artyom",
    //     email: "hsbest14@yandex.ru",
    //     isVip: true,
    //     image:
    //         "https://sun9-27.userapi.com/impf/BsSqWQHDAR2LDRonJ4mmECcra2bYf_UDqkD20w/pwfq5NbrI1g.jpg?size=720x1080&quality=95&sign=018b235bb75d03ee6c0361d17da95353&type=album",
    //   ),
    // );
  }
}
