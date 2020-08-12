# Traffic-Controller
A controller for traffic light for a two-way junction. 

![Image of state diagrma](https://raw.githubusercontent.com/SunkeerthM/Traffic-Controller/master/images/IMG_20200812_193726-01.jpeg)

## Description
* There are 2 control signals - S1, S2 which indicate the preence of vehicles on road 'A' and road 'B' respectively.
* The 2 sets of red, yellow and green signals correspond to the traffic lights on the respective roads.
    * 'A' - Ra, Ya, Ga
    * 'B' - Rb, Yb, Gb

### Goals
- [x] ~~Basic outline for  TLC~~
- [ ] testbench module for the basic outline version
- [ ] Expand to a 4 way junction (K.R circle)
- [ ] Include different timing for the signals
