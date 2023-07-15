/* 
* File : phholder_p2.scad (was: phone_holder_print1.scad)
* Author : witabix33  (https://github.com/witabix33)
* Description : A very simple phone headset holder that can be placed on a work position separator
* This is the main file to print ONLY holder frame
* File name has been shortened to help conversion to STL and GCOD that printers like being short
*
* Version 04 bld 28.04.2023
*/
include <phone_holder_parts.scad>


$fa = 1;
$fs = 0.4;
$fn = 70;  // resolution may be icreased to have a better result
/* main_assemble module - final assembly
 * isTextEnabled : true => also print text
  * hasPin : true=> draw pins / false => draw holes
 */
module main_assemble(isTextEnabled=false, hasPin) {
    printDistance=15; // distance between parts
    
    // draw holder frame part
    rotate([0,90,0])
        translate([-default_holder_width/2,0,0])
            part_holder_frame(hasH2Hole=false, hasV3Hole=true);
 /***   
    // draw cales
    cales_y_distance=default_cale_height + printDistance; 
    translate([default_cale_height/2, cales_y_distance,0])
        rotate([270,0,0])
            part_cale(); // ! bug ! don't invoke hasPin param
    translate([2*default_cale_height + printDistance, cales_y_distance, 0])        
        rotate([90,180,0])
            part_cale();  // ! bug ! don't invoke hasPin param
    
    // draw headphone holder part
    headphones_y_distance = cales_y_distance + default_ph_width + printDistance;
    translate([0, headphones_y_distance, 0 ])
        rotate([90,90,0])
            part_headphones_holder();  // ! bug ! don't invoke hasPin param

    // draw add advertiser part with default_demo_separate distance
    advertiser_y_distance = headphones_y_distance + default_holder_h2_length/2 + 2*printDistance;
    translate([0,advertiser_y_distance,default_holder_part_height/2 ])
        rotate([00, 00, 00])
        part_advertise(isTextEnabled, hasPin);      
        
    // draw pins not within parts
    pin_y_distance=advertiser_y_distance + printDistance;
    if (! hasPin) {
        translate([default_holder_h2_length + printDistance ,pin_y_distance, +default_assembly_height/2 ])
            part_assembly_pin(aWidth=default_assembly_height*3/2); // for advertise support
        
        translate([default_holder_h2_length + printDistance ,pin_y_distance - 2*default_assembly_height, +default_assembly_height/2 ])
            part_assembly_pin(); // for headphone holder
        
        translate([default_holder_h2_length + printDistance ,pin_y_distance - 4*default_assembly_height, +default_assembly_height/2 ])
            part_assembly_pin(); // for cale 1
        
        translate([default_holder_h2_length + printDistance ,pin_y_distance - 6*default_assembly_height, +default_assembly_height/2 ])
            part_assembly_pin(); // for cale 2
    }
    ***/
}
 main_assemble(isTextEnabled=true, hasPin=false);

