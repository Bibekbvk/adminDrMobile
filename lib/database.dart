import 'package:drmobileadmin/Menu/insertstaff.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'constant.dart';
class DatabaseService {
  
       Future<String> insertSexEducation(String topic, String article1, String date, String image1, String article2, image2) async {
        //var encodeduuid = Uri.encodeComponent(uuid)c
        //var encodeProduct_id = Uri.encodeComponent(product_id);
        var data = await http.get(
          "$BASE_URL/api/insertSexEducation?topic=${topic}&article1=${article1}&date=${date}&image1=${image1}&article2=${article2}&image2=${image2}",
        );
        print(data.body);
        var jsonData = json.decode((data.body));
        String val = jsonData["error"];
        if (val == null) {
          val = "";
        }
        print(val);
        return val;
      }



       Future<String> inserthelp(String topic, String image, String details) async {
        //var encodeduuid = Uri.encodeComponent(uuid)c
        //var encodeProduct_id = Uri.encodeComponent(product_id);
        var data = await http.get(
          "$BASE_URL/api/inserthelp?topic=${topic}&image=${image}&details=${details}",
        );
        print(data.body);
        var jsonData = json.decode((data.body));
        String val = jsonData["error"];
        if (val == null) {
          val = "";
        }
        print(val);
        return val;
      }

       Future<String> insertemergency(String ID, String name, String contact1, String contact2, String location) async {
        //var encodeduuid = Uri.encodeComponent(uuid)c
        //var encodeProduct_id = Uri.encodeComponent(product_id);
        var data = await http.get(
          "$BASE_URL/api/insertemergency?E_ID=${ID}&Name=${name}&Contact1=${contact1}&Contact2=${contact2}&location=${location}",
        );
        print(data.body);
        var jsonData = json.decode((data.body));
        String val = jsonData["error"];
        if (val == null) {
          val = "";
        }
        print(val);
        return val;
      }

       Future<String> insertstaff(String ID, String name, String staffType, String location, String fee, String reg_no, String photo) async {
        //var encodeduuid = Uri.encodeComponent(uuid)c
        //var encodeProduct_id = Uri.encodeComponent(product_id);
        var data = await http.get(
          "$BASE_URL/api/insertstaff?S_ID=${ID}&Name=${name}&staff_type=${staffType}&location=${location}&fee=${fee}&reg_no${reg_no}&photo=${photo}",
        );
        print(data.body);
        var jsonData = json.decode((data.body));
        String val = jsonData["error"];
        if (val == null) {
          val = "";
        }
        print(val);
        return val;
      }
      
        Future<String> insertMedicine(String med_id, String brandName, String generic_name, String company, String price, String quantity, String description, String tags, String images) async {
        //var encodeduuid = Uri.encodeComponent(uuid)c
        //var encodeProduct_id = Uri.encodeComponent(product_id);
        var data = await http.get(
          "$BASE_URL/api/insertMedicine?med_id=${med_id}&brand_name=${brandName}&generic_name=${generic_name}&company=${company}&price=${price}&quantity=${quantity}&description=${description}&tags=${tags}&images=${images}",
        );
        print(data.body);
        var jsonData = json.decode((data.body));
        String val = jsonData["error"];
        if (val == null) {
          val = "";
        }
        print(val);
        return val;
      }

    Future<String> insertabortion(String ID, String name, String location, String contact, String details, String images) async {
        //var encodeduuid = Uri.encodeComponent(uuid)c
        //var encodeProduct_id = Uri.encodeComponent(product_id);
        var data = await http.get(
          "$BASE_URL/api/insertAbortion?place_ID=${ID}&name=${name}&location=${location}&contact=${contact}&details=${details}&images=${images}",
        );
        print(data.body);
        var jsonData = json.decode((data.body));
        String val = jsonData["error"];
        if (val == null) {
          val = "";
        }
        print(val);
        return val;
      }






    }
    
  