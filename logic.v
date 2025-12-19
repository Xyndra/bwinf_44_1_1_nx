module main

import datatypes

struct Intersection {
	start   u8
	end     u8
	day     string
	classes []Class
}

fn find_intersections(classes []Class) []Intersection {
	// seperate classes by day
	mut classes_by_day := map[string][]Class{}
	for cls in classes {
		if cls.day !in classes_by_day {
			classes_by_day[cls.day] = []Class{}
		}
		classes_by_day[cls.day] << cls
	}

	mut intersections := []Intersection{}
	for day, day_classes in classes_by_day {
		mut time_points_set := datatypes.Set[u8]{}
		for cls in day_classes {
			time_points_set.add(cls.start)
			time_points_set.add(cls.end)
		}
		mut time_points_arr := time_points_set.array()
		time_points_arr.sort()
		for i in 0 .. time_points_arr.len - 1 {
			start := time_points_arr[i]
			end := time_points_arr[i + 1]

			mut overlapping_classes := []Class{}
			for cls in day_classes {
				if cls.start <= start && cls.end >= end {
					overlapping_classes << cls
				}
			}

			intersections << Intersection{
				start:   start
				end:     end
				day:     day
				classes: overlapping_classes
			}
		}
	}
	return intersections
}
