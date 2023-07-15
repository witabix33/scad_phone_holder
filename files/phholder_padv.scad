/* 
* File : phholder_padv.scad 
* Author : witabix33  (https://github.com/witabix33)
* Description : A very simple phone headset holder that can be placed on a work position separator
*
* This is the main file to print ONLY advertiser part
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

    // draw advertiser part ONLY
    translate([0,0,default_adv_height/2])
        part_advertise(isTextEnabled=isTextEnabled, hasPin=hasPin)   ;   
}
 main_assemble(isTextEnabled=true, hasPin=false);

