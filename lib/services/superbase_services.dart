import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SuperbaseServices extends GetxService {
  static SuperbaseServices get to => Get.find();

  static final SupabaseClient client = Supabase.instance.client;

  @override
  void onInit() async {
    await Supabase.initialize(
      url: 'https://wfalgdemssvrnrrfnmwn.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6IndmYWxnZGVtc3N2cm5ycmZubXduIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDUzMDgwOTIsImV4cCI6MjA2MDg4NDA5Mn0.tyPsWAKHdEukwHO7loMLNd78oQT1smSIuNRBV2Wy1b4',
    );
    super.onInit();
  }

  @override
  void onClose() {
    print('SuperbaseServices is closed');
    super.onClose();
  }

  logOut() {
    String? error;
    client.auth.signOut().then(
      (value) {},
      onError: (error) {
        error = error.toString();
      },
    );
    return error;
  }
}
