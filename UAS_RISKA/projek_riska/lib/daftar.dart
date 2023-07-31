import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DaftarPage extends StatefulWidget {
  @override
  _DaftarPageState createState() => _DaftarPageState();
}

class _DaftarPageState extends State<DaftarPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  List<dynamic> users = [];

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('http://127.0.0.1/read.php'));
    if (response.statusCode == 200) {
      setState(() {
        users = jsonDecode(response.body);
      });
    }
  }

  Future<void> addUser() async {
    final response = await http.post(
      Uri.parse('http://127.0.0.1/create.php'),
      body: {
        'nama': nameController.text,
        'email': emailController.text,
        'phone': phoneController.text,
      },
    );
    print(response.body);
    fetchData();
  }

  Future<void> updateUser(dynamic user) async {
    final response = await http.post(
      Uri.parse('http://127.0.0.1/update.php'),
      body: {
        'id': user['id'].toString(),
        'nama': nameController.text,
        'email': emailController.text,
        'phone': phoneController.text,
      },
    );
    print(response.body);
    fetchData();
  }

  Future<void> deleteUser(dynamic user) async {
    final response = await http.post(
      Uri.parse('http://127.0.0.1/delete.php'),
      body: {
        'id': user['id'].toString(),
      },
    );
    print(response.body);
    fetchData();
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DAFTAR SISWA'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Nama'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: phoneController,
                decoration: InputDecoration(labelText: 'Nomor Telepon'),
              ),
            ),
            ElevatedButton(
              onPressed: addUser,
              child: Text(
                'Tambah Siswa',
                selectionColor: Colors.pinkAccent,
              ),
            ),
            SizedBox(height: 20),
            DataTable(
              columns: [
                DataColumn(label: Text('ID')),
                DataColumn(label: Text('Nama')),
                DataColumn(label: Text('Email')),
                DataColumn(label: Text('Nomor Telepon')),
                DataColumn(label: Text('Aksi')),
              ],
              rows: users.map((user) {
                return DataRow(cells: [
                  DataCell(Text(user['id'].toString())),
                  DataCell(Text(user['nama'])),
                  DataCell(Text(user['email'])),
                  DataCell(Text(user['phone'])),
                  DataCell(
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            nameController.text = user['nama'];
                            emailController.text = user['email'];
                            phoneController.text = user['phone'];
                          },
                          child: Text('Edit'),
                        ),
                        SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: () => deleteUser(user),
                          child: Text('Hapus'),
                        ),
                      ],
                    ),
                  ),
                ]);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
