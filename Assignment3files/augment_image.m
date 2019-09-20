% Coz last 4 digits of my RUID is 3162, so I use 2.jpg
function [] = augment_image(homographies, images)
    clip_art = imread('./clipart/2.jpg');
    [nX nY nZ] = size(clip_art);
    pixels_x = 210/nX;
    pixels_y = 270/nY;
    scale_facctor = pixels_x;
    if pixels_y < pixels_x
        scale_facctor = pixels_y;
    end
    world_x = [];
    world_y = [];
    for i = 1 : nX
        for j = 1 : nY
            x = j * scale_facctor;
            y = (nX - i) * scale_facctor;
            world_x(i, j) = x;
            world_y(i, j) = y;
        end
    end
    for p = 1 : 4
        base_image = imread(images{p});
        for i = 1 : nX
            for j = 1 : nY
                object_x = world_x(i, j);
                object_y = world_y(i, j);
                point = [object_x object_y 1]';
                image_point = homographies(:, :, p) * point;
                image_x = image_point(1) / image_point(3);
                image_y = image_point(2) / image_point(3);
                column_1 = clip_art(i, j, 1);
                column_2 = clip_art(i, j, 2);
                column_3 = clip_art(i, j, 3);
                if column_1 > 200 && column_2 > 200 && column_3 > 200
                    continue;
                end
                base_image(round(image_y) , round(image_x) , 1) = clip_art(i, j, 1);
                base_image(round(image_y) , round(image_x) , 2) = clip_art(i, j, 2);
                base_image(round(image_y) , round(image_x) , 3) = clip_art(i, j, 3);
            end
        end
        figure;
        imshow(base_image);
    end
end

