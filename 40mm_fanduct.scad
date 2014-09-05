right=false;	// true vs false
$fn=60; 
holes=32/2;
fan=40;
fan();

module fan()
{
	difference()
	{
		plain();
		void();
	}

	if(right) difference()
	{
		intersection()
		{
			hull()
			{
				translate([0, 0, .5]) cylinder(r=fan/2, h=3, center=true);
				translate([0, -11, 50]) cube([(fan-3), 13, 1], true);
			}
			translate([-holes, holes, 0]) cylinder(r=7, h=40, center=true);
		}
		translate([-holes, holes, 0]) cylinder(r=6, h=40, center=true);
	}
	else difference()
	{
		intersection()
		{
			hull()
			{
				translate([0, 0, .5]) cylinder(r=fan/2, h=3, center=true);
				translate([0, -11, 50]) cube([(fan-3), 13, 1], true);
			}
			translate([holes, holes, 0]) cylinder(r=7, h=40, center=true);
		}
		translate([holes, holes, 0]) cylinder(r=6, h=40, center=true);
	}
}

module plain()
{
	//guides
	/*color("red")
	{
		translate([0, 41, 1.45+22.5]) cube([.2, .2, 45],true);
		translate([0, 36.1, 1.45]) cube([.2, 10, .2], true);

		translate([0, 21.42, 15+31.1]) cube([.2, 40, .2], true);
		translate([0, 1.42, 7.5+31.1]) cube([.2, .2, 15], true);
	}*/
	
	//translate([0, 15.55, 15.55]) rotate([-45, 0, 0]) 
	//{
	
	hull()
	{
		translate([0, 0, .5]) cylinder(r=fan/2, h=3, center=true);
		translate([0, -11, 50]) cube([(fan-3), 13, 1], true);
	}
		
	hull() for(i=[-1,1]) for(j=[-1,1])
	{
		translate([i*holes, 0, 0]) translate([0, j*holes, 0]) cylinder(r=4, h=2, center=true);
	}
	for(i=[-1,1]) for(j=[-1,1])
	{
		translate([i*holes, 0, 2]) translate([0, j*holes, 0]) cylinder(r=4, h=2, center=true);
	}
	
	//}
}

module void()
{
	//translate([0, 15.55, 15.55]) rotate([-45, 0, 0])
	//{
	
	for(i=[-1,1]) for(j=[-1,1])
	{
		translate([i*holes, 0, 0]) translate([0, j*holes, 0]) cylinder(r=1.7, h=10, center=true);
		translate([i*holes, 0, 5]) translate([0, j*holes, 0]) cylinder(r=3, h=4, center=true);
	}
	hull()
	{
		translate([0, 0, -.6]) cylinder(r=(fan-2.5)/2, h=1, center=true);
		translate([0, -11, 50]) cube([(fan-4.6), 11.6, 2], true);
	}
	
	translate([0, -8, 49]) rotate([35, 0, 0]) cube([fan+5, fan+5, 20], true);

	if(right)
	{
		difference()
		{
			translate([-24, 24, 0]) cube([48, 48, 6.1], true);
			cylinder(r=20, h=11, center=true, $fn=100);
		}
		translate([-holes, holes, 0]) cylinder(r=6, h=40, center=true);
	}
	else {
		difference()
		{
			translate([24, 24, 0]) cube([48, 48, 6.1], true);
			cylinder(r=20, h=11, center=true, $fn=100);
		}
		translate([holes, holes, 0]) cylinder(r=6, h=40, center=true);
	}
	
	//}
}
