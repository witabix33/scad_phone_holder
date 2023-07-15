/* 
* File : phone_holder_demo.scad (was: phone_holder_main.scad)
* Author : witabix33  (https://github.com/witabix33)
* Description : A very simple phone headset holder that can be placed on a work position separator
*
* This is the main file to draw a complete phone_holder for DEMO
* This file includes drawing the wall with same dimensions as real
 * this may help to validate
* This file is NOT adapted to print because parts are viewed assembled
*
* To change size of phone holder, see beginng of phone_holder_parts.scad file
*
* Version 04 bld 28.04.2023
*/
include <phone_holder_parts.scad>


$fa = 1;
$fs = 0.4;
$fn = 40;  // resolution might be low for demo mode
/* main_assemble module - final assembly
 * isDemoMode : true => move separate items to default_demo_separate distance
 * isTextEnabled : true => draw text : slower
 * hasH2Hole : draws a hole on horizontal H2 part of holder (see part_holder_frame)
 * hasV3Hole : draws a hole on vertical V3 part of holder (see part_holder_frame)
 * hasPin : true=> draw pins / false => draw holes
 * hasAdvertiser : draw with advertiser in front
 */
module main_assemble(isDemoMode=false, isTextEnabled=false, hasH2Hole=false, hasV3Hole=true, hasPin=false, hasAdvertiser=true) {
    demoDistance=isDemoMode?default_demo_separate:0;    
    
    // draw holder frame part
    part_holder_frame(hasH2Hole=hasH2Hole, hasV3Hole=hasV3Hole);
    
    // draw headphone holder part 
    translate([0, -default_holder_h1_length -default_ph_width/2 -default_ph_width_border/2 +default_holder_part_height/2 + default_ph_width_margin/2, 
    default_holder_v1_length -default_holder_v2_length + default_holder_part_height -default_ph_base_height + demoDistance])
        rotate([90,90,0])
            part_headphones_holder();
    
    // draw add advertiser part with default_demo_separate distance
    if (hasAdvertiser) {
        translate([0,-(default_holder_h1_length +default_holder_h2a_length) +default_holder_part_height -demoDistance ,
        default_holder_v1_length -default_holder_v2_length +default_holder_v3_length/2 
    ])
        rotate([90, 00, 00])
        part_advertise(isTextEnabled=isTextEnabled, hasPin=hasPin);      
    }
}

/*
 * module wall
 * draw the wall that separates people
 * for integration testing ONLY :: not to be printed...
 * -----------------------------------
 * This is the typical wall structure
 *        <-   w_larg  ->
 *        |-------------|   height=w_h1
 *        __           __   width=w_w1  height=w_h2
 *          _         _     width=w_w2 
 *           |       |
 *           |       |
 * wall height is w_haut
 * wall length is w_long
 */
// wall dimensions - this should be correled to holder dimensions
w_long=200;
w_larg=35;
w_haut=100;
w_h1=9;
w_w1=10;
w_h2=20;
w_w2=5;
module wall() {
    translate([0,w_w1+w_w2,0]) 
        cube([w_long,w_larg-2*w_w1-2*w_w2,w_haut-w_h1-w_h2]);
    translate([0,w_w2,w_haut-w_h1 -w_h2]) 
        cube([w_long, w_larg-2*w_w2, w_h2]);
    translate([0,0,w_haut-w_h1]) 
        cube([w_long, w_larg, w_h1]);    
}
/* ----------------------------- */
/** draw normal demo version : holder appears flat on the wall **/
 translate([-w_long/2,-w_larg-default_holder_part_height/2 -default_holder_h1_innerMargin,default_holder_v1_length-w_haut-default_holder_part_height])
    %wall(); // wall shows transparent
 main_assemble(isDemoMode=false, isTextEnabled=true, hasPin=true, hasAdvertiser=true);
 /** **/
/** more reality : holder appears leanig on the wall 
translate([-w_long/2,-w_larg-default_holder_part_height/2 -default_holder_h1_innerMargin,default_holder_v1_length-w_haut-default_holder_part_height])
    %wall(); // wall shows transparent
translate([0,0,3])
    rotate([4,0,0])
        main_assemble(isDemoMode=false, isTextEnabled=true, hasPin=true);
 /** **/
