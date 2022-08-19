# TopDown_Leaves

Basic, but cool 2D fallen leaves for top down games
It doesn't use objects for each snow, nor the built-in particle system.

![8456](https://user-images.githubusercontent.com/52144406/185656553-4af177f5-70f2-445d-acab-3f693fa883a3.gif)

Image (screenshot, not tileset) used by https://cainos.itch.io/pixel-art-top-down-basic

# Usage:

```gml
// create leaf emitter
leaf_system = new LeavesEmitter(__tds_spr_leaves);
```
```gml
// run leaf system
var wind_dir = point_direction(room_width/2, 0, mouse_x, mouse_y);
leaf_system.step(random_range(-200, room_width+200), 0, wind_dir, 15, 60, 1, 2, 1, 3, room_height/2-150, room_height/2+220);
```
```gml
// draw leaf system
leaf_system.draw();
```
