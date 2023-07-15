/* 
* File : phholder_p2.scad (was: phone_holder_print2.scad)
* Author : witabix33  (https://github.com/witabix33)
* Description : A very simple phone headset holder that can be placed on a work position separator
*
* This is the main file to print WITHOUT holder frame
* File name has been shortened to help conversion to STL and GCOD that printers like being short
*
* Version 04 bld 28.04.2023
*/
include <phone_holder_parts.scad>


$fa = 1;
$fs = 0.4;
$fn = 70;  // resolution may be increased to have a better result
/* main_assemble module - final assembly
 * isTextEnabled : true => also print text
  * hasPin : true=> draw pins / false => draw holes
 */
module main_assemble(isTextEnabled=false, hasPin=false) {
    printDistance=15; // distance between parts
/**    
    // draw holder frame part
    rotate([0,90,0])
        translate([-default_holder_width/2,0,0])
            part_holder_frame();
**/        
    headphones_y_distance = printDistance*2.5;
    translate([0, headphones_y_distance, default_ph_width/2 ])
        rotate([00,0,90])
            part_headphones_holder();  // ! bug ! don't invoke hasPin param

    // draw add advertiser part with default_demo_separate distance
    advertiser_y_distance = headphones_y_distance + default_ph_width + printDistance;
    translate([0,advertiser_y_distance,default_holder_part_height/2 ])
        rotate([00, 00, 00])
        part_advertise(isTextEnabled=isTextEnabled, hasPin=hasPin);      
        
    // draw pins not within parts
    pin_y_distance=-default_holder_h1_length/2;
    if (! hasPin) {
        translate([0 ,pin_y_distance, +default_assembly_height/2 ])
            part_assembly_pin(aWidth=default_assembly_height*3/2); // pin for advertise support
                       
    }
}
 main_assemble(isTextEnabled=true, hasPin=false);

