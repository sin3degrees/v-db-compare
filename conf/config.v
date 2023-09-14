module conf

import os
import json

struct Config {
	pub:
	db_src DB [json:"db_src"]
	db_dst DB [json:"db_dst"]
	tb_only []string [json:"tb_only"]
	tb_ignore []string [json:"tb_ignore"]
}

struct DB {
	pub:
	@type    string [json:"type"]
	host     string [json:"host"]
	port     string [json:"port"]
	database string [json:"database"]
	user     string [json:"user"]
	password string [json:"password"]
}

pub const dir = os.getwd()
pub const config = get_config()

fn get_config() Config {
	str := os.read_file(dir + "/config.json") or { panic(err) }
	// 读取配置文件
	c := json.decode(Config, str) or { panic(err) }
	return c
}
