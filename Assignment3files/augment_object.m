function [] = augment_object(images, K_matrix, r_matrices, t_matrices)
    corners = [0 210 0 1; 90 210 0 1; 90 120 0 1; 0 120 0 1; 0 210 90 1; 90 210 90 1; 90 120 90 1; 0 120 90 1];
    for i = 1 : 4
        image = imread(images{i});
        new_corners = K_matrix * [r_matrices(:, :, i) t_matrices(:, :, i)] * corners';
        for j = 1 : 8
            new_corners(:, j) = new_corners(:, j) ./ new_corners(3, j);
        end
        figure
        imshow(image);
        hold on;
        plot(new_corners(1, 1:4), new_corners(2, 1:4), 'r', 'LineWidth', 2)
        plot(new_corners(1, 5:8), new_corners(2, 5:8), 'r', 'LineWidth', 2)
        
        plot([new_corners(1,5); new_corners(1,8)], [new_corners(2,5);new_corners(2,8)], 'r', 'LineWidth', 2)
        plot([new_corners(1,1); new_corners(1,4)], [new_corners(2,1);new_corners(2,4)], 'r', 'LineWidth', 2)
        plot([new_corners(1,1); new_corners(1,5)], [new_corners(2,1);new_corners(2,5)], 'r', 'LineWidth', 2)
        plot([new_corners(1,2); new_corners(1,6)], [new_corners(2,2);new_corners(2,6)], 'r', 'LineWidth', 2)
        plot([new_corners(1,3); new_corners(1,7)], [new_corners(2,3);new_corners(2,7)], 'r', 'LineWidth', 2)
        plot([new_corners(1,4); new_corners(1,8)], [new_corners(2,4);new_corners(2,8)], 'r', 'LineWidth', 2)
        pause(0.5)
    end
end

