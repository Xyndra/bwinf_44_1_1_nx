module main

import os

struct Class {
	identifier string
	day        string
	start      u8
	end        u8
	size       u16
}

fn parse_file(file_path string) []Class {
	content := os.read_file(file_path) or {
		panic('Failed to read file: ${err}')
	}
	lines := content.split_into_lines().map(it.trim_space())
	mut classes := []Class{}

	for i, line in lines {
		if i == 0 || line == '' {
			continue
		}
		parts := line.split(' ')
		if parts.len != 5 {
			panic('Invalid line format(${i}): ${line}')
		}
		identifier := parts[0].trim_space()
		day := parts[1].trim_space()
		start := parts[2].trim_space().u8()
		end := parts[3].trim_space().u8()
		size := parts[4].trim_space().u16()

		class := Class{
			identifier: identifier
			day:        day
			start:      start
			end:        end
			size:       size
		}
		classes << class
	}
	return classes
}
