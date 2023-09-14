module main

import conf

fn main() {
	println('Hello, World!')
	println(conf.config.db_src.host)
}
