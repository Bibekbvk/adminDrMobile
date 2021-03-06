import 'package:drmobileadmin/Menu/insertmedicalitem.dart';
import 'package:drmobileadmin/Menu/insertstaff.dart';
import 'package:drmobileadmin/module/Feedback.dart';
import 'package:drmobileadmin/module/Medicine.dart';
import 'package:drmobileadmin/module/Staff.dart';
import 'package:drmobileadmin/module/invitation.dart';
import 'package:drmobileadmin/module/itemOrder.dart';
import 'package:drmobileadmin/module/medicalItem.dart';
import 'package:drmobileadmin/module/prescription.dart';
import 'package:drmobileadmin/module/question.dart';
import 'package:drmobileadmin/module/staffRegistration.dart';
import 'package:drmobileadmin/module/viewMedicineOrder.dart';
import 'package:drmobileadmin/module/volunteerRegs.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'constant.dart';
import 'module/volinteer.dart';

class DatabaseService {

  Future<List<StaffsReg>> staffResgis() async {
    var data = await http.get(
      "$BASE_URL/api/ViewStaffRegistration",
    );

    var jsonData = json.decode((data.body));
    print(jsonData);
    List<StaffsReg> staffsRegs = [];
    for (var each in jsonData) {
      StaffsReg abDetails = StaffsReg(
        user_id: each['user_id'],
        Name: each['Name'],
        reg_no: each['reg_no'],
        Contact: each['Contact'],
        location: each['location'],
      );
      staffsRegs.add(abDetails);
    }
    return staffsRegs;
  }

  Future<List<VolunteerReg>> VolResgis() async {
    var data = await http.get(
      "$BASE_URL/api/ViewVolunteerRegistration",
    );

    var jsonData = json.decode((data.body));
    print(jsonData);
    List<VolunteerReg> volsRegs = [];
    for (var each in jsonData) {
      VolunteerReg volsRegsDetails = VolunteerReg(
        user_id: each['user_id'],
        Name: each['Name'],
        reg_no: each['reg_no'],
        contact: each['Contact'],
        location: each['location'],
      );
      volsRegs.add(volsRegsDetails);
    }
    return volsRegs;
  }




  Future<String> insertSexEducation(String topic, String article1, String date,
      String image1, String article2, image2) async {
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

  Future<String> insertemergency(String ID, String name, String contact1,
      String contact2, String location) async {
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

  Future<int> insertstaff(String name, String staffType, String location,
      String fee, String reg_no, String photo) async {
    //var encodeduuid = Uri.encodeComponent(uuid)c
    //var encodeProduct_id = Uri.encodeComponent(product_id);
    var data = await http.get(
      "$BASE_URL/api/insertstaff?name=${name}&staff_type=${staffType}&location=${location}&fee=${fee}&reg_no=${reg_no}&photo=${photo}",
    );
    print("${data.statusCode}+codeeeeeeee");

    
  
    return data.statusCode;
  }

  Future<int> insertVolunteer(
      String ID,
      String name,
      String location,
      String contact,
      String type,
      String details,
      String email,
      String image) async {
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
    return data.statusCode;
  }

  Future<String> insertMedicine(
      String med_id,
      String brandName,
      String generic_name,
      String company,
      String price,
      String quantity,
      String description,
      String tags,
      String images) async {
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

  Future<String> insertMedicalitem(
      String itm_id,
      String name,
      String otherName,
      String company,
      String price,
      String quantity,
      String description,
      String tags,
      String images) async {
    //var encodeduuid = Uri.encodeComponent(uuid)c
    //var encodeProduct_id = Uri.encodeComponent(product_id);
    var data = await http.get(
      "$BASE_URL/api/insertMedicalItem?itm_id=${itm_id}&name=${name}&otherName=${otherName}&company=${company}&price=${price}&quantity=${quantity}&description=${description}&tags=${tags}&images=${images}",
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

  Future<String> insertabortion(String ID, String name, String location,
      String contact, String details, String images) async {
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

  Future<int> deleteMedicine(int id) async {
    //var encodeduuid = Uri.encodeComponent(uuid)c
    //var encodeProduct_id = Uri.encodeComponent(product_id);
    var data = await http.get(
      "$BASE_URL/api/deleteMedicine?med_id=${id}",
    );
    return data.statusCode;
  }

  Future<int> deleteFeedback(String id) async {
    var data = await http.get(
      "$BASE_URL/api/deleteFeedback?UID=${id}",
    );
    return data.statusCode;
  }

  Future<int> deleteInvitation(int I_id) async {
    var data = await http.get(
      "$BASE_URL/api/deleteInvitation?I_id=${I_id}",
    );
    return data.statusCode;
  }

  
  Future<int> deletepres(int I_id) async {
    var data = await http.get(
      "$BASE_URL/api/deletepres?I_id=${I_id}",
    );
    return data.statusCode;
  }

  Future<int> deletestaff(int id) async {
    //var encodeduuid = Uri.encodeComponent(uuid)c
    //var encodeProduct_id = Uri.encodeComponent(product_id);
    var data = await http.get(
      "$BASE_URL/api/deletestaff?staff_id=${id}",
    );
    return data.statusCode;
  }

  Future<int> deleteMedicalItems(int id) async {
    //var encodeduuid = Uri.encodeComponent(uuid)c
    //var encodeProduct_id = Uri.encodeComponent(product_id);
    var data = await http.get(
      "$BASE_URL/api/deletemedicalitem?itm_id=${id}",
    );
    return data.statusCode;
  }

    Future<int> deleteMedicalItemsOrder(int id) async {
    //var encodeduuid = Uri.encodeComponent(uuid)c
    //var encodeProduct_id = Uri.encodeComponent(product_id);
    var data = await http.get(
      "$BASE_URL/api/deletemedicalitemOrder?itmOrder_id=${id}",
    );
    return data.statusCode;
  }


    Future<int> deleteVolunterReg(int id) async {
    //var encodeduuid = Uri.encodeComponent(uuid)c
    //var encodeProduct_id = Uri.encodeComponent(product_id);
    var data = await http.get(
      "$BASE_URL/api/deleteVolunterReg?vr_id=${id}",
    );
    return data.statusCode;
  }

    Future<int> deletestaffsReg(int id) async {
    //var encodeduuid = Uri.encodeComponent(uuid)c
    //var encodeProduct_id = Uri.encodeComponent(product_id);
    var data = await http.get(
      "$BASE_URL/api/deletestaffsReg?user_id=${id}",
    );
    return data.statusCode;
  }

  Future<int> staffregistration(int id) async {
    //var encodeduuid = Uri.encodeComponent(uuid)c
    //var encodeProduct_id = Uri.encodeComponent(product_id);
    var data = await http.get(
      "$BASE_URL/api/staffregistration?user_id=${id}",
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

   Future<int> deleteMedicineOrder(int id) async {
    //var encodeduuid = Uri.encodeComponent(uuid)c
    //var encodeProduct_id = Uri.encodeComponent(product_id);
    var data = await http.get(
      "$BASE_URL/api/deleteMedicineOrder?order_id=${id}",
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
          images: each['images']);
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
        contact: each['contact'],
        Name: each['Name'],
        feedback: each['feedback'],
      );
      feedbacksList.add(feedbackDetails);
    }
    return feedbacksList;
  }


  Future<List<Invitation>> invitations() async {
    var data = await http.get(
      "$BASE_URL/api/invitations",
    );

    var jsonData = json.decode((data.body));

    List<Invitation> invitationList = [];
    for (var each in jsonData) {
      Invitation invitationDetails = Invitation(
          I_id: each['I_id'],
          user_id: each['user_id'],
          name: each['name'],
          staff_id: each['staff_id'],
          contact: each['contact']);
      invitationList.add(invitationDetails);
    }
    return invitationList;
  }



  Future<List<Prescriptions>> viewPrescription() async {
    var data = await http.get(
      "$BASE_URL/api/prescriptions",
    );

    var jsonData = json.decode((data.body));

    List<Prescriptions> PrescriptionsList = [];
    for (var each in jsonData) {
      Prescriptions PrescriptionsDetails = Prescriptions(
          Pres_id: each['Pres_id'],
          user_id: each['user_id'],
          contact: each['contact'],
          imgUrl: each['imgUrl'],
          description: each['description']);
      PrescriptionsList.add(PrescriptionsDetails);
    }
    return PrescriptionsList;
  }


  Future<List<Question>> questions() async {
    var data = await http.get(
      "$BASE_URL/api/qanda",
    );

    var jsonData = json.decode((data.body));

    List<Question> questionList = [];
    for (var each in jsonData) {
      Question questionDetails = Question(
          u_id: each['u_id'],
          q_id: each['q_id'],
          question: each['question'],
          answer: each['answer'],
          );
      questionList.add(questionDetails);
    }
    return questionList;
  }

 

Future<int> answer(String answer, int q_id) async {
    var data = await http
        .get("$BASE_URL/api/answer?u_id=${q_id}&answer=${answer}");
    return data.statusCode;
  }


  Future<List<Medicine_order>> med_order() async {
    var data = await http.get(
      "$BASE_URL/api/medicineorder",
    );

    var jsonData = json.decode((data.body));

    List<Medicine_order> medorderList = [];
    for (var each in jsonData) {
      Medicine_order medicineOrderDetails = Medicine_order(
          order_id: each['order_id'],
          user_id: each['user_id'],
          med_id: each['med_id'],
          user_contact: each['user_contact'],
          userName: each['userName']);
      medorderList.add(medicineOrderDetails);
    }
    return medorderList;
  }

  Future<List<Item_order>> itm_order() async {
    var data = await http.get(
      "$BASE_URL/api/ViewitemOrder",
    );

    var jsonData = json.decode((data.body));

    List<Item_order> itmorderList = [];
    for (var each in jsonData) {
      Item_order itemOrderDetails = Item_order(
          itmOrder_id: each['itmOrder_id'],
          user_id: each['user_id'],
          itm_id: each['itm_id'],
          user_contact: each['user_contact'],
          user_name: each['user_name']);
      itmorderList.add(itemOrderDetails);
    }
    return itmorderList;
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
          images: each['images']);
      medicals.add(medicalDetails);
    }
    return medicals;
  }


 Future<int> insertlogin(String email, String password) async {
    var data = await http
        .get("$BASE_URL/api/adminlogin?email=${email}&password=${password}");

    var jsonData = json.decode((data.body));

    //userid = jsonData[0]['u_id'];

    return data.statusCode;
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
        type: each['type'],
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
