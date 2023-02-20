import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test/reactive_state_manager/controller.dart';

/**
 * Obx:
 *   Observable(obs)의 변화를 listen 함
 *   Controller인스턴스가 미리 다른 곳에 initialize되어 있어야 함
 * GetX:
 *   Observable(obs)의 변화를 listen 함
 *   자체적으로 Controller 인스턴스를 initialize할 수도 있음
 *   Obx 보다 다양한 기능을 내장하고 있어서 조금 더 무거움
 * GetBuilder:
 *   Observable(obs)의 변화를 listen 하지 않음
 *   수동으로 UI를 리빌드 해야하기에 반드시 update메서드를 호출해야 함
 */

class PersonalCard extends StatelessWidget {
  PersonalCard({Key? key}) : super(key: key);

  final Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              width: double.maxFinite,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFF89dad0),
              ),
              child: Center(
                child: GetX<Controller>(
                  builder: (Controller _) => Text(
                    'Name: ${_.person().name}',
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              width: double.maxFinite,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFF89dad0),
              ),
              child: Center(
                child: Obx(
                  () => Text(
                    'Age: ${controller.person().age}',
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              width: double.maxFinite,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFF89dad0),
              ),
              child: Center(
                child: GetX(
                  init: Controller(),
                  builder: (Controller _) => Text(
                    'Age: ${Get.find<Controller>().person().age}',
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.updateInfo();
        },
        backgroundColor: Colors.red,
        child: const Icon(Icons.add),
      ),
    );
  }
}
