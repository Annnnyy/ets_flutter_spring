import 'package:flutter/material.dart';
import 'package:ets_flutter_spring/personal detail.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/services.dart';
import 'package:ets_flutter_spring/entities/api_service.dart';

class CompanyDetail extends StatefulWidget {
  @override
  State<CompanyDetail> createState() => _CompanyDetailState();
}

class _CompanyDetailState extends State<CompanyDetail> with AutomaticKeepAliveClientMixin{
  final _myFormKey = GlobalKey<FormState>();

  TextEditingController companyNameController = TextEditingController();
  TextEditingController companyPhoneController = TextEditingController();
  TextEditingController companyEmailController = TextEditingController();
  TextEditingController designationController = TextEditingController();
  TextEditingController companyAddressController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController locationController = TextEditingController();


  @override
  bool get wantKeepAlive => true;

  String countryValue = "";
  String stateValue = "";
  String cityValue = "";
  @override
  Widget build(BuildContext context) {
    super.build(context);
    String companyName = companyNameController.text;
    String companyPhone= companyPhoneController.text;
    String companyEmail= companyEmailController.text;
    String companyDesignation= designationController.text;
    String companyAddress= companyAddressController.text;
    String zipCode= zipCodeController.text;

    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Scrollbar(
            thumbVisibility: false, //always show scrollbar
            thickness: 10, //width of scrollbar
            radius: const Radius.circular(20), //corner radius of scrollbar
            scrollbarOrientation:
                ScrollbarOrientation.right, //which side to show scrollbar
            child: SingleChildScrollView(
              child: Form(
                key: _myFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: companyNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter company\'s name';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.groups),
                        prefixIconColor: primaryColor,
                        labelText: 'Company Name',
                        labelStyle: const TextStyle(
                            color: secondaryColor, fontWeight: FontWeight.bold),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: secondaryColor),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: companyPhoneController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your company\'s mobile number';
                        }
                        if (value.length != 10) {
                          return 'Please enter a valid phone number';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.phone),
                        prefixIconColor: primaryColor,
                        labelText: 'Company Phone No.',
                        labelStyle: const TextStyle(
                            color: secondaryColor, fontWeight: FontWeight.bold),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: secondaryColor),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: companyEmailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an email address';
                        }
                        return EmailValidator.validate(value)
                            ? null
                            : 'Please enter a valid email';
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email),
                        prefixIconColor: primaryColor,
                        labelText: 'Email',
                        hintText: 'Enter your company\'s email address',
                        labelStyle: const TextStyle(
                            color: secondaryColor, fontWeight: FontWeight.bold),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: secondaryColor),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: designationController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your designation';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.business_center),
                        prefixIconColor: primaryColor,
                        labelText: 'Designation',
                        labelStyle: const TextStyle(
                            color: secondaryColor, fontWeight: FontWeight.bold),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: secondaryColor),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: companyAddressController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.business),
                        prefixIconColor: primaryColor,
                        labelText: 'Company Address',
                        labelStyle: const TextStyle(
                            color: secondaryColor, fontWeight: FontWeight.bold),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: secondaryColor),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    CSCPicker(
                      flagState: CountryFlag.ENABLE,
                      layout: Layout.vertical,
                      countrySearchPlaceholder: "Country",
                      stateSearchPlaceholder: "State",
                      citySearchPlaceholder: "City",

                      ///labels for dropdown
                      countryDropdownLabel: "Country",
                      stateDropdownLabel: "State",
                      cityDropdownLabel: "City",
                      onCountryChanged: (country) {
                        setState(() {
                          countryValue = country ?? "";
                        });
                      },
                      onStateChanged: (state) {
                        setState(() {
                          stateValue = state ?? "";
                        });
                      },
                      onCityChanged: (city) {
                        setState(() {
                          cityValue = city ?? "";
                        });
                      },
                      dropdownDecoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(15)),
                        color: Colors.white,
                        border: Border.all(color: secondaryColor, width: 1.5),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: zipCodeController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.pin_drop),
                        prefixIconColor: primaryColor,
                        labelText: 'Zip Code',
                        labelStyle: const TextStyle(
                            color: secondaryColor, fontWeight: FontWeight.bold),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: secondaryColor),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        if(_myFormKey.currentState?.validate() == true) {
                          try {
                            final response = await ApiService
                                .registerOrganization(
                              companyName: companyNameController.text,
                              companyPhone: companyPhoneController.text,
                              companyEmail: companyEmailController.text,
                              companyDesignation: designationController.text,
                              companyAddress: companyAddressController.text,
                              zipCode: zipCodeController.text,
                              country: countryValue,
                              state: stateValue,
                              city: cityValue,
                            );

                            // Handle the response here
                            print(response);
                          } catch (e) {
                            // Handle exceptions or errors here
                            print(e);
                          }
                        } },
                      child: const Text('Next',
                          style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.bold)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 15),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
