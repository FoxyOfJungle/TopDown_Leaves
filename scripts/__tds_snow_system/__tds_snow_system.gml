
// Basic Leaf System, by FoxyOfJungle
// https://foxyofjungle.itch.io/

function LeavesEmitter(snow_sprite) constructor {
	__timer = 0;
	__leaf_list = [];
	__leaf_data = {
		sprite : snow_sprite,
		img_number : sprite_get_number(snow_sprite),
	}
	__wind_dir = 0;
	
	static step = function(x, y, wind_dir, flakes_per_second, idle_time,  fall_speed_min, fall_speed_max, hspeed_min, hspeed_max, y_delimiter_min, y_delimiter_max) {
		__wind_dir = wind_dir;
		if (__timer++ >= flakes_per_second) {
			var _leaf = {
				sprite : __leaf_data.sprite,
				index : irandom(__leaf_data.img_number),
				fall_speed : random_range(fall_speed_min, fall_speed_max),
				hsp : random_range(hspeed_min, hspeed_max),
				delimiter : random_range(y_delimiter_min, y_delimiter_max),
				destroy_time : idle_time,
				xx : x,
				yy : y,
				alpha : 1,
				xscale : choose(1, -1),
				yscale : choose(1, -1),
				angle : 0,
				color : c_white,
				timer : 0,
				state : 0,
				way : choose(1, -1),
			}
			array_push(__leaf_list, _leaf);
			__timer = 0;
		}
	}
	
	static draw = function() {
		var isize = array_length(__leaf_list)-1, i = isize;
		repeat(isize) {
			with(__leaf_list[i]) {
				if (state == 0) {
					// move leaf
					angle -= hsp * pi;
					timer += 0.05 * way;
					xx += (sin(timer) + dcos(other.__wind_dir)) * hsp;
					yy += fall_speed;
					if (yy > delimiter) state = 1;
				} else {
					// destroy leaf after idle timer
					destroy_time -= 1;
					if (destroy_time <= 0) {
						alpha -= 0.01;
						if (alpha <= 0) {
							array_delete(other.__leaf_list, i, 1);
						}
					}
				}
				// draw snowflakes
				var _rr = round(angle / 45) * 45;
				draw_sprite_ext(sprite, index, xx, delimiter+1, xscale, yscale, _rr, c_black, power(yy/delimiter, 16) * alpha);
				draw_sprite_ext(sprite, index, xx, yy, xscale, yscale, _rr, color, alpha);
			}
			--i;
		}
	}
}
