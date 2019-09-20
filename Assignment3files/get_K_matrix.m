function [K_matrix] = get_K_matrix(N_matrix, R_z)
    K_matrix = N_matrix * R_z;
    scale_factor = K_matrix(3, 3);
    K_matrix = K_matrix ./ scale_factor;
    
    display(K_matrix);
    
    %focal length 
    output_x = ['focal_length_x = ' , num2str(K_matrix(1, 1))];
    output_y = ['focal_length_y = ' , num2str(K_matrix(2, 2))];
    %focal_length_x = K_matrix(1, 1);
    disp(output_x);
    disp(output_y);
    
    %coordinates of the image center
    u = K_matrix(1, 3);
    v = K_matrix(2, 3);
    image_center = [num2str(u) , ', ' , num2str(v)];
    output_image_center = ['image center = (u, v) = ' , '(' , image_center , ')'];
    disp(output_image_center);
end

