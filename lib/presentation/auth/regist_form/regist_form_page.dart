import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

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
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _fullNameTextController = TextEditingController();
  final TextEditingController _schoolNameTextController = TextEditingController();
  String? kelas;
  String jenisKelamin = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: IconButton(
          onPressed: () {},
          color: AppColors.black,
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text(
          'Yuk isi data diri',
          style: TextStyle(
            color: AppColors.black,
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(28),
          children: [
            const Text('Email'),
            TextFormField(
              controller: _emailTextController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                hintText: 'Email',
              ),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.email(),
              ]),
            ),
            SizedBox(height: 16),
            const Text('Nama Lengkap'),
            TextFormField(
              controller: _fullNameTextController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                hintText: 'Nama Lengkap',
              ),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.minLength(6),
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
              value: kelas,
              items: ['10', '11', '12']
                  .map((element) => DropdownMenuItem<String?>(
                        child: Text('Kelas $element'),
                        value: element,
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  if (value != null) {
                    kelas = value;
                  }
                });
              },
            ),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        jenisKelamin = 'Laki-Laki';
                      });
                    },
                    child: Container(
                      color: jenisKelamin == 'Laki-Laki' ? Colors.green : Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Text(
                        'Laki-Laki',
                        style: TextStyle(
                          color: jenisKelamin == 'Laki-Laki' ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        jenisKelamin = 'Perempuan';
                      });
                    },
                    child: Container(
                      color: jenisKelamin == 'Perempuan' ? Colors.green : Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Text('Perempuan',
                          style: TextStyle(
                            color: jenisKelamin == 'Perempuan' ? Colors.white : Colors.black,
                          )),
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate() == true) {
                  if (kelas != null) {
                    if (jenisKelamin != '') {
                      // TODO: call RegistFormController.registerUser()
                      // Sementara redirect ke Dashboard Page, tapi nanti harus call RegistFormController.registerUser()
                      Get.offAllNamed(Routes.dashboard);
                    } else {
                      Get.snackbar(
                        'Invalid!!!',
                        'Jenis Kelamin Harus Diisi!',
                        backgroundColor: Colors.red,
                      );
                    }
                  } else {
                    Get.snackbar(
                      'Invalid!!!',
                      'Kelas Harus Diisi!',
                      backgroundColor: Colors.red,
                    );
                  }
                  Get.snackbar('Valid!!!', '.......', snackPosition: SnackPosition.BOTTOM);
                } else {
                  Get.snackbar('Invalid!!', '.......');
                }
              },
              child: const Text('REGISTER'),
            ),
          ],
        ),
      ),
    );
  }
}
