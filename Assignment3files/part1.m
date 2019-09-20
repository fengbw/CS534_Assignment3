%1 draw image points
cube_points = [2 2 2; -2 2 2; -2 2 -2; 2 2 -2; 2 -2 2; -2 -2 2; -2 -2 -2; 2 -2 -2];
image_points = [422 323;178 323;118 483; 482 483; 438 73; 162 73; 78 117;522 117];
plot(image_points(:,1),image_points(:,2),'o');

%3 print matrix P
P_matrix = get_P_matrix(cube_points , image_points);

%4 print matrix M
M_matrix = get_M_matrix(P_matrix);

%5 print the corresponding 3 Euclidean coordinates
camera_center = get_camera_center(M_matrix);

%6 print matrix M'
M_quote = get_M_quote(M_matrix);

%7 print matrix R_x, Theta_x and matrix N
[R_x, Theta_x, N_matrix] = get_Rx_Thetax_N(M_quote);

%8 print matrix R_z and Theta_z
[R_z, Theta_z] = get_Rz_Thetaz(N_matrix);

%9 print matrix K, focal length and coordinates of the image center
K_matrix = get_K_matrix(N_matrix, R_z);