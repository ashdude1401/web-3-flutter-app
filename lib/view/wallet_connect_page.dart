import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web3modal_flutter/web3modal_flutter.dart';
import 'package:web_3_app/controller/web3_connection_controller.dart';
import 'package:web_3_app/utils/theme/pallete.dart';

class WalletConnectPage extends StatelessWidget {
  WalletConnectPage({super.key});

  final controller = Get.put(TWeb3ConnectionController());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.web3Service.init(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Palette.primaryColor,
              title: const Text('Web 3 App',
                  style: TextStyle(
                      color: Palette.whiteColor, fontWeight: FontWeight.bold)),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Obx(
                () => controller.isConnected.value
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Connected'),
                            const SizedBox(
                              height: 20,
                            ),
                            W3MConnectWalletButton(
                              service: controller.web3Service.service,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Implement your send transaction logic here
                                    },
                                    child: const Text('Send Transaction'),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      await controller.signedMessage();
                                    },
                                    child: const Text('Sign message'),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    : Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            W3MNetworkSelectButton(
                                service: controller.web3Service.service),
                            const SizedBox(
                              height: 20,
                            ),
                            W3MConnectWalletButton(
                              service: controller.web3Service.service,
                            ),
                          ],
                        ),
                      ),
              ),
            ),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
