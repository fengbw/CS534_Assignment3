function [M_quote] = get_M_quote(M_matrix)
    M_quote = M_matrix(:, 1:3);
    scale_factor = M_quote(3, 3);
    M_quote = M_quote ./ scale_factor;
    
    display(M_quote);
end

