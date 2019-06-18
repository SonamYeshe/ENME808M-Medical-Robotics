% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 1382.160331193438400 ; 1381.334919306989400 ];

%-- Principal point:
cc = [ 657.538895509558420 ; 471.060018676635370 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ 0.005532090025961 ; 0.255629505793680 ; 0.002028488068767 ; 0.007088440164629 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 8.052712520102311 ; 8.030412193650664 ];

%-- Principal point uncertainty:
cc_error = [ 5.804274907725979 ; 4.438525253060953 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.017540872043282 ; 0.109317473477886 ; 0.001276382120198 ; 0.001698435088750 ; 0.000000000000000 ];

%-- Image size:
nx = 1280;
ny = 960;


%-- Various other variables (may be ignored if you do not use the Matlab Calibration Toolbox):
%-- Those variables are used to control which intrinsic parameters should be optimized

n_ima = 16;						% Number of calibration images
est_fc = [ 1 ; 1 ];					% Estimation indicator of the two focal variables
est_aspect_ratio = 1;				% Estimation indicator of the aspect ratio fc(2)/fc(1)
center_optim = 1;					% Estimation indicator of the principal point
est_alpha = 0;						% Estimation indicator of the skew coefficient
est_dist = [ 1 ; 1 ; 1 ; 1 ; 0 ];	% Estimation indicator of the distortion coefficients


%-- Extrinsic parameters:
%-- The rotation (omc_kk) and the translation (Tc_kk) vectors for every calibration image and their uncertainties

%-- Image #1:
omc_1 = [ 1.933304e+00 ; 1.936467e+00 ; -5.260135e-01 ];
Tc_1  = [ -1.204400e+02 ; -7.344226e+01 ; 4.188786e+02 ];
omc_error_1 = [ 2.465431e-03 ; 3.780513e-03 ; 6.073572e-03 ];
Tc_error_1  = [ 1.768652e+00 ; 1.370441e+00 ; 2.333077e+00 ];

%-- Image #2:
omc_2 = [ 2.068001e+00 ; 2.066852e+00 ; -3.642068e-01 ];
Tc_2  = [ -1.237855e+02 ; -8.761929e+01 ; 3.956344e+02 ];
omc_error_2 = [ 2.730514e-03 ; 3.822451e-03 ; 6.822167e-03 ];
Tc_error_2  = [ 1.676555e+00 ; 1.293986e+00 ; 2.308894e+00 ];

%-- Image #3:
omc_3 = [ -2.154812e+00 ; -2.232437e+00 ; 9.135017e-02 ];
Tc_3  = [ -1.213336e+02 ; -8.672277e+01 ; 3.608263e+02 ];
omc_error_3 = [ 3.762782e-03 ; 3.515265e-03 ; 7.732194e-03 ];
Tc_error_3  = [ 1.532490e+00 ; 1.184203e+00 ; 2.199261e+00 ];

%-- Image #4:
omc_4 = [ -2.076192e+00 ; -2.097897e+00 ; -1.478809e-01 ];
Tc_4  = [ -1.246140e+02 ; -7.984137e+01 ; 3.386278e+02 ];
omc_error_4 = [ 3.364604e-03 ; 3.576411e-03 ; 6.858649e-03 ];
Tc_error_4  = [ 1.444839e+00 ; 1.125088e+00 ; 2.109551e+00 ];

%-- Image #5:
omc_5 = [ -2.121138e+00 ; -2.140859e+00 ; 4.269846e-01 ];
Tc_5  = [ -1.095751e+02 ; -8.663095e+01 ; 4.064848e+02 ];
omc_error_5 = [ 3.840350e-03 ; 3.032661e-03 ; 7.089981e-03 ];
Tc_error_5  = [ 1.719171e+00 ; 1.321835e+00 ; 2.306980e+00 ];

%-- Image #6:
omc_6 = [ -1.997902e+00 ; -2.038766e+00 ; 5.967291e-01 ];
Tc_6  = [ -9.358878e+01 ; -8.289893e+01 ; 4.334558e+02 ];
omc_error_6 = [ 3.795038e-03 ; 2.924455e-03 ; 6.292519e-03 ];
Tc_error_6  = [ 1.830108e+00 ; 1.404761e+00 ; 2.298014e+00 ];

%-- Image #7:
omc_7 = [ 2.054885e+00 ; 2.105854e+00 ; 4.287692e-02 ];
Tc_7  = [ -1.143477e+02 ; -8.704410e+01 ; 3.739944e+02 ];
omc_error_7 = [ 3.581168e-03 ; 4.150261e-03 ; 7.498266e-03 ];
Tc_error_7  = [ 1.596523e+00 ; 1.224195e+00 ; 2.276725e+00 ];

%-- Image #8:
omc_8 = [ 1.931018e+00 ; 2.001864e+00 ; 2.254037e-01 ];
Tc_8  = [ -1.092398e+02 ; -8.937272e+01 ; 3.604615e+02 ];
omc_error_8 = [ 3.446371e-03 ; 3.818906e-03 ; 6.148514e-03 ];
Tc_error_8  = [ 1.545161e+00 ; 1.183060e+00 ; 2.234424e+00 ];

%-- Image #9:
omc_9 = [ 2.018638e+00 ; 2.327355e+00 ; -1.174456e-01 ];
Tc_9  = [ -9.837254e+01 ; -1.057903e+02 ; 3.990421e+02 ];
omc_error_9 = [ 3.510887e-03 ; 4.546182e-03 ; 8.494040e-03 ];
Tc_error_9  = [ 1.696631e+00 ; 1.295253e+00 ; 2.403839e+00 ];

%-- Image #10:
omc_10 = [ 2.338343e+00 ; 2.010786e+00 ; -1.696511e-01 ];
Tc_10  = [ -1.301123e+02 ; -6.843446e+01 ; 4.031206e+02 ];
omc_error_10 = [ 3.884011e-03 ; 3.928492e-03 ; 8.603048e-03 ];
Tc_error_10  = [ 1.706897e+00 ; 1.316391e+00 ; 2.432725e+00 ];

%-- Image #11:
omc_11 = [ -2.385283e+00 ; -1.994969e+00 ; 1.107265e-01 ];
Tc_11  = [ -1.282399e+02 ; -6.374216e+01 ; 3.952283e+02 ];
omc_error_11 = [ 4.424379e-03 ; 3.433137e-03 ; 8.830335e-03 ];
Tc_error_11  = [ 1.673648e+00 ; 1.291045e+00 ; 2.391044e+00 ];

%-- Image #12:
omc_12 = [ 1.987382e+00 ; 2.428472e+00 ; -1.088854e-01 ];
Tc_12  = [ -8.126373e+01 ; -9.943208e+01 ; 3.772422e+02 ];
omc_error_12 = [ 3.454430e-03 ; 4.341001e-03 ; 8.245715e-03 ];
Tc_error_12  = [ 1.601633e+00 ; 1.222783e+00 ; 2.264795e+00 ];

%-- Image #13:
omc_13 = [ 2.108378e+00 ; 2.253624e+00 ; -5.287809e-01 ];
Tc_13  = [ -9.602680e+01 ; -8.957976e+01 ; 4.160446e+02 ];
omc_error_13 = [ 2.696019e-03 ; 3.825174e-03 ; 7.319360e-03 ];
Tc_error_13  = [ 1.759415e+00 ; 1.349177e+00 ; 2.323049e+00 ];

%-- Image #14:
omc_14 = [ 2.087199e+00 ; 1.860399e+00 ; -1.479913e-01 ];
Tc_14  = [ -1.205577e+02 ; -7.261426e+01 ; 3.804474e+02 ];
omc_error_14 = [ 3.141827e-03 ; 3.617392e-03 ; 6.420550e-03 ];
Tc_error_14  = [ 1.612575e+00 ; 1.240598e+00 ; 2.275434e+00 ];

%-- Image #15:
omc_15 = [ -1.942921e+00 ; -2.026362e+00 ; 5.798081e-02 ];
Tc_15  = [ -1.086697e+02 ; -8.049935e+01 ; 3.683400e+02 ];
omc_error_15 = [ 3.238473e-03 ; 3.567669e-03 ; 6.089445e-03 ];
Tc_error_15  = [ 1.556269e+00 ; 1.199142e+00 ; 2.180762e+00 ];

%-- Image #16:
omc_16 = [ -2.050818e+00 ; -2.227071e+00 ; -2.456139e-01 ];
Tc_16  = [ -1.020656e+02 ; -8.261546e+01 ; 3.335908e+02 ];
omc_error_16 = [ 3.243132e-03 ; 3.878588e-03 ; 7.114387e-03 ];
Tc_error_16  = [ 1.431392e+00 ; 1.109363e+00 ; 2.056715e+00 ];

