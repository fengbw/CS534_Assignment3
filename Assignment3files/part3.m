% get parameters from part2
[homographies, K_matrix, r_matrices, t_matrices] = part2();

%Augmenting an Image
images = {'images2.png', 'images9.png', 'images12.png', 'images20.png'};
augment_image(homographies, images);

%Augmenting an Object
augment_object(images, K_matrix, r_matrices, t_matrices);