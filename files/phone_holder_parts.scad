/* ---------------------------------------
* File : phone_holder_parts.scad
* Author : witabix33  (https://github.com/witabix33)
* Description : A very simple phone headset holder that can be placed on a work position separator
*
* This file handles parts and may not be used to draw or print
* At the end of this file - unit testing for each part
*
* The first lines of this file contains parameters in order to adjust the size. In this version, no size is controlled : please visually check, everything is OK for you.
* 
* Version 04 bld 28.04.2023
*/

/* ---------------------------------------
 * This section handles default values to print the phone handler
 */


/*
 * General dimension width & height=thickness parameters
 */
default_holder_width=30;
default_holder_part_height=4;
default_assembly_height=default_holder_part_height; // holes and assembly pins height
default_assembly_margin=0.4; // adjust to printer nozzle (typicalnot under) or you will not be able to assemble. Will be added to holes (see part_assembly_hole() 
default_mink_radius=0.8; // minkowski radius for rounded corners/edges
default_hole_heigth=10; // hole position from bottom TODO : specific to v1 ?

// default_distance for demo separated items
// works when isDemoMode parameter is set to true
default_demo_separate=25;

/*
 * holder part
 *
 *      h1
 *      ___
 *  v1 |   |
 *         | v2
 *         |
 *        _|___| v3
 *     h2b  h2a  / h2 (one part) = h2b + h2a
 *
 * The holder look like a hook
 * On h2a : between v2 and v3, you may put the phone holder
 * On v3 : you may attach an advertiser
 */
default_holder_v1_length=30+default_holder_part_height;
default_holder_h1_innerMargin=1; // margin each side between v1 and v2
default_holder_h1_length=35 +2*default_holder_part_height +2*default_holder_h1_innerMargin; // consider each side :  part height and inside margin
default_holder_v2_length=80;
default_holder_h2b_length=12; // length before v2
default_holder_h2a_length=35; // length after v2
default_holder_h2a_has_hole=true;  // has a hole
default_holder_h2_length=default_holder_h2b_length+default_holder_h2a_length;  // full length = h2b (before) + h2a (after)
default_holder_v3_length=20; // DO NOT go under 3*default_holder_part_height, see also default_ph_width
default_holder_v3_has_hole=true;    // has a hole

/* 
 * phoneholder part
 *  
 *       ------...         ^
 *      /       \__\       |
 *     /         \  \      | radius = height
 *     ___-----___\..\     v
 *    <--2xradius-><--> with = inner width + 2x border width
 *
 * The phone holder (ph) is an half cylinder with borders, an considering margin when placed in h2a (see holder)
 *
 * Parameters below automatically adjust size :
 * - width : computed, considering margin ,each size of phoneholder has borders
 * - inner width : available width to handle the headphone
 * - border width : each side ot the phone holder, there is a border
 * - height or radius for half cylinder
*/ 
default_ph_radius=default_holder_width; 
default_ph_radius_inside=default_ph_radius-2;   // radius fr inside cylinder/holder
default_ph_height=default_ph_radius; // radius=height => 1/2 cylinder
default_ph_width_margin=1;           // margin each side of cylinder - NOT below 0.4 (adjust to printer)
default_ph_width=default_holder_h2a_length - 2*default_holder_part_height-2*default_ph_width_margin; // phone holder width should hold on h2
default_ph_width_border=3; // width for border half cylinder/holder
default_ph_width_inside=default_ph_width-2*default_ph_width_border; // width for innner cylinder/holder
default_ph_hasPin=false;    // true=has pin | false=has hole
// default ph_base : alternative to pin / hole : remove a base to attach ph
default_ph_base_height=default_holder_part_height;  
default_ph_base_width=default_holder_width; 
//default_ph_base_length // NOT used : length is the same as ph_width
/*
 * advertiser part
 *
 *      ______
 *     /      \
 *    |  Text  |
 *     \      /
 *      ------
 * The advertiser part is a roud plate that supports text
 * It has a pin in the back side to handle it 
 * 
 */
default_adv_rFront=default_ph_radius;      // visible part radius = adjust to phone holder
default_adv_rBack=default_adv_rFront;      // under part radius - check print result when different to front
default_adv_height=default_holder_part_height;  // part height
// advertisement text properties
default_adv_font="Glass TTY VT220"; // font must  be installed on this system;
default_adv_font_size=10;
default_adv_text="Enjoy";
default_adv_text_enabled=false; // default :true = text = less speed

/* ---------------------------------------
 * Assembly pins
 * module part_assembly_pin(aWidth, aHeight)
 * Draw an assembly pin : square aWidth x aHeight x aHeight
 */
module part_assembly_pin(aWidth=default_assembly_height*2 ,aHeight=default_assembly_height) {
    //cube([width, depth, height]);
    //echo("part_assembly_pin(aWidth=",aWidth," ,aHeight=",aHeight,")");
    color ("green") cube([aWidth, aHeight, aHeight], center=true);
}
/* ---------------------------------------
 * Assembly holes
 * module part_assembly_hole(aWidth, aHeight, aMargin)
 * Draw an assembly pin hole : square -should be used in difference()
 * square aWidth x aHeight+aMargin x aHeight+aMargin
 */
module part_assembly_hole(aWidth=default_assembly_height*2 ,aHeight=default_assembly_height, aMargin=default_assembly_margin) {    
    
    //echo("part_assembly_hole(aWidth=",aWidth," ,aHeight=",aHeight," ,aMargin=",aMargin,")");
    color ("red") cube([aWidth, aHeight+aMargin, aHeight+aMargin], center=true);
}
/* ---------------------------------------
 * Parts for the phone handler frame 
 */
/*
 * module part_v1(aWidth, aLength,aHeight, aYHole)
 * Draw part v1 ,including square hole
 */
module part_v1(aWidth=default_holder_width, aLength=default_holder_v1_length, aHeight=default_holder_part_height,aYHole=default_hole_heigth) {
        
    mrfix=default_mink_radius*2; // fix object size
    minkowski() { 
        union() {
            cube([aWidth-mrfix, aLength-mrfix, aHeight-mrfix], center=true);    
            translate([0,-aLength/2+aHeight/2 ,aHeight-mrfix]) 
                cube([aWidth-mrfix,aHeight-mrfix,aHeight-mrfix], center=true);    }
        sphere(default_mink_radius);
    } 
}
// Draw part h1
module part_h1(aWidth=default_holder_width, aLength=default_holder_h1_length, aHeight=default_holder_part_height) {
    
    mrfix=default_mink_radius*2; // fix object size
    minkowski() {
        cube([aWidth-mrfix, aLength-mrfix, aHeight-mrfix], center=true);
        sphere(default_mink_radius);
    }
}
/*
 * Draw part v2 with rounded edges
 * 
 */
module part_v2_private(aWidth, aLength, aHeight, aMRfix) {
    cube([aWidth-aMRfix, aLength-aMRfix, aHeight-aMRfix], center=true);                   
}
module part_v2(aWidth=default_holder_width, aLength=default_holder_v2_length, aHeight=default_holder_part_height) {
    
    mrfix=default_mink_radius*2; // fix object size
    minkowski() {
        part_v2_private(aWidth=aWidth, aLength=aLength, aHeight=aHeight, aMRfix=mrfix); 
        sphere(default_mink_radius);
    }
}
//part_v2(); // DEBUG ONLY
/* 
 * Draw part h2 with rounded edges and hole
 * 
 * aWidth : width for the part
 * aLengthA : 2nd part for length (after v2)
 * aLengthB : 1st part for length (before v2)
 * aHeight : height for the part 
 * hasHole : should draw a Hole with margin @aHoleMargin
 * aHoleMargin : margin for each part of hole
 * consider Length = aLengthB (before) + aLengthA (after)
 * will draw a hole in the center of part after (i.e. middle of aLengthA x aWidth)
 */
module part_h2_private(aWidth, aLengthA, aLengthB, aHeight) {
    mrfix=default_mink_radius*2; // fix object size with minkowski effect
    minkowski() {
        cube([aWidth-mrfix, (aLengthB + aLengthA) -mrfix, aHeight-mrfix], center=true);    
        sphere(default_mink_radius);
    } 
}
module part_h2(aWidth=default_holder_width, aLengthA=default_holder_h2a_length, aLengthB=default_holder_h2b_length, aHeight=default_holder_part_height, hasHole=default_holder_h2a_has_hole, aHoleMargin=default_assembly_margin) {
        
    epsilon=0.1; // to erase surfaces in difference    
    difference() { 
        part_h2_private(aWidth, aLengthA, aLengthB, aHeight);   
        if (hasHole) {
            translate([0,-aLengthB/2,0]) // hole on h2a
                cube([default_assembly_height+aHoleMargin, default_assembly_height+aHoleMargin ,default_assembly_height+2*epsilon], center=true);
        }
    }
}
// Draw part v3 with rounded edges and hole
module part_v3_private(aWidth, aLength, aHeight) {
    mrfix=default_mink_radius*2; // fix object size
    minkowski() {
        cube([aWidth-mrfix, aLength-mrfix, aHeight-mrfix], center=true);        
        sphere(default_mink_radius);
    }
}
module part_v3(aWidth=default_holder_width, aLength=default_holder_v3_length, aHeight=default_holder_part_height, hasHole=default_holder_v3_has_hole, aHoleMargin=default_assembly_margin) {
    
    epsilon=0.1; // to erase surfaces in difference
    difference() {
        part_v3_private(aWidth, aLength, aHeight); 
        if (hasHole) {
           cube([default_holder_part_height+aHoleMargin, default_holder_part_height+aHoleMargin, default_holder_part_height+2*epsilon], center=true);
        }
    }
}
/* ---------------------------------------
 * module part_holder_frame
 * Draw holder frame with any part
*/
module part_holder_frame(aWidth=default_holder_width, aHeight=default_holder_part_height, hasH2Hole=default_holder_h2a_has_hole, hasV3Hole=default_holder_v3_has_hole) {
    
    union() {
    // part v1
    translate([0,0,default_holder_v1_length/2])
        rotate([90,0,0])
            part_v1(aLength=default_holder_v1_length);
    
    // part h1
    translate([0,(-default_holder_h1_length+default_holder_part_height)/2,
    default_holder_v1_length - default_holder_part_height/2 ])
        part_h1(aLength=default_holder_h1_length);
    
    // part v2
    translate([0,-default_holder_h1_length + default_holder_part_height, 
    default_holder_v1_length - default_holder_v2_length/2])
        rotate([90,0,0])
            part_v2(aLength=default_holder_v2_length);
    
    // part h2
    translate([0, -default_holder_h1_length -default_holder_h2_length/2 +default_holder_h2b_length +default_holder_part_height*3/2 , 
    default_holder_v1_length -default_holder_v2_length + default_holder_part_height/2])     
        part_h2(aLengthA=default_holder_h2a_length, aLengthB=default_holder_h2b_length, hasHole=hasH2Hole);
    
    // part v3
    translate([0,-default_holder_h1_length -default_holder_h2a_length + default_holder_part_height*2,
    default_holder_v1_length -default_holder_v2_length + default_holder_v3_length/2 ])    
        rotate([90,0,0])
            part_v3(aLength=default_holder_v3_length, hasHole=hasV3Hole);
    }    
}

/* ---------------------------------------
* module : part_headphones_holder_private 
* PRIVATE - raw headphone holder without any fixation hole
*
* aRadius : radius for holder
* aRadiusInside : radius for inside part of holder
* aHeight : only this height will be printed
* aWidth : cylinder width
* aWidthInside : width for inner cylinder
*/
module part_headphones_holder_private(aRadius, aRadiusInside,aHeight, aWidth, aWidthBorder, aWidthInside)  {
    
    // debug below : uncomment to see headphone holder dimensions
    //echo("part_headphones_holder_private(aRadius=",aRadius," ,aRadiusInside= ",aRadiusInside,",aHeight=",aHeight," ,aWidth=",aWidth," ,aWidthBorder= ",aWidthBorder,")"); // DEBUG
    
    epsilon=0.1; // to erase surfaces in difference
    difference() {   
       union() {                
            translate([0,0,aWidth/2 -aWidthBorder/2])
                cylinder(aWidthBorder,aRadiusInside,aRadius,center=true); // face 1 
            cylinder(h=aWidth-2*aWidthBorder, r=aRadiusInside, center=true); // inner
            translate([0,0,-(aWidth/2 -aWidthBorder/2)]) 
                cylinder(aWidthBorder,aRadius,aRadiusInside, center=true); // face 2 
        } // union
                
        // remove half cylinder
        translate([aRadius/2 ,0 ,0]) 
            cube([aRadius,2*aRadius,aWidth+2*epsilon], center=true);
    } // difference
}
//part_headphones_holder_private(aRadius=default_ph_radius, aRadiusInside=default_ph_radius_inside, aHeight=default_ph_height, aWidth=default_ph_width, aWidthBorder=default_ph_width_border, aWidthInside=default_ph_width_inside); // for DEBUG ONLY

/*
* module : part_headphones_holder
* draw headphone support to fix on holder with removed base
* aRadius : radius for holder
* aRadiusInside : radius for inside part of holder
* aHeight : only this height will be printed
* aWidth : cylinder width
* aWidthInside : width for inner cylinder
* -- specific parameter(s) for this version
* aBaseHeigth : base hole heigth
* aBaseWidth : base hole width
* [no param] : base hole length is the same as holder width
* aBaseMargin : apply a margin with width to be able to assemble
*/
module part_headphones_holder(aRadius=default_ph_radius, aRadiusInside=default_ph_radius_inside, aHeight=default_ph_height, aWidth=default_ph_width, aWidthBorder=default_ph_width_border, aWidthInside=default_ph_width_inside,aBaseHeight=default_ph_base_height, aBaseWidth=default_ph_base_width, aBaseMargin=default_assembly_margin)  {
    
    //debug below : uncomment to see headphone holder dimensions
    //echo("part_headphones_holder_2(aRadius=",aRadius," ,aRadiusInside= ",aRadiusInside,",aHeight=",aHeight," ,aWidth=",aWidth," ,aWidthBorder= ",aWidthBorder,",aWidthInside=",aWidthInside, ",aBaseWidth=",aBaseWidth, ",aBaseHeight=",aBaseHeight, ",aBaseMargin=",aBaseMargin, ")"); // DEBUG
    
    epsilon=0.1; // to erase surfaces in difference
    
    difference() {
        part_headphones_holder_private(aRadius, aRadiusInside, aHeight, aWidth, aWidthBorder, aWidthInside);
        translate([-default_ph_base_height/2,0,0]) 
            cube([aBaseHeight+epsilon, aBaseWidth+aBaseMargin, aWidth+epsilon], center=true);
    }
}
//part_headphones_holder(); // for DEBUG ONLY
/* ---------------------------------------
 * Advertiser part
 */
/*
* module write_text(aText=default_adv_text, aFontSize=default_adv_font_size, aFontFamily=default_adv_font)
* aText : text to show 
* aFontSize : Number : Choose font size [4:0.5:20]
* aFontFamily : String - Choose an installed font or install it from https://fonts.google.com/ 
* aHeight : height for extrusion. Should be half of support
*/
module write_text(aText=default_adv_text, aFontSize=default_adv_font_size, aFontFamily=default_adv_font, aHeight=default_adv_height/2 ) {
    
    linear_extrude(height = aHeight, convexity = 20) {
        text(text = aText, font = aFontFamily, size = aFontSize, halign = "center", valign = "bottom", spacing = 0.96);
    }
}
        
/*
 * module part_advertise_support()
 * Draw the advertise support
 *
 * aHeight : part height
 * aRFront : radius for front part
 * aRBack : radius for back part
 * hasPin : true=>draw a pin 
 * hasHole : true => draw a hole
 */
module part_advertise_support(aHeight=default_adv_height, aRFront=default_adv_rFront, aRBack=default_adv_rBack, hasPin=false, hasHole=true) { 
    
    //echo("part_advertise_support() aHeight=", aHeight); // DEBUG
    
    if (hasPin) {
        union() {
            cylinder(h=aHeight, r1=aRBack, r2=aRFront, center=true );
            
            translate([00, 00, -aHeight/2])
                rotate([00,90,0])
                    part_assembly_pin(aWidth=default_assembly_height*3/2);
        }
    } 
    if (hasHole) {
        difference() {
            cylinder(h=aHeight, r1=aRBack, r2=aRFront, center=true );
            
            translate([00, 00, -aHeight/2])
                rotate([00,90,0])
                    part_assembly_hole(aWidth=default_assembly_height*3/2);
        }
    }    
}
//part_advertise_support(hasPin=true, hasHole=true); // DEBUG only
/*
 * assemble advertise parts
 * module part_advertise (isTextEnabled, hasPin)
 * isTextEnabled : will print text : slower
 * hasPin : true => draw a pin
 * hasHole : true => draw a hole
 */
module part_advertise (aHeight=default_adv_height, aRFront=default_adv_rFront, aRBack=default_adv_rBack, isTextEnabled=default_adv_text_enabled, hasPin=false, hasHole=true) {
    epsilon=0.1; // to erase surfaces in difference
    
    //echo ("part_advertise() aHeight=",aHeight); // DEBUG
    
    if (isTextEnabled) {
        difference() {             
            part_advertise_support(aHeight=aHeight, aRFront=aRFront, aRBack=aRBack, hasPin=hasPin);
            translate([00,-default_adv_font_size/2 ,epsilon]) 
                write_text(aHeight=aHeight/2+epsilon, aFontSize=default_adv_font_size);
        }
    } else {
        part_advertise_support(aHeight=aHeight, aRFront=aRFront, aRBack=aRBack, hasPin=hasPin, hasHole=hasHole);
    }
}

//part_advertise(isTextEnabled=true, hasPin=true, hasHole=true); // DEBUG ONLY - enabled text will slow down
/* ---------------------------------------
* Below : for unit testing only or single printing 
* -----------------------------------------
*/

// part_holder_frame();

/**
%difference() {
    translate([10/2,0,0]) cube([10,10,10], center=true);
    part_assembly_hole();
}
part_assembly_pin(); **/

/**
translate([0,0,default_holder_v1_length/2])
  rotate([90,0,0]) 
      part_v1();
**/


//part_v1();

/**
 translate([0,-default_holder_h1_length + default_holder_part_height, 
    default_holder_v1_length - default_holder_v2_length/2])
    
    rotate([90,0,0])
        part_v2();
**/        

//part_v2();

//part_h2();
//rotate([0,90,0]) part_assembly_pin();

//part_v3();
//rotate([0,90,0]) part_assembly_pin();

//part_advertise(isTextEnabled=true, hasPin=true); // text will slow down

//part_headphones_holder(1);
//part_headphones_holder_2();
