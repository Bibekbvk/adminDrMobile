import 'package:flutter/material.dart';


class MedicalItem{
  final int itm_id;
  final String name;
  final String otherName;
  final String company;
  final String price;
  final String quantity;
  final String description;
  final String tags;
  final String images;




  MedicalItem(
      {this.itm_id,
      this.name,
      this.otherName,
      this.company,
      this.price,
      this.quantity,
      this.description,
      this.tags,
      this.images
     });
}
