import 'package:flutter/material.dart';
import 'package:getx_practice/controller.dart';
import 'package:get/get.dart';

class PersonalCard extends StatelessWidget {
  PersonalCard({Key? key}) : super(key: key);
  final Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.updateInfo();
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //GetX
            Container(
              margin: const EdgeInsets.all(20),
              width: double.maxFinite,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.cyanAccent,
              ),
              child: Center(
                child: GetX<Controller>(
                    builder: (_) => Text('Name : ${controller.person().name}')),
              ),
            ),
            //Obx :
            //Observable(obs)의 변화를 listen함.
            //Controller 인스턴가 미리 다른곳에 initialize 되어있어야함.
            Container(
              margin: const EdgeInsets.all(20),
              width: double.maxFinite,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.cyanAccent,
              ),
              child: Center(
                child: Obx(() => Text('Age ${controller.person().age}')),
              ),
            ),
            //GetX
            //Observable(obs) 변화를 listen함.
            //자체적으로 Controller 인스턴스 initialize 할 수 있음.
            //Obx보다 다양한 기능을 내장하고 있어서 좀 더 무거움.(우려 X)
            Container(
              margin: const EdgeInsets.all(20),
              width: double.maxFinite,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.cyanAccent,
              ),
              child: Center(
                child: GetX(
                  init: Controller(),
                  builder: (controller) =>
                      Text('Age : ${Get.find<Controller>().person().age}'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//GetBuilder:
//Observable(obs)의 변화를 liten하지 않음
//수동으로 UI를 Update 해야하기에 반드시 update() 메소드를 호출해야함.
//자체적으로 Controller 인스턴스를 initialize 할 수 있음
//가볍게 사용 가능

