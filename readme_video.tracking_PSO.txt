Program:Video tracking using Particle Swarm Optimization
Author: Mayuri Nehate
	Sheetal More
	Sejal Shinde	
	Poonam Pingale 
Date:		16/2/2013
Version:	-

Language:	MATLAB
Version: 	7.8.0


OS:		Windows 7 Ultimate 
Machine Specifications:		2.26 GHz with 3.000(2.87 usable)GB RAM

================================
    I N S T A L L A T I O N
================================
- No previous installations required.
- Extract the Code folder to a directory in your the computer.
================================
	   U S A G E 	
================================

- Open MATLAB 7.8.0 and change the current directory 
  above the command window to the one where you
  extracted the zipped code.

- Type in "Vtrack" in the command window.

- select the 'Flagjet' video from the window opened.  

- The Frame 1 of selected video is displayed.
  
- Select the input location (X,Y) i.e. a point on the object. 

- Swarm is spread on first frame:
	Gbest-Green color
	Pbest-Red Colour

- Each Frame is displayed along with swarm spread on it and is saved.
  
- The images are saved to the location given in code 

- The video is created from saved images using 'create_vid.m' in current directory.  
================================
    	   F I L E S
================================
- Following files are included in the Code

1. Filename: Vtrack.m
   Purpose: Main function which selects the video and calls all the functions 	

2. Filename: PSOinit.m
   Purpose: Initialization of all the parameters

3. Filename: Swarm_posinit.m
   Purpose: Initialization of swarm

4. Filename: frm_init.m
   Purpose: Initializing Pbest and Gbest

5. Filename: vel_init.m
   Purpose: Initialization of velocities for entire swarm

6. Filename: cal_ff.m
   Purpose: calculates fitness function value(swarmval) for entire swarm    

7. Filename: updatePG.m
   Purpose: updates the Pbest and Gbest values for each iteration

8. Filename: vel_update.m
   Purpose: calculates velocities of swarm for every iteration 

9. Filename: pos_update.m
   Purpose: updates the swarm position for every iteration

10. Filename: create_vid.m
    Purpose: creates video from saved images for each frame
==================================
	T E S T   D A T A 
==================================

- The parameters N,FFth,vmax are changed in 'PSOinit.m'
  to observe performance of the tracking 

- The same steps are repeated after changing parameters and saving the file.
==================================
         F E A T U R E S
==================================

- Easy algorithm to implement.

- Colour based fitness function facilitates tracking for variable shape and size

===================================
	  V E R S I O N
===================================

-
===================================
       L I M I T A T I O N S  
===================================

- Absence of GUI makes frequent changes to the parameters a bit
  tedious. 



