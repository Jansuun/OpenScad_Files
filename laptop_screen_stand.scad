corner_radius = 10;
left_offset = 4;
right_offset = 9;
down_offset = 7;
up_offset = 3;
x_panel = 360;
y_panel = 218;
x_foil = 282;
y_foil = 11;
f_foil = 37;
x_screen = x_panel - (right_offset + left_offset);
y_screen = y_panel - (up_offset + down_offset + y_foil);
//length = 381;
//width = 230;
x_edge = 8;
y_edge = 8;
x_housing = (x_edge * 2) + x_panel + (right_offset-left_offset);
y_housing = (y_edge * 2) + y_panel + y_foil;



color("red")  create_base(x_housing,y_housing,corner_radius);
color("lime") translate ([0,0,4]) create_insert(x_housing,y_housing,corner_radius);
color("cyan") translate ([0,0,8]) create_top(x_housing,y_housing,corner_radius);

module create_top(x,y,r)
{
    difference(){
        create_base(x,y,r);
        translate([(left_offset+(right_offset-left_offset))+x_edge,(down_offset+y_edge+y_foil)]){
            square([x_screen,y_screen]);
        }
    }
}


module create_insert(x,y,r){
    difference(){
        create_base(x,y,r);
        translate([(right_offset-left_offset)+x_edge,(down_offset+y_edge+y_foil)]){
                create_screen();
        }
    }
}

module create_screen(){
    square([x_panel,y_panel - y_foil]);
    translate([f_foil, -y_foil]){
        square([x_foil,y_foil]);
    }
}

module create_base(x,y,r){
    difference(){
        square([x,y]);
        translate([0,0]){
            rotate([0,0,0]){
                corner_rounding(r);
            }
        }    
        translate([0,y]){
            rotate([0,0,270]){
                corner_rounding(r);
            }
        }
        translate([x,0]){
            rotate([0,0,90]){
                corner_rounding(r);
            }
        }
        translate([x,y]){
            rotate([0,0,180]){
                corner_rounding(r);
            }
        }
    }
}
module corner_rounding(r)
{       
   translate([r / 2, r / 2])

        difference() {
            square([r + 0.01, r + 0.01], true);

            translate([r/2, r/2])
                circle(r = r, center = true);

        }
}