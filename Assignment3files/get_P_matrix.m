function [P_matrix] = get_P_matrix(cube_points, image_points)
    P_matrix = [];
    [rows_n col_n] = size(cube_points);
    for i = 1 : rows_n
        object_point = cube_points(i , :);
        image_point = image_points(i , :);
        rows = GetRows(object_point , image_point);
        P_matrix = [P_matrix ; rows];
    end
    
    display(P_matrix);
end

function [rows] = GetRows(cube_points, image_points)
    %convert object_point to homogeneous coordinates
    cube_points = [cube_points 1];
    u = image_points(1);
    v = image_points(2);
    zeroes = [0 0 0 0];
    row1 = [cube_points zeroes cube_points.*(-u)];
    row2 = [zeroes cube_points cube_points.*(-v)];
    rows = [row1; row2];
end

