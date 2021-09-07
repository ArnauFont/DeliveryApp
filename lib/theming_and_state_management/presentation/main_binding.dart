import 'package:delivery_app2/theming_and_state_management/data/datasource/api_implementation.dart';
import 'package:delivery_app2/theming_and_state_management/data/datasource/local_repository_impl.dart';
import 'package:delivery_app2/theming_and_state_management/domain/repository/api_repository.dart';
import 'package:delivery_app2/theming_and_state_management/domain/repository/local_storage_repository.dart';
import 'package:get/instance_manager.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocalRepositoryInterface>(
        () => LocalRepositoryImplementation());

    Get.lazyPut<ApiRepository>(() => ApiImplementation());
  }
}
