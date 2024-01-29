import 'package:get/get.dart';

import '../config/web3connect_config.dart';

class TWeb3ConnectionController extends GetxController {
  final web3Service = TWebConnectConfig();

  @override
  void onInit() {
    web3Service.service.addListener(() {
      if (web3Service.service.isConnected) {
        connectWallet();
      } else {
        disconnectWallet();
      }
    });
    // TODO: implement onInit
    super.onInit();
  }

  var isConnected = false.obs; // Add this line

  // Call this method when the wallet is successfully connected
  void connectWallet() {
    isConnected.value = true;
  }

  // Call this method when the wallet is disconnected
  void disconnectWallet() {
    isConnected.value = false;
  }

  Future<void> signedMessage() async {
    //open wallet
    await web3Service.launchConnectedWallet();
    await web3Service.signMessage('Hello World');
  }

  Future<void> sendTransection() async {}
}
