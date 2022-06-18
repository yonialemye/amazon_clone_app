import 'dart:io';

import 'package:amazon_clone_app/commons/widgets/custom_button.dart';
import 'package:amazon_clone_app/commons/widgets/custom_textfield.dart';
import 'package:amazon_clone_app/constants/utils.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget {
  static const String routeName = '/add-product-screen';
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();

  String category = 'Mobiles';

  List<File> images = [];

  List<String> productCategories = [
    'Mobiles',
    'Essentials',
    'Appliances',
    'Books',
    'Fashion',
  ];

  @override
  void dispose() {
    productNameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    quantityController.dispose();
    super.dispose();
  }

  void selectImages() async {
    var imageHolder = await pickImages();
    setState(() {
      images = imageHolder;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF232f3f),
        centerTitle: true,
        title: const Text('Add Product'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Form(
          child: Column(
            children: [
              images.isNotEmpty
                  ? CarouselSlider(
                      items: images
                          .map((e) => Builder(
                                builder: (context) => ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.file(
                                    e,
                                    height: 190,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ))
                          .toList(),
                      options: CarouselOptions(
                        viewportFraction: 0.80,
                        height: 190,
                        padEnds: true,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        autoPlayCurve: Curves.decelerate,
                      ),
                    )
                  : InkWell(
                      onTap: selectImages,
                      child: DottedBorder(
                        color: Colors.grey[400]!,
                        dashPattern: const [10, 4],
                        child: SizedBox(
                          width: double.maxFinite,
                          height: 150,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.drive_folder_upload_outlined,
                                size: 70,
                                color: Colors.grey,
                              ),
                              SizedBox(height: 7),
                              Text(
                                'Select a product image',
                                style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 7),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  'Note: You should use a png image for better experiance',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black26,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: productNameController,
                hintText: 'Product name',
                errorMessage: 'Please enter a product name',
              ),
              const SizedBox(height: 10),
              CustomTextField(
                controller: descriptionController,
                hintText: 'Product description',
                errorMessage: 'Please enter a product description',
                maxLines: 5,
              ),
              const SizedBox(height: 10),
              CustomTextField(
                controller: productNameController,
                hintText: 'Product price',
                errorMessage: 'Please enter a product price',
              ),
              const SizedBox(height: 10),
              CustomTextField(
                controller: productNameController,
                hintText: 'Product quantity',
                errorMessage: 'Please enter a product quantity',
              ),
              const SizedBox(height: 10),
              Container(
                width: double.maxFinite,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: DropdownButton(
                  value: category,
                  elevation: 0,
                  isExpanded: true,
                  items: productCategories
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ),
                      )
                      .toList(),
                  onChanged: (String? value) {
                    setState(() {
                      category = value!;
                    });
                  },
                ),
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: 'Sell Product',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
