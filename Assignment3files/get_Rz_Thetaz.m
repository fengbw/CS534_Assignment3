function [R_z, Theta_z] = get_Rz_Thetaz(N_matrix)
    n22 = N_matrix(2, 2);
    n21 = N_matrix(2, 1);
    cos_theta_z = n22 / sqrtm(n21^2 + n22^2);
    sin_theta_z = -n21 / sqrtm(n21^2 + n22^2);
    R_z = [cos_theta_z -sin_theta_z 0; sin_theta_z cos_theta_z 0; 0 0 1];
    Theta_z = atand(sin_theta_z / cos_theta_z);
    
    display(R_z);
    display(Theta_z);
end

