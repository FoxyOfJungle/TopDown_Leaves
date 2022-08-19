
// run leaf system
var wind_dir = point_direction(room_width/2, 0, mouse_x, mouse_y);
leaf_system.step(random_range(-200, room_width+200), 0, wind_dir, 15, 60, 1, 2, 1, 3, room_height/2-150, room_height/2+220);
