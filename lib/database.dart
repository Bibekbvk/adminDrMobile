import 'package:drmobileadmin/Menu/insertstaff.dart';
import 'package:drmobileadmin/module/Feedback.dart';
import 'package:drmobileadmin/module/Medicine.dart';
import 'package:drmobileadmin/module/Staff.dart';
import 'package:drmobileadmin/module/medicalItem.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'constant.dart';
import 'module/volinteer.dart';
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

       Future<String> insertVolunteer(String ID, String name, String location, String contact, String type, String details, String email, String image) async {
        //var encodeduuid = Uri.encodeComponent(uuid)
        //var encodeProduct_id = Uri.encodeComponent(product_id);
        var data = await http.get(
          "$BASE_URL/api/insertVolunteer?V_ID=${ID}&name=${name}&location=${location}&contact=${contact}&type=${type}&details=${details}&email=${email}&image=${image}",
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

       Future<int> deleteMedicine(String id) async {
        //var encodeduuid = Uri.encodeComponent(uuid)c
        //var encodeProduct_id = Uri.encodeComponent(product_id);
        var data = await http.get(
          "$BASE_URL/api/deleteMedicine?med_id=${id}",
        );
        return data.statusCode;
      }




   Future<int> deleteFeedback(String id) async {
        //var encodeduuid = Uri.encodeComponent(uuid)c
        //var encodeProduct_id = Uri.encodeComponent(product_id);
        var data = await http.get(
          "$BASE_URL/api/deleteFeedback?UID=${id}",
        );
        return data.statusCode;
      }

         Future<int> deletestaff(String id) async {
        //var encodeduuid = Uri.encodeComponent(uuid)c
        //var encodeProduct_id = Uri.encodeComponent(product_id);
        var data = await http.get(
          "$BASE_URL/api/deletestaff?staff_id=${id}",
        );
        return data.statusCode;
      }

       Future<int> deleteMedicalItems(String id) async {
        //var encodeduuid = Uri.encodeComponent(uuid)c
        //var encodeProduct_id = Uri.encodeComponent(product_id);
        var data = await http.get(
          "$BASE_URL/api/deletemedicalitem?itm_id=${id}",
        );
        return data.statusCode;
      }

          Future<int> deleteVolunteer(String id) async {
        //var encodeduuid = Uri.encodeComponent(uuid)c
        //var encodeProduct_id = Uri.encodeComponent(product_id);
        var data = await http.get(
          "$BASE_URL/api/deletevolunteer?V_ID=${id}",
        );
        return data.statusCode;
      }




    Future<List<Medicine>> medicine() async {
    var data = await http.get(
      "$BASE_URL/api/medicine",
    );

    var jsonData = json.decode((data.body));

    List<Medicine> medicines = [];
    for (var each in jsonData) {
      Medicine medicineDetails = Medicine(
        med_id: each['med_id'],
        brand_name: each['brand_name'],
        generic_name: each['generic_name'],
        company: each['company'],
        price: each['price'],
        quantity: each['quantity'],
         description: each['description'],
         tags: each['tags'],
         images: each['images']
      );
      medicines.add(medicineDetails);
    }
    return medicines;
  }

    Future<List<Feedbacks>> feedbacks() async {
    var data = await http.get(
      "$BASE_URL/api/feedbacks",
    );

    var jsonData = json.decode((data.body));

    List<Feedbacks> feedbacksList = [];
    for (var each in jsonData) {
      Feedbacks feedbackDetails = Feedbacks(
        UID: each['UID'],
        Name: each['Name'],
        feedback: each['feedback'],
  
      );
      feedbacksList.add(feedbackDetails);
    }
    return feedbacksList;
  }












   Future<List<MedicalItem>> medical() async {
    var data = await http.get(
      "$BASE_URL/api/medical",
    );

    var jsonData = json.decode((data.body));

    List<MedicalItem> medicals = [];
    for (var each in jsonData) {
      MedicalItem medicalDetails = MedicalItem(
        itm_id: each['itm_id'],
        name: each['name'],
        otherName: each['otherName'],
        company: each['company'],
        price: each['price'],
        quantity: each['quantity'],
         description: each['description'],
         tags: each['tags'],
         images: each['images']
      );
      medicals.add(medicalDetails);
    }
    return medicals;
  }





     Future<List<Volunteer>> volunteer() async {
        var data = await http.get(
          "$BASE_URL/api/volunteer",
        );
    
        var jsonData = json.decode((data.body));
    
        List<Volunteer> volunteer = [];
        for (var each in jsonData) {
          Volunteer vlDetails = Volunteer(
            V_ID: each['V_ID'],
            name: each['name'],
            location: each['location'],
            contact: each['contact'],
            details: each['details'],
            email: each['email'],
            image: each['image'],
           
          );
          volunteer.add(vlDetails);
        }
        return volunteer;
      }

      
   Future<List<Staffs>> staff() async {
    var data = await http.get(
      "$BASE_URL/api/staff",
    );

    var jsonData = json.decode((data.body));

    List<Staffs> staffs = [];
    for (var each in jsonData) {
      Staffs staffsList = Staffs(
        staff_id: each['staff_id'],
        name: each['name'],
        staff_type: each['staff_type'],
        location: each['location'],
        fee: each['fee'],
        reg_no: each['reg_no'],
         photo: each['photo'],
      );
      staffs.add(staffsList);
    }
    return staffs;
  }

    }
    
  