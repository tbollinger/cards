/** 
 * Simple card collection divider
 *
 * @param characters string Characters to be cut out from the tab
 * @param position int Position for the tab on the card (max depends on string length)
 * @param thickness int Thickness of the divider itself
 */
module cardDivider(characters, position=1, thickness=2){
    card_width = 63;
    card_height = 88;
    tab_width = 11;
    tab_height = 6;

    // Represent full card
    cube([card_width, card_height, thickness]);
    
    // Create tab at top of card
    translate([0, card_height, 0])

    difference() {
      translate([(position - 1) * tab_width, 0, 0])
      cube([tab_width, tab_height, thickness]);
        //@TODO: Fancy text centering stuff
        
        // z - 1 & thickness + 2 for cut out text (must be pushed through shape)
        translate([(position - 1) * tab_width + 1, 0, -1])
        linear_extrude(thickness + 2)
        text(characters, 5);
    };
}
