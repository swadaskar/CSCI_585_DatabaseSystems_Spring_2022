HW 5

Question  1: 

Linear Regression Equation:
class =

     -0.1084 * CRIM +
      0.0458 * ZN +
      2.7187 * CHAS=1 +
    -17.376  * NOX +
      3.8016 * RM +
     -1.4927 * DIS +
      0.2996 * RAD +
     -0.0118 * TAX +
     -0.9465 * PTRATIO +
      0.0093 * B +
     -0.5226 * LSTAT +
     36.3411
	 
The number of terms in the equation are 12. The first 11 terms are weight * features and the last term is the intercept.

The three features INDUS, AGE, and CHAS=0 are not present in the equation because of the attribute selection M5 method which 
initially builds on all descriptors, and then descriptors with the smallest standardized regression coefficients are step-wisely 
removed from the model until no improvement is observed in the estimate of the average prediction error and in our case removing
these 3 features did not affect the error value.


Question 2:

Linear Regression Equation:

num_rings =
	sex=I          * -0.824876264805255 +
	sex=M          * 0.0577156749397012 +
	length         * -0.458335416241252 +
	diameter       * 11.0751025429045   +
	height         * 10.7615366991238   + 
	whole_weight   * 8.97544462048579   +
	shucked_weight * -19.7868668634496  +
	viscera_weight * -10.58182703416    +
	shell_weight   * 8.74180579669353   +
	3.89464142386757
	

Question 3:

Linear Regression Equation:

num_rings =
	- 11.933 * length
	+ 25.766 * diameter
	+ 20.358 * height
	+ 2.836