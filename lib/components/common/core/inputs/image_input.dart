import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fairshare/components/common/core/core.dart';
import 'package:fairshare/config/themes/colors.dart';
import 'package:fairshare/utils/utils.dart';

class ImageInput extends StatefulWidget {
  final String? imageUrl;
  final File? image;
  final Function(File image)? onImageSelected;
  final Function()? onImageRemoved;
  final bool readOnly;
  final Widget? placeholder;
  final double size;
  final bool circular;
  const ImageInput(
      {super.key, this.imageUrl, this.image, this.onImageSelected, this.onImageRemoved, this.readOnly = false, this.placeholder, this.size = 150, this.circular = false});

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  final borderRadius = BorderRadius.circular(8);
  final ImagePicker _picker = ImagePicker();
  bool loading = false;
  File? _image;

  void setImage(File image) {
    setState(() {
      _image = image;
      widget.onImageSelected?.call(_image!);
    });
  }

  @override
  void initState() {
    if (widget.imageUrl != null && widget.imageUrl!.isNotEmpty) {
      setState(() {
        loading = true;
      });
      urlToFile(widget.imageUrl!).then((file) {
        setImage(file);
      }).whenComplete(() {
        setState(() {
          loading = false;
        });
      });
    }
    if (widget.image != null) {
      setImage(widget.image!);
    }
    super.initState();
  }

  void onTap() async {
    if (!widget.readOnly) {
      final image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        setImage(File(image.path));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: widget.size,
        child: AspectRatio(
          aspectRatio: widget.circular ? 1 : 1.5,
          child: Stack(
            fit: StackFit.expand,
            children: [
              ClipRRect(
                borderRadius: widget.circular ? BorderRadius.circular(widget.size / 2) : borderRadius,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: _image == null ? AppColors.grayLight.withOpacity(0.5) : Colors.transparent,
                      width: widget.placeholder != null ? 0 : 1,
                    ),
                    borderRadius: widget.circular ? BorderRadius.circular(widget.size / 2) : borderRadius,
                  ),
                  child: _image == null
                      ? loading
                          ? Skeleton(width: screenWidth)
                          : widget.placeholder != null
                              ? GestureDetector(
                                  onTap: onTap,
                                  child: widget.placeholder!,
                                )
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.camera_alt_outlined, size: 40, color: AppColors.grayLight.withOpacity(0.5)),
                                    const SizedBox(height: 10),
                                    Text(
                                      AppLocalizations.of(context)!.uploadPicture,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                )
                      : ClipRRect(
                          borderRadius: borderRadius,
                          child: Image.file(
                            _image!,
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
              ),
              if (_image != null && !widget.readOnly)
                Positioned(
                  bottom: widget.circular ? 4 : 8,
                  right: widget.circular ? 4 : 8,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _image = null;
                        widget.onImageRemoved?.call();
                      });
                    },
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.75),
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black.withOpacity(0.1), width: 1),
                          ),
                          child: const Icon(
                            Icons.delete,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
