% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 1382.132681527196800 ; 1381.260484836512700 ];

%-- Principal point:
cc = [ 658.573120711641200 ; 471.898802498895460 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ 0.007698177744782 ; 0.236240972859936 ; 0.002219802125972 ; 0.007266252750744 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 7.948794144369345 ; 7.923871753720650 ];

%-- Principal point uncertainty:
cc_error = [ 5.560940239558359 ; 4.258370298803098 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.016244971169768 ; 0.098392196643996 ; 0.001209177053588 ; 0.001618555252297 ; 0.000000000000000 ];

%-- Image size:
nx = 1280;
ny = 960;


%-- Various other variables (may be ignored if you do not use the Matlab Calibration Toolbox):
%-- Those variables are used to control which intrinsic parameters should be optimized

n_ima = 17;						% Number of calibration images
est_fc = [ 1 ; 1 ];					% Estimation indicator of the two focal variables
est_aspect_ratio = 1;				% Estimation indicator of the aspect ratio fc(2)/fc(1)
center_optim = 1;					% Estimation indicator of the principal point
est_alpha = 0;						% Estimation indicator of the skew coefficient
est_dist = [ 1 ; 1 ; 1 ; 1 ; 0 ];	% Estimation indicator of the distortion coefficients


%-- Extrinsic parameters:
%-- The rotation (omc_kk) and the translation (Tc_kk) vectors for every calibration image and their uncertainties

%-- Image #1:
omc_1 = [ 1.933294e+00 ; 1.936159e+00 ; -5.251166e-01 ];
Tc_1  = [ -1.207453e+02 ; -7.369502e+01 ; 4.187336e+02 ];
omc_error_1 = [ 2.395811e-03 ; 3.655754e-03 ; 5.854060e-03 ];
Tc_error_1  = [ 1.693499e+00 ; 1.313851e+00 ; 2.301866e+00 ];

%-- Image #2:
omc_2 = [ 2.068153e+00 ; 2.066813e+00 ; -3.629031e-01 ];
Tc_2  = [ -1.240787e+02 ; -8.786118e+01 ; 3.954981e+02 ];
omc_error_2 = [ 2.657686e-03 ; 3.700971e-03 ; 6.600944e-03 ];
Tc_error_2  = [ 1.605296e+00 ; 1.240310e+00 ; 2.277176e+00 ];

%-- Image #3:
omc_3 = [ -2.154855e+00 ; -2.232549e+00 ; 9.012938e-02 ];
Tc_3  = [ -1.216013e+02 ; -8.694549e+01 ; 3.606986e+02 ];
omc_error_3 = [ 3.662304e-03 ; 3.424398e-03 ; 7.521243e-03 ];
Tc_error_3  = [ 1.467469e+00 ; 1.135264e+00 ; 2.167329e+00 ];

%-- Image #4:
omc_4 = [ -2.076048e+00 ; -2.097980e+00 ; -1.491183e-01 ];
Tc_4  = [ -1.248669e+02 ; -8.005253e+01 ; 3.384956e+02 ];
omc_error_4 = [ 3.282697e-03 ; 3.481590e-03 ; 6.634278e-03 ];
Tc_error_4  = [ 1.383806e+00 ; 1.078559e+00 ; 2.076399e+00 ];

%-- Image #5:
omc_5 = [ -2.121209e+00 ; -2.141011e+00 ; 4.257468e-01 ];
Tc_5  = [ -1.098727e+02 ; -8.687811e+01 ; 4.063576e+02 ];
omc_error_5 = [ 3.712505e-03 ; 2.946366e-03 ; 6.873965e-03 ];
Tc_error_5  = [ 1.645894e+00 ; 1.267308e+00 ; 2.277032e+00 ];

%-- Image #6:
omc_6 = [ -1.998006e+00 ; -2.039042e+00 ; 5.954778e-01 ];
Tc_6  = [ -9.390701e+01 ; -8.316218e+01 ; 4.333277e+02 ];
omc_error_6 = [ 3.663141e-03 ; 2.833904e-03 ; 6.083140e-03 ];
Tc_error_6  = [ 1.752184e+00 ; 1.347056e+00 ; 2.268690e+00 ];

%-- Image #7:
omc_7 = [ 2.054882e+00 ; 2.105675e+00 ; 4.398838e-02 ];
Tc_7  = [ -1.146293e+02 ; -8.727391e+01 ; 3.738836e+02 ];
omc_error_7 = [ 3.499969e-03 ; 4.058682e-03 ; 7.313175e-03 ];
Tc_error_7  = [ 1.529079e+00 ; 1.173776e+00 ; 2.246308e+00 ];

%-- Image #8:
omc_8 = [ 1.930997e+00 ; 2.001540e+00 ; 2.265693e-01 ];
Tc_8  = [ -1.095112e+02 ; -8.959509e+01 ; 3.603431e+02 ];
omc_error_8 = [ 3.360672e-03 ; 3.725924e-03 ; 5.963636e-03 ];
Tc_error_8  = [ 1.479663e+00 ; 1.134351e+00 ; 2.204425e+00 ];

%-- Image #9:
omc_9 = [ 2.018678e+00 ; 2.327330e+00 ; -1.163366e-01 ];
Tc_9  = [ -9.867044e+01 ; -1.060332e+02 ; 3.989320e+02 ];
omc_error_9 = [ 3.435713e-03 ; 4.440934e-03 ; 8.292077e-03 ];
Tc_error_9  = [ 1.624796e+00 ; 1.241767e+00 ; 2.373546e+00 ];

%-- Image #10:
omc_10 = [ 2.338441e+00 ; 2.010846e+00 ; -1.685119e-01 ];
Tc_10  = [ -1.304117e+02 ; -6.868103e+01 ; 4.030098e+02 ];
omc_error_10 = [ 3.795965e-03 ; 3.833127e-03 ; 8.392603e-03 ];
Tc_error_10  = [ 1.634542e+00 ; 1.262163e+00 ; 2.400819e+00 ];

%-- Image #11:
omc_11 = [ -2.385230e+00 ; -1.994976e+00 ; 1.096896e-01 ];
Tc_11  = [ -1.285335e+02 ; -6.398478e+01 ; 3.951279e+02 ];
omc_error_11 = [ 4.319152e-03 ; 3.355640e-03 ; 8.622345e-03 ];
Tc_error_11  = [ 1.602708e+00 ; 1.237982e+00 ; 2.359957e+00 ];

%-- Image #12:
omc_12 = [ 1.987398e+00 ; 2.428479e+00 ; -1.079895e-01 ];
Tc_12  = [ -8.154503e+01 ; -9.966168e+01 ; 3.771548e+02 ];
omc_error_12 = [ 3.383708e-03 ; 4.245025e-03 ; 8.048636e-03 ];
Tc_error_12  = [ 1.533893e+00 ; 1.172452e+00 ; 2.237672e+00 ];

%-- Image #13:
omc_13 = [ 2.108545e+00 ; 2.253743e+00 ; -5.274944e-01 ];
Tc_13  = [ -9.633228e+01 ; -8.983149e+01 ; 4.159218e+02 ];
omc_error_13 = [ 2.633832e-03 ; 3.704064e-03 ; 7.087794e-03 ];
Tc_error_13  = [ 1.684642e+00 ; 1.293605e+00 ; 2.293652e+00 ];

%-- Image #14:
omc_14 = [ 2.087361e+00 ; 1.860249e+00 ; -1.467827e-01 ];
Tc_14  = [ -1.208414e+02 ; -7.284639e+01 ; 3.803256e+02 ];
omc_error_14 = [ 3.058908e-03 ; 3.514880e-03 ; 6.215821e-03 ];
Tc_error_14  = [ 1.544122e+00 ; 1.189336e+00 ; 2.245103e+00 ];

%-- Image #15:
omc_15 = [ -1.942772e+00 ; -2.026532e+00 ; 5.689969e-02 ];
Tc_15  = [ -1.089404e+02 ; -8.072700e+01 ; 3.682191e+02 ];
omc_error_15 = [ 3.143299e-03 ; 3.463788e-03 ; 5.880194e-03 ];
Tc_error_15  = [ 1.489920e+00 ; 1.149473e+00 ; 2.151956e+00 ];

%-- Image #16:
omc_16 = [ -2.050724e+00 ; -2.227106e+00 ; -2.466212e-01 ];
Tc_16  = [ -1.023196e+02 ; -8.282564e+01 ; 3.335002e+02 ];
omc_error_16 = [ 3.175791e-03 ; 3.780724e-03 ; 6.910503e-03 ];
Tc_error_16  = [ 1.371408e+00 ; 1.064118e+00 ; 2.029306e+00 ];

%-- Image #17:
omc_17 = [ 2.137845e+00 ; 2.244224e+00 ; -1.803064e-01 ];
Tc_17  = [ -1.274893e+02 ; -8.426360e+01 ; 3.729650e+02 ];
omc_error_17 = [ 3.128541e-03 ; 3.883583e-03 ; 7.481361e-03 ];
Tc_error_17  = [ 1.512971e+00 ; 1.172715e+00 ; 2.229120e+00 ];

