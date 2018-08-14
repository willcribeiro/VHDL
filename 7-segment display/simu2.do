vsim vhd2
add wave *

force sw(3) 0 0ns, 1 5ns -repeat 10ns
force sw(2) 0 0ns, 1 10ns -repeat 20ns
force sw(1) 0 0ns, 1 20ns -repeat 40ns
force sw(0) 0 0ns, 1 40ns -repeat 80ns

run 160ns