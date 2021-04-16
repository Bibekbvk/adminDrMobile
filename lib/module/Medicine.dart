import 'package:flutter/material.dart';


class Medicine{
  final int med_id;
  final String brand_name;
  final String generic_name;
  final String company;
  final String price;
  final String quantity;
  final String description;
  final String tags;
  final String images;




  Medicine(
      {this.med_id,
      this.brand_name,
      this.generic_name,
      this.company,
      this.price,
      this.quantity,
      this.description,
      this.tags,
      this.images
     });
}
