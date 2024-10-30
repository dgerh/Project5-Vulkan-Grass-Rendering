Vulkan Grass Rendering
==================================

**University of Pennsylvania, CIS 565: GPU Programming and Architecture, Project 5**

* Daniel Gerhardt
  * https://www.linkedin.com/in/daniel-gerhardt-bb012722b/
* Tested on: Windows 23H2, AMD Ryzen 9 7940HS @ 4GHz 32GB, RTX 4070 8 GB (Personal Laptop)

![](img/grass_demo.gif)

### Description

The Vulkan Grass Renderer project is an implementation of [Responsive Real-Time Grass Rendering for General 3D Scenes](https://www.cg.tuwien.ac.at/research/publications/2017/JAHRMANN-2017-RRTG/JAHRMANN-2017-RRTG-draft.pdf) in Vulkan. It features grass tessellation with wind, rebound, and gravity forces. There is also culling of grass blades via distance test, frustum culling, and orientation.

### Performance Analysis

![](img/numbladeschart.png)

It is clear that adding more blades decreases performance, and the drop off seems steeper as the number of blades increases past 1 << 8.

![](img/cullingchart.png)

![](img/forceschart.png)

![](img/tesschart.png)

