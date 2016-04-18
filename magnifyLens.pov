//lens
#version 3.7;

#include "colors.inc"
#include "textures.inc"
#include "glass.inc"
#include "metals.inc"
#include "golds.inc"
#include "stones.inc"
#include "woods.inc"
#include "shapes.inc"
#include "shapes2.inc"
#include "functions.inc"
#include "math.inc"
#include "transforms.inc"

camera {
	//location <-.2, 12, -11.2>
	location <-1.2, 12, -1.2>
	look_at <0, 0, 0>
	angle 70
}

light_source { <10000, 100000, -10000> color rgb .9 }

#declare glassLens = union{	
	sphere{<0,0,0> , 2
		texture{
			pigment { color Clear}
			finish { F_Glass1 }
		}
		interior {I_Glass1 fade_color color rgb <.2,.2,1> caustics 0.88}
		scale <1,.16,1>
	}
		
			
	torus { 2.0,  0.1  rotate<0,0,0>
	    texture { pigment{ color rgbt<.7,.7,.7,0.7>}
	              finish { phong 1 reflection{ 0.00 metallic 0.03} } 
	            } // end of texture
	    scale <1,1,1> rotate<0,0,0>  translate<0,0,0>
	} // end of torus  -------------------------------              

	cylinder{<1.44,0,-1.44> <4,0,-4> .18
	    texture { pigment{ color rgbt<.7,.7,.7,0.7>}
	              finish { phong 1 reflection{ 0.00 metallic 0.03} } 
	            } // end of texture
	}
}

object{glassLens
	translate<sin(-1.57+clock*2*3.1415)*2.5,
	 7-sin(clock*1*3.14)*3,
	 -.3+sin(-1.57+clock*2*3.1415)*2.5>
}

box{<-10,0,-10><10,0.1,10>
 // scale your object first!!!
 texture{ pigment{ brick color White                // color mortar
                         color rgb<0.8,0.25,0.1>    // color brick
                   brick_size <.8, 0.19, 0.4> // format in x ,y and z- direction 
                   mortar 0.01                      // size of the mortar 
                 } // end of pigment
          normal {wrinkles 0.75 scale 0.01}
          finish {ambient 0.15 diffuse 0.95 phong 0.2} 
          scale 4
          rotate<0,0,0>  translate<-0.01, 0.02,0.10>
} // end of texture


}


text { ttf "arial.ttf", "happiness", 0.02, 0.0 // thickness, offset

       texture{ pigment{ color rgb<.5,.0,.0>*1.3 } 
              //normal { bumps 0.5  scale 0.01 }
                finish { phong 0.1 }
              } // end of texture

       scale<1,1.25,1>*0.4
       rotate<90.0,0>
       translate<.30,  .12,-.1 >
      } // end of text object ---------------------------------------------

		
			
				
	
