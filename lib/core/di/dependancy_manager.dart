import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:eventhub/core/di/dependancy_manager.config.dart';
import 'package:eventhub/core/services/image_picker_service.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void configureDependencies() {
  getIt.init();
  
  // Register services manually
  getIt.registerLazySingleton<ImagePickerService>(() => ImagePickerService());
}
