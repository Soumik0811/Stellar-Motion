
nObs = size(spectra,1)
lambdaStart = 630.02
lambdaDelta = 0.14

%{ Task 1 :
The star spectrum data in the spectra matrix was collected at evenly spaced wavelengths (λ), and you are given the starting wavelength (λstart), the spacing (λdelta), and the number of observations.%}

lambdaEnd = lambdaStart + (nObs-1)*lambdaDelta
lambda = (lambdaStart:lambdaDelta:lambdaEnd)

%{Task 2 & 7
Each column of spectra is the spectrum of a different star. The sixth column is the spectrum of star HD 94028.%}

s=(spectra(:,6))


%{Task 3 : 
Plot the spectra (s) as a function of wavelength (lambda). Use point markers (.) and a solid line (-) to connect the points.
Add the x-label "Wavelength" and the y-label "Intensity" to the plot.%}
plot(lambda,s,".-")
xlabel("Wavelength")
ylabel("Intensity")

%{Task 4 :
Create two variables, sHa and idx, that contain the minimum value of s and the index of that minimum value.
Find the wavelength of the hydrogen-alpha line by using idx to index into lambda. Store the result as lambdaHa (λHa).%}

[sHa,idx] = min(s)
lambdaHa = lambda(idx)

%{Task 5:
The point (lambdaHa,sHa) is the location of the hydrogen-alpha line.%}
hold on 
plot(lambdaHa,sHa,"rs","MarkerSize",8)
hold off

%{Task 6:
If you zoom in on the plot, you can see that the wavelength of the hydrogen-alpha line of HD 94028 is 656.62 nm, which is slightly longer than the laboratory value of 656.28 nm.
Using the hydrogen-alpha wavelength of the star, you can calculate the redshift factor (the speed of the star relative to Earth) using the formula z=(λHa/656.28)−1. 
You can then calculate the speed by multiplying the redshift factor (z) by the speed of light (299792.458 km/s).%}

z = lambdaHa/656.28 - 1
speed = z*299792.458

