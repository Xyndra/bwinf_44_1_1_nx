module main

import os

pub fn input_or_default(prompt string, default string) string {
	res := os.input_opt(prompt) or { return default }
	if res.trim_space() == '' {
		return default
	}
	return res
}
