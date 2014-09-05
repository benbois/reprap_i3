$fn=30;
diamM3=6.25+.2;

holder();

module holder()
{
	difference()
	{
		holder_plain();
		holder_void();
	}
}

module holder_plain()
{
	//base
	cube([50.5, 8.5, 4], true);
	
	//top fix
	translate([0, 0, 6.25]) cube([28, 8.5, 8.5], true);
	
	//sides
	for(i=[-1,1]) mirror([(i==1)?1:0, 0, 0])
	{
		hull()
		{
			intersection()
			{
				translate([-25-1.75, -8.5/2, 0]) cylinder(r=8.5, h=4, center=true, $fn=60);
				translate([-32, 0, 0]) cube([10, 8.5, 4], true);
			}
			translate([-25.25, -4.25, 0]) rotate([0, 0, 43.5]) translate([-15, 9.5/2, 0]) cylinder(r=9.5/2, h=4, center=true);
			translate([-26.25, 0, 0]) cube([2, 8.5, 4], true);
			translate([-25.25, -4.22, 0]) rotate([0, 0, 43.5]) translate([-1.45, 1, 0]) cube([12, 6, 4], center=true);
		}
		
		translate([-25.25, -4.22, 0]) rotate([0, 0, 43.5]) hull()
		{
			translate([-2.45, 1, 6.95]) rotate([90, 0, 0]) cylinder(r=5, h=6, center=true);
			translate([-1.45, 1, -1.5]) cube([12, 6, 1], center=true);
		}
	}
}

module holder_void()
{
	//top fix
	translate([0, -4.75, 11]) rotate([40, 0, 0]) cube([28.5, 4, 4], true);

	//top holes
	translate([0, -.8, 6.25]) rotate([90, 0, 0]) cylinder(r=2.95, h=4);
	translate([0, 0, 6.25]) rotate([90, 0, 0]) cylinder(r=1.65, h=10, center=true);

	//sides hole
	for(i=[-1,1]) mirror([(i==1)?1:0, 0, 0]) translate([-25.25, -4.22, 0]) rotate([0, 0, 43.5])
	{
		translate([-2.45, 1.5, 6.95]) rotate([90, 0, 0]) cylinder(r=1.7, h=20, center=true);
		translate([-2.45, -.52, 6.95]) rotate([90, 0, 0]) rotate([0, 0, 30]) cylinder(r=diamM3/2, h=3, center=true, $fn=6);
	}
}

