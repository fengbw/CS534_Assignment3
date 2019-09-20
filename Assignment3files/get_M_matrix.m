function [M_matrix] = get_M_matrix(P_matrix)
    [u, s, v] = svd(P_matrix);
    v_last_col = v(:,end);
    %M_matrix_temp = reshape(v_last_col, 4, 3);
    transpose_m_matrix = reshape(v_last_col, [], 3);
    M_matrix = transpose(transpose_m_matrix);
    
    display(M_matrix);
end

