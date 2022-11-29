%MACRO MACRO_UVA_CV(DATASET_NAME, VARIABLE_NAME, TITLE_1, TITLE_2);
	PROC FREQ DATA=&DATASET_NAME;
		TABLE &VARIABLE_NAME;
	RUN;

	ODS GRAPHICS / RESET WIDTH=4.0 IN HEIGHT=3.0 IN IMAGEMAP;

	PROC SGPLOT DATA=&DATASET_NAME;
		VBAR &VARIABLE_NAME;
		TITLE &TITLE_1;
		TITLE2 &TITLE_2;
	RUN;

%MEND MACRO_UVA_CV;


%MACRO_UVA_CV(WORK.IMPORT, sex, 'Categorical Variables // Univariate Analysis', 
	'on sex (Gender)');

%MACRO_UVA_CV(WORK.IMPORT, cp, 'Categorical Variables // Univariate Analysis', 
	'on cp (Chest Pain Type)');

%MACRO_UVA_CV(WORK.IMPORT, fbs, 'Categorical Variables // Univariate Analysis', 
	'on fbs (Fasting Blood Sugar)');

%MACRO_UVA_CV(WORK.IMPORT, restecg, 
	'Categorical Variables // Univariate Analysis', 
	'on restecg (Resting Electrocardiographic Results)');

%MACRO_UVA_CV(WORK.IMPORT, exang, 
	'Categorical Variables // Univariate Analysis', 
	'on exang (Exercise Induced Angina)');


%MACRO_UVA_CV(WORK.IMPORT, slope, 
	'Categorical Variables // Univariate Analysis', 
	'on slope (Slope of the Peak Exercise)');

%MACRO_UVA_CV(WORK.IMPORT, ca, 'Categorical Variables // Univariate Analysis', 
	'on ca (Number of Major Vessels)');

%MACRO_UVA_CV(WORK.IMPORT, thal, 
	'Categorical Variables // Univariate Analysis', 'on thal');

%MACRO_UVA_CV(WORK.IMPORT, target, 
	'Categorical Variables // Univariate Analysis', 
	'on target (Heart Diseases Status)');
