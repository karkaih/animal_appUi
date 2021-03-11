import 'dart:ui';

import 'package:flutter/material.dart';

class Characters_widgets {
  final String name;
  final String imagepath;

  final String descriptions;

  final List<Color> colors;

  Characters_widgets([this.name, this.imagepath, this.descriptions, this.colors]);
}

List chracters = [
  Characters_widgets(
      "Panther",
      "assets/images/Panther.png",
      "Melanism in the jaguar is conferred by a dominant allele, and in the leopard (Panthera pardus) by a recessive allele. Close examination of the colour of these black cats will show that the typical markings are still present, but are hidden by the excess black pigment melanin, giving an effect similar to that of printed silk. This is called ghost striping. Melanistic and non-melanistic animals can be littermates. It is thought that melanism may confer a selective advantage under certain conditions since it is more common in regions of dense forest, where light levels are lower.[citation needed] Recently, preliminary studies also suggest that melanism might be linked to beneficial mutations in the immune system.",
      [Colors.orange.shade200, Colors.deepOrange.shade400]),
  Characters_widgets(
      "Buffalo",
      "assets/images/Buffalo.png",
      "The skin of river buffalo is black, but some specimens may have dark, slate-coloured skin. Swamp buffalo have a grey skin at birth, but become slate blue later. Albinoids are present in some populations. River buffalo have comparatively longer faces, smaller girths, and bigger limbs than swamp buffalo. Their dorsal ridges extend further back and taper off more gradually. Their horns grow downward and backward, then curve upward in a spiral. Swamp buffalo are heavy-bodied and stockily built; the body is short and the belly large. The forehead is flat, the eyes prominent, the face short, and the muzzle wide. The neck is comparatively long, and the withers and croup are prominent. A dorsal ridge extends backward and ends abruptly just before the end of the chest. Their horns grow outward, and curve in a semicircle, but always remain more or less on the plane of the forehead. The tail is short, reaching only to the hocks. Height at withers is 129–133 cm (51–52 in) for males, and 120–127 cm (47–50 in) for females. They range in weight from 300–550 kg (660–1,210 lb), but weights of over 1,000 kg (2,200 lb) have also been observed.[1]",
      [Colors.pink.shade200, Colors.redAccent.shade400]),
];
