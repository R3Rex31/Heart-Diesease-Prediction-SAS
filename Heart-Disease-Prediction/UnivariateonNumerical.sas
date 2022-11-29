%MACRO MACRO_UVA_NV(DATASET_NAME, VARIABLE_NAME, TITLE_1, TITLE_2);
	PROC MEANS DATA=&DATASET_NAME N NMISS MIN MAX MEAN MEDIAN STD SKEWNESS KURTOSIS;
		VAR &VARIABLE_NAME;
		TITLE &TITLE_1;
		TITLE2 &TITLE_2;
	RUN;

	ODS GRAPHICS / RESET WIDTH=4.0 IN HEIGHT=3.0 IN IMAGEMAP;

	PROC SGPLOT DATA=&DATASET_NAME;
		HISTOGRAM &VARIABLE_NAME;
	RUN;
	
	PROC UNIVARIATE DATA=&DATASET_NAME;
	VAR &VARIABLE_NAME;
		QQPLOT;
	RUN;

%MEND MACRO_UVA_NV;

%MACRO_UVA_NV(WORK.IMPORT, age, 'Numerical Variables // Univariate Analysis', 
	'on age');

%MACRO_UVA_NV(WORK.IMPORT, trestbps, 
	'Numerical Variables // Univariate Analysis', 'on trestbps');

%MACRO_UVA_NV(WORK.IMPORT, chol, 'Numerical Variables // Univariate Analysis', 
	'on chol');

%MACRO_UVA_NV(WORK.IMPORT, thalach, 
	'Numerical Variables // Univariate Analysis', 'on thalach');

%MACRO_UVA_NV(WORK.IMPORT, oldpeak, 
	'Numerical Variables // Univariate Analysis', 'on oldpeak');
