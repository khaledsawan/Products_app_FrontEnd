import 'package:get/get.dart';

import '../../routes/routes.dart';
import '../../widgets/Custom_snackpar/show_custom_snackpar.dart';


class ApiChecker{
  static void checkerApi(Response response){
    if(response.statusCode==401){
      Get.offNamed(AppRoutes.login);
    }else{
      ShowCustomSnackpar(response.statusText!.toString(), '');
    }
  }
}