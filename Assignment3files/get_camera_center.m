function [camera_center] = get_camera_center(M_matrix)
    [u, s, v] = svd(M_matrix);
    camera_center_homogeneous = v(:,end);
    x = camera_center_homogeneous(1) / camera_center_homogeneous(4);
    y = camera_center_homogeneous(2) / camera_center_homogeneous(4);
    z = camera_center_homogeneous(3) / camera_center_homogeneous(4);
    camera_center = [x y z];
    
    display(camera_center);
end

