
# Phone Holder

This is a 3D telephone headset holder that can be hung on the partition wall with your colleague opposite. The openscad model can be parameterized to adjust the dimensions.

## Authors

- [@witabix33](https://github.com/witabix33)


## Acknowledgements

- the inovation experts at my company's FAB LAB
- the tutorial authors who helped me with this first project
- to my colleagues who went through the first, not-so-pretty versions


## Demo
See the fowllowing ressource files in this project : 

**OpenScad script**
- [phone_holder_demo.scad](https://github.com/witabix33/scad_phone_holder/blob/main/files/phone_holder_demo.scad) file should be used to a 3D Demo. However it is not suitable for printing.
You will NOT find any corresponding *.STL file , as the demo may not be printed directly.
For printing, use more suitable *.SCAD ou *.STL files in this project. 

**Pictures**
- [phone_holder_demo.png](https://github.com/witabix33/scad_phone_holder/blob/main/images/phone_holder_demo.png) : this picture shows the computed phone holder in open scad
- [phone_holder_demo_front+split.png](https://github.com/witabix33/scad_phone_holder/blob/main/images/phone_holder_demo_front%2Bsplit.png) : this picture shows the computed phone holder in open scad with splited parts
- [phone_holder_demo_back.png](https://github.com/witabix33/scad_phone_holder/blob/main/images/phone_holder_demo_back.png) : this picture shows the computed phone holder back in open scad
- [phone_holder_demo_under+split.png](https://github.com/witabix33/scad_phone_holder/blob/main/images/phone_holder_demo_under%2Bsplit.png) : his picture shows the computed phone holder in open scad with splited parts
- [phone_holder_inuse_x600.png](https://github.com/witabix33/scad_phone_holder/blob/main/images/phone_holder_inuse_x600.png) : this photograph shows the phone holder after it has been printed


## Related

Here are some related resources that you may use

- [OpenScad](https://openscad.org/)  is software for creating solid 3D CAD objects.
It is free software and available for Linux/UNIX, MS Windows and Mac OS X. 
This model has been written with OpenScad. You may need this tool if you want to change some size parameters.
- [Ultimaker Cura](https://ultimaker.com/software/ultimaker-cura/)  is free, easy-to-use 3D printing software trusted by millions of users. Fine-tune your 3D model with 400+ settings for the best slicing and printing results. 
This model has been scliced with Cura. However, you may choose and other slicer. The project includes *.STL files.


## Roadmap

- Remove remaining holes
- More lightweight printing
- More documentation if required


## Screenshots
See images folder on this project

![Phone holder in use](https://github.com/witabix33/scad_phone_holder/blob/main/images/phone_holder_inuse_x600.png)


## Usage/Examples

**Il you want to adjust size**
- [phone_holder_parts.scad](https://github.com/witabix33/scad_phone_holder/blob/main/files/phone_holder_parts.scad) : his file describe any part (OpenScad modules) of the phone holder. It also contains dimension parameters that you may change. It is recommended to read documenation is this file and docs/[phone_holder.pdf](https://github.com/witabix33/scad_phone_holder/blob/main/docs/phone_holder.pdf) before changing any size parameter. Then test it whith [phone_holder_demo.scad](https://github.com/witabix33/scad_phone_holder/blob/main/files/phone_holder_demo.scad) script.

**If you just want to see before printing**
- [phone_holder_demo.scad](https://github.com/witabix33/scad_phone_holder/blob/main/files/phone_holder_demo.scad) : this file draws the phone holder, on its support wall. The file may be adapted to reflect your needs. Just open this file in OpenScad and see the result.
- module wall(), draws the wall. Wall sizing might be done changing this module and/or parameters just before

Adjust parameters to your needs in phone_holder_demo.scad file

- isDemoMode=false : will draw as assembled, while true will draw parts with some distance (as exploded) 
- isTextEnabled=true : will draw the text on the advertiser. Drawing text requires ressources.
- hasPin=true : will draw holes and assemby pins
- hasAdvertiser=true : will draw the advertiser on the front

**If you want to print**
The phone_holder_demo.scad is not suitable to print.

Printing might be done using these scripts *.SCAD (OpenScad) or *.STL  as input for your slicer :
- [phholder_p.scad](https://github.com/witabix33/scad_phone_holder/blob/main/files/phholder_p.scad) : printing any part
- [phholder_p1.scad](https://github.com/witabix33/scad_phone_holder/blob/main/files/phholder_p1.scad) : printing only the holder part
- [phholder_p2.scad](https://github.com/witabix33/scad_phone_holder/blob/main/files/phholder_p2.scad) : printing without the holder part
- [phholder_padv.scad](https://github.com/witabix33/scad_phone_holder/blob/main/files/phholder_padv.scad) : printing the advertiser only
- [phholder_phol.scad](https://github.com/witabix33/scad_phone_holder/blob/main/files/phholder_phol.stl) : priting the phone holder part only




## Documentation

Each *.SCAD file is fully commented.
See also resources in docs directory

- ![phone_holder.pdf](https://github.com/witabix33/scad_phone_holder/blob/main/docs/phone_holder.pdf) : Phone holder main parts and variables that may be changed to adapt to your needs


## License
See [LICENCE](https://github.com/witabix33/scand_phone_holder/blob/main/LICENSE) file

