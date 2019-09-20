function [R_x, Theta_x, N_matrix] = get_Rx_Thetax_N(M_quote)
    m33 = M_quote(3, 3);
    m32 = M_quote(3, 2);
    cos_Theta_x = m33 / sqrtm(m33^2 + m32^2);
    sin_Theta_x = -m32 / sqrtm(m33^2 + m32^2);
    R_x = [1 0 0;0 cos_Theta_x -sin_Theta_x;0 sin_Theta_x cos_Theta_x];
    N_matrix = M_quote * R_x;
    Theta_x = atand(sin_Theta_x / cos_Theta_x);
    
    display(R_x);
    display(Theta_x);
    display(N_matrix);
end

