#include "conductivity.h"
/*
	 Function: Conductivity
	 Purpose: Computes conductivity at (x, y)
	 
	 Input:
	 	problem_index: problem set to be solved 
	 	x_val: x position
	 	y_val: y position
	 Output:
	 	kappa: conductivity at (x, y) in W/(mk)

	 Author: Connor T. O'Reilly
	 Collbrators: none
	 Last Edited: 4/16/2020
*/
double conductivity(int problem_index, double x_val, double y_val){
	/* return conductivity for selected problem set at (x,y) */

	/* initialize conduct val */ 
	double kappa = 0;

	/* 1st 2nd 3rd problem set*/
	if((problem_index == 1) || (problem_index == 2) || (problem_index == 3)){
		kappa = 1.000;
	}
	if(problem_index == 4){ /* fourth problem set */
		if(x_val > 0.5){
			kappa = 20.000;
		}
		else{
			kappa = 1.000;
		}
	}
	if(problem_index == 5){ /* fifth problem set */
		if((x_val > 0.01) && (x_val < 0.015) && (y_val > 0.01) && (y_val < 0.015)){
			kappa = 167.000;
		}
		else{
			kappa = 157.000;
		}
	}
	return kappa;
}
