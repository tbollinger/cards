/** 
 * Simple card collection divider
 *
 * @param characters string Characters to be cut out from the tab
 * @param position int Position for the tab on the card (max depends on string length)
 * @param thickness int Thickness of the divider itself
 */
module cardDivider(characters, position = 1, thickness = 2){
    card_x = 63;
    card_y = 88;
    tab_x = 11;
    tab_y = 6;

    // Represent full card
    cube([card_x, card_y, thickness]);
    
    // Create tab at top of card
    translate([0, card_y, 0])

    difference() {
      translate([(position - 1) * tab_x, 0, 0])
      cube([tab_x, tab_y, thickness]);
        //@TODO: Fancy text centering stuff
        
        // z - 1 & thickness + 2 for cut out text (must be pushed through shape)
        translate([(position - 1) * tab_x + 1, 0, -1])
        linear_extrude(thickness + 2)
        text(characters, 5);
    };
}

module cardHolder(num_cards = 100, double_sleeved = false, thickness = 2){
    card_x = 63;
    card_y = 88;
    card_z = 0.3;
    perimeter_gap = 1.5;
    //@TODO: Add size for just single sleeves, and just penny sleeves
    if (double_sleeved) {
        card_z = 0.7;
    }
    difference() {
      cube([
        card_x + thickness + perimeter_gap,
        card_y + thickness + perimeter_gap,
        card_z * num_cards + thickness
      ]);
      translate([thickness/2, thickness/2, thickness])
      cube([
        card_x + perimeter_gap, 
        card_y + perimeter_gap, 
        card_z * num_cards + thickness + 1
      ]);
    }
}
