function [disp] = display_phi (phi, r, c, disp_option)

% for pi less difference

phi = abs(phi - phi(4));
disp = (phi > pi).*(2*pi - phi) + (phi <= pi).*(phi);

% gray scale indices vary from 1(black) to 64(white)

plot_v = vec2mat(disp', c)/pi*63 + 1;

if disp_option == 0
     figure(1)
     graymap = colormap('gray');
     colormap(graymap);
     image(1:c, 1:r, plot_v);
end

