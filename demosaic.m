function J = demosaic(I)
%This function looks at the raw format of an
%image and predicts its colors based on the averages
%of neighboring R, G, and B pixels, for each pixel.
%
%Erin Rasmussen
%ramusse
%Fall 2011
img = im2double(I);
%Using the layout of the Bayer filter, a mat is created
%by replicating the 2 x 2 square over the entire image.
%Since it is 2 x 2, it is only replicated size / 2 in
%each direction.
Red = repmat([1 0; 0 0], size(I,1)/2, size(I,2)/2);
Green = repmat([0 1; 1 0], size(I,1)/2, size(I,2)/2);
Blue = repmat([0 0; 0 1], size(I,1)/2, size(I,2)/2);
%Since img is flat, the channels start off equal, but
%multiplying by their repsective color mat makes them
%unique.
Rchannel = img(:,:,1).*Red;
Gchannel = img(:,:,1).*Green;
Bchannel = img(:,:,1).*Blue;
%The red channel (1), green channel (2), and blue
%channel (3) receive their pixel values based on the
%computechannel function, which computes the averages
%of neighboring pixels. Since there are more green pixels
%in the filter than red or green, green only needs to 
%be averaged with itself.
J(:,:,1) = computechannel(Rchannel);
GreenChannel = Gchannel + ((imfilter(Gchannel, [0 1 0; 1 0 1; 0 1 0])) / 4);
J(:,:,2) = GreenChannel;
J(:,:,3) = computechannel(Bchannel);

end

