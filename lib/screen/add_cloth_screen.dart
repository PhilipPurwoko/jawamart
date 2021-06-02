import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/clothes_provider.dart';

class AddClothScreen extends StatefulWidget {
  static final String routeName = '/add-cloth';

  @override
  _AddClothScreenState createState() => _AddClothScreenState();
}

class _AddClothScreenState extends State<AddClothScreen> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  bool _isLoading = false;
  String _id;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _imgUrlController = TextEditingController();

  void _createPlaceholder(Cloth arg) {
    if (arg != null) {
      _id = arg.id;
      _nameController.text = arg.name;
      _descController.text = arg.desc;
      _priceController.text = arg.price.toString();
      _imgUrlController.text = arg.imgUrl;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _descController.dispose();
    _imgUrlController.dispose();
    super.dispose();
  }

  void _toggleLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  void _saveCloth(ClothesProvider clothesProvider, BuildContext ctx) {
    final bool isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    _form.currentState.save();
    _toggleLoading();

    final Cloth cloth = Cloth(
      id: _id,
      name: _nameController.text,
      price: double.parse(_priceController.text),
      desc: _descController.text,
      imgUrl: _imgUrlController.text,
    );

    clothesProvider.addCloth(cloth).then((_) {
      _toggleLoading();
      Navigator.of(ctx).pop();
    }).catchError((error) {
      showDialog(
        context: ctx,
        builder: (BuildContext bc) => AlertDialog(
          title: Text('Error'),
          content: Text('Server or Network error'),
          actions: [
            TextButton(
              onPressed: () {
                _toggleLoading();
                Navigator.of(bc).pop();
              },
              child: Text('Close'),
            )
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final ClothesProvider clothesProvider =
        Provider.of<ClothesProvider>(context, listen: false);
    Cloth arg = ModalRoute.of(context).settings.arguments;
    _createPlaceholder(arg);

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Cloth'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              _saveCloth(clothesProvider, context);
            },
          )
        ],
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Form(
                key: _form,
                child: ListView(
                  children: <Widget>[
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(labelText: 'Name'),
                      textInputAction: TextInputAction.next,
                      validator: (String name) {
                        if (name.isEmpty) {
                          return 'Name cannot be empty';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _priceController,
                      decoration: InputDecoration(labelText: 'Price'),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      validator: (String price) {
                        if (price.isEmpty) {
                          return 'Price cannot be empty';
                        } else if (double.tryParse(price) == null) {
                          return 'Price number is not valid';
                        } else if (double.parse(price) <= 0) {
                          return 'Price cannot below or equal zero';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _descController,
                      decoration: InputDecoration(labelText: 'Description'),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.multiline,
                      maxLines: 3,
                      validator: (String desc) {
                        if (desc.isEmpty) {
                          return 'Description cannot be empty';
                        } else if (desc.length <= 200) {
                          return 'Description is too short (Minimum 200 character)';
                        } else if (desc.length >= 230) {
                          return 'Description is too long (Maximum 230 character)';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _imgUrlController,
                      decoration: InputDecoration(labelText: 'Image Url'),
                      textInputAction: TextInputAction.done,
                      validator: (String url) {
                        if (url.isEmpty) {
                          return 'URL cannot be empty';
                        } else if (!url.startsWith('http') &&
                            !url.endsWith('.png') &&
                            !url.endsWith('.jpg') &&
                            !url.endsWith('.jpeg')) {
                          return 'URL is not valid image url (Only support png, jpg and jpeg)';
                        }
                        return null;
                      },
                    ),
                    ElevatedButton(
                      child: Text('Save Cloth'),
                      onPressed: () {
                        _saveCloth(clothesProvider, context);
                      },
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
