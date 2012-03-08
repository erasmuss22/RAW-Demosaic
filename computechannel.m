function Channel = computechannel( colorChannel )
%This function performs the math part of the demosaicing
%for the red and blue channels. Because of the Bayer pattern,
%the same filter for blue can also be used for red since the
%pattern values are still the same.
%
%Erin Rasmussen
%rasmusse
%Fall 2011
ColorOther = imfilter(colorChannel,[1 0 1; 0 0 0; 1 0 1]) / 4;
ColorGreen = colorChannel + ColorOther;
ColorGreen = imfilter(ColorGreen,[0 1 0; 1 0 1; 0 1 0]) / 4;
Channel = colorChannel + ColorOther + ColorGreen;
end

