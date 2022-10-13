import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:test_edspert/controller/film_controller.dart';
import 'package:test_edspert/controller/new_film_controller.dart';
import 'package:test_edspert/controller/vehicle_controller.dart';

class NewVehiclePage extends GetView<VehicleController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('hello'),),
      body: Column(
        children: [
          /// TODO: obx menggunakan controller dari GetView<VehicleController>
          /// bisa juga melalui controller dari Get.find();
          /// dan di dalam controllernya mempunyai variable observable .obs
          Expanded(child: Obx(() =>
              ListView.builder(
                  itemCount: controller.vehicle.length,
                  itemBuilder: (context, index) {
                    return Container(child: Text(controller.vehicle[index].name as String),);
                  }),),),
          /// TODO: GetBuilder dapat menginstance controller baru,
          /// dan di dalam controllernya tidak bersifat observable, sehingga harus menggunakan update() di dalam controllernya
          Expanded(child: GetBuilder<FilmController>(
            init: FilmController(),
            builder: (controllerFilm) {
            return ListView.builder(
                itemCount: controllerFilm.films.length,
                itemBuilder: (context, index) {
                  return Container(child: Text(controllerFilm.films[index].id as String),);
                });
          },)),
          /// TODO: GetX dapat menginstance controller baru,
          /// dan di dalam controllernya bersifat observable, sehingga memiliki behaviour sama seperti obx
          /// dengan kelebihan bisa di panggil di class lain yang membutuhkan controller tersebut
          Expanded(child: GetX<NewFilmController>(
            init: NewFilmController(),
            builder: (controllerFilms) {
            return ListView.builder(
                itemCount: controllerFilms.newFilms.length,
                itemBuilder: (context, index) {
                  return Container(child: Text(controllerFilms.newFilms[index].id as String),);
                });
          },)),
        ],
      ),
    );
  }

}