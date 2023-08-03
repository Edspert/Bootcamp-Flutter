import 'package:elearning/data/services/firebase_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:elearning/presentation/auth/regist_form/regist_form_controller.dart';

import '../../../core/values/colors.dart';
import '../../../routes/routes.dart';
import '../../widgets/form_text_field_widget.dart';

class RegistFormPage extends StatefulWidget {
  const RegistFormPage({Key? key}) : super(key: key);

  @override
  State<RegistFormPage> createState() => _RegistFormPageState();
}

class _RegistFormPageState extends State<RegistFormPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _fullNameTextController = TextEditingController();
  final TextEditingController _schoolNameTextController = TextEditingController();
  String? selectedKelas;
  String jenisKelamin = '';

  bool isAllValid = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegistFormController>(
      builder: (controller) {
        String email = controller.firebaseAuthService.getCurrentSignedInUserEmail() ?? '';

        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Yuk isi data diri',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            backgroundColor: Colors.white,
          ),
          body: Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                Container(
                  child: Text('Email'),
                ),
                TextField(
                  readOnly: true,
                  controller: TextEditingController(
                    text: email,
                  ),
                ),
                SizedBox(height: 24),
                Text('Nama Lengkap'),
                TextFormField(
                  obscureText: true,
                  controller: _fullNameTextController,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.minLength(6),
                  ]),
                ),
                SizedBox(height: 24),
                Text('Nama Sekolah'),
                TextFormField(
                  controller: _schoolNameTextController,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.minLength(6),
                  ]),
                ),
                DropdownButtonFormField(
                  value: selectedKelas,
                  items: [
                    DropdownMenuItem(child: Text('Kelas 10'), value: '10'),
                    DropdownMenuItem(child: Text('Kelas 11'), value: '11'),
                    DropdownMenuItem(child: Text('Kelas 12'), value: '12'),
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedKelas = value;
                    });
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.offAllNamed(Routes.dashboard);
                    // debugPrint('Nama Lengkap: ${_fullNameTextController.text}');
                    // Get.snackbar('Valid?', '${_formKey.currentState!.validate()}', snackPosition: SnackPosition.BOTTOM);
                    // if (_formKey.currentState!.validate() == true) {
                    //   if (selectedKelas != null) {
                    //     if (jenisKelamin != '') {
                    //       // TODO: call RegistFormController.registerUser()
                    //       // Sementara redirect ke Dashboard Page, tapi nanti harus call RegistFormController.registerUser()
                    //       Get.snackbar('Valid!!!', '.......', snackPosition: SnackPosition.BOTTOM);
                    //       Get.offAllNamed(Routes.dashboard);
                    //     } else {
                    //       Get.snackbar(
                    //         'Invalid!!!',
                    //         'Jenis Kelamin Harus Diisi!',
                    //         backgroundColor: Colors.red,
                    //       );
                    //     }
                    //   } else {
                    //     Get.snackbar('Invalid!!!', 'Kelas Harus Diisi!',
                    //         backgroundColor: Colors.red, snackPosition: SnackPosition.BOTTOM);
                    //   }
                    // } else {
                    //   Get.snackbar(
                    //     'Invalid!!',
                    //     'blablabla',
                    //     snackPosition: SnackPosition.TOP,
                    //     backgroundColor: Colors.blue,
                    //   );
                    // }
                  },
                  child: const Text('DAFTAR'),
                ),
              ],
            ),
          ),
        );
      },
    );

    return GetBuilder<RegistFormController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              'Yuk isi data diri',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          body: Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                const Text('Email'),
                TextFormField(
                  controller: controller.emailTextController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  enabled: false,
                ),
                SizedBox(height: 16),
                const Text('Nama Lengkap'),
                TextFormField(
                  controller: _fullNameTextController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    hintText: 'contoh: Ihsan Adireja',
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.minLength(6),
                    FormBuilderValidators.email(),
                  ]),
                ),
                SizedBox(height: 16),
                const Text('Nama Sekolah'),
                TextFormField(
                  controller: _schoolNameTextController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    hintText: 'Nama Sekolah',
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.minLength(6),
                  ]),
                ),
                DropdownButton<String?>(
                  value: selectedKelas,
                  items: ['10', '11', '12']
                      .map((element) => DropdownMenuItem<String?>(
                            child: Text('Kelas $element'),
                            value: element,
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      if (value != null) {
                        selectedKelas = value;
                      }
                    });
                  },
                ),
                Row(
                  children: [
                    Expanded(
                      child: Material(
                        type: MaterialType.transparency,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              jenisKelamin = 'Laki-laki';
                            });
                          },
                          borderRadius: BorderRadius.circular(8),
                          child: Ink(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              color: jenisKelamin == 'Laki-laki' ? AppColors.primary.withOpacity(0.7) : AppColors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Color(0xFFD6D6D6)),
                            ),
                            child: Text(
                              'Laki-laki',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            jenisKelamin = 'Perempuan';
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: jenisKelamin == 'Perempuan' ? Colors.green : Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Color(0xFFD6D6D6),
                              width: 1,
                            ),
                          ),
                          child: Text(
                            'Perempuan',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: isRadioSelected(
                                currentValue: jenisKelamin,
                                radioValue: 'Laki-laki',
                              )
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate() == true) {
                      if (selectedKelas != null) {
                        if (jenisKelamin != '') {
                          // TODO: call RegistFormController.registerUser()
                          // Sementara redirect ke Dashboard Page, tapi nanti harus call RegistFormController.registerUser()
                          Get.snackbar('Valid!!!', '.......', snackPosition: SnackPosition.BOTTOM);
                          Get.offAllNamed(Routes.dashboard);
                        } else {
                          Get.snackbar(
                            'Invalid!!!',
                            'Jenis Kelamin Harus Diisi!',
                            backgroundColor: Colors.red,
                          );
                        }
                      } else {
                        Get.snackbar('Invalid!!!', 'Kelas Harus Diisi!',
                            backgroundColor: Colors.red, snackPosition: SnackPosition.BOTTOM);
                      }
                    } else {
                      Get.snackbar(
                        'Invalid!!',
                        'blablabla',
                        snackPosition: SnackPosition.TOP,
                        backgroundColor: Colors.blue,
                      );
                    }
                  },
                  child: const Text('DAFTAR'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  bool isRadioSelected({
    required String currentValue,
    required String radioValue,
  }) {
    return currentValue == radioValue;
  }
}
