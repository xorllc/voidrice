# How to set the scroll direction for a trackpad

1. From `xinput list`, determine the ID of the device. In my case, it's "10":
  1. Synaptics tm2964-001                      id=10   [slave  pointer  (2)]
2. From `xinput list-props 10 | grep -i "Natural Scrolling"`, note the configuration value and the value it's currently set to. 0 means off, 1 means on.
3. Run `xinput set-prop 10 311 1` where 10 is the device, 311 is the configuration parameter, 1 means "on", that is, enable natural scrolling.
