import 'package:flutter/material.dart';
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
  final TextEditingController _nameTextController = TextEditingController();
  String kelas = '10';
  String jenisKelamin = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: IconButton(
          onPressed: () {},
          color: AppColors.black,
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          'Yuk isi data diri',
          style: TextStyle(
            color: AppColors.black,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(28),
        children: [
          Text('Email'),
          TextField(
            controller: _nameTextController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              hintText: 'Email',
            ),
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
                    padding: EdgeInsets.symmetric(vertical: 6),
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
                    padding: EdgeInsets.symmetric(vertical: 6),
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
              String email = _nameTextController.text;
              print('EMAIL: ${email} $kelas');

              // TODO: call
            },
            child: Text('REGISTER'),
          ),
        ],
      ),
    );
  }
}
