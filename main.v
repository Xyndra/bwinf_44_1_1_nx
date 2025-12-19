module main

fn main() {
	classes := parse_file(input_or_default('Enter the path to the input: ', @VMODROOT + '/resources/ball00.txt'))
	intersections := find_intersections(classes)

	// could also be integrated in the find_intersections function, but this is cleaner
	mut max_count := 0
	mut max_intersection := Intersection{}
	for intersection in intersections {
		mut count := 0
		for class in intersection.classes {
			count += class.size
		}
		if count > max_count {
			max_count = count
			max_intersection = intersection
		}
	}

	println('Maximum number of students in one room at the same time: ${max_count}')
	// Possible improvement: print all the times this happens, not just one
	println('One time this happens is on ${max_intersection.day} from ${max_intersection.start} to ${max_intersection.end} o\'clock')
	println('The classes in this time slot are:')
	for class in max_intersection.classes {
		println('- ${class.identifier} with ${class.size} students')
	}
}
