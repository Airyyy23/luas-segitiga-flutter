import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tugas_luas_segitiga/LuasController.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _alasCtr = TextEditingController();
  TextEditingController _tinggiCtr = TextEditingController();
  final LuasController controller = Get.put(LuasController());

  @override
  void dispose() {
    _alasCtr.dispose();
    _tinggiCtr.dispose();
    super.dispose();
  }

  Widget _buildInputData(TextEditingController ctr, String label) {
    return TextField(
      controller: ctr,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))
      ],
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _buildContainer() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildInputData(_alasCtr, "Alas"),
        SizedBox(height: 16.0),
        _buildInputData(_tinggiCtr, "Tinggi"),
        SizedBox(height: 16.0),
        ElevatedButton(
          onPressed: () {
            controller.luasSegitiga(
                double.parse(_alasCtr.text), double.parse(_tinggiCtr.text));
          },
          child: Text('Hitung Luas'),
        ),
        SizedBox(height: 16.0),
        Obx(
          () => Text(
            '${controller.hasilLuas.value} cm²',
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Luas Segitiga'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: _buildContainer(),
      ),
    );
  }
}
