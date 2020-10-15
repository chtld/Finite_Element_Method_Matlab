function points = select_evalution_points(vertices)
    [~, gauss_points] = generate_gauss_formula_1d(vertices, 4);
    points = [vertices gauss_points];
end
