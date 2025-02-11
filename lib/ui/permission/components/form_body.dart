import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormBody extends StatelessWidget {
  const FormBody({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final formController = TextEditingController();
    final toController = TextEditingController();
    String dropValueCategories = "Please Choose : ";
    var categoriesList = <String> [
      "Please Choose :",
      "Sick",
      "Teaching",
      "Go Home",
      "D*e"
      "Others"
    ];
    // kalo mau diubah jadi warna pake Map atau Dynamic

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            controller: nameController,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              labelText: "Your Name",
              labelStyle: TextStyle(
                fontSize: 14,
                color: Colors.black
              ),
              hintText: "masukin yaak nama ente",
              hintStyle: TextStyle(
                fontSize: 14,
                color: Colors.grey
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey)
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.blueAccent)
              )
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10,10,10,20),
            child: Text(
              "Description",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.blueAccent,
                style: BorderStyle.solid,
                width: 1,
              )
            ),
            child: DropdownButton(
              dropdownColor: Colors.white,
              value: dropValueCategories,
              onChanged :(value) {
                dropValueCategories = value.toString();
              },
              items:  categoriesList.map((value) {
                return DropdownMenuItem(
                  value: value.toString(),
                  child: Text(
                    value.toString(),
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      ),
                    )
                  );
                }).toList(),
                // method tolist berfungsi untuk mengkonversi data acak jadi urut pada
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black
                ), 
                underline: Container(
                  height: 2,
                  color: Colors.blueGrey,
                ),
                isExpanded: true,
              // onChanged: onChanged
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        "From",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          readOnly: true,
                          onTap: () async {
                            // pke async karna sebuah future date picker
                            DateTime? pickDate = await showDatePicker(
                              context: context, 
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2025), 
                              lastDate: DateTime(2028)
                            );
                            if (pickDate != null) {
                              // utk konversi data detail tanggal yg diambil dari picker date jadi format dd mm yyyy
                              formController.text = DateFormat('dd/mm/yyyy').format(pickDate);
                            }
                          },
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black
                          ),
                          controller: formController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(8),
                            hintText: "Starting from",
                            hintStyle: TextStyle(
                              fontSize: 16,
                              color: Colors.grey
                            )
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(width: 14),
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        "Until : ",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          readOnly: true,
                          onTap: () async {
                            DateTime? pickDate = await showDatePicker(
                              context: context, 
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2025), 
                              lastDate: DateTime(2028)
                            );
                             if (pickDate != null) {
                              // utk konversi data detail tanggal yg diambil dari picker date jadi format dd mm yyyy
                              formController.text = DateFormat('dd/mm/yyyy').format(pickDate);
                            }
                          },
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black
                          ),
                          controller: toController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(8),
                            hintText: "Until",
                            hintStyle: TextStyle(
                              fontSize: 16,
                              color: Colors.grey
                            )
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          )
        ]
      ),
    );
  }
}