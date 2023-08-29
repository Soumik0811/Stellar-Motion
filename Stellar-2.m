%{ Compare Stellar Spectra%}

load starData

%{Line 2 of the script extracts the spectrum data for the second star in the matrix spectra. Then lines 3–5 calculate the speed based on that data.%}

[sHa,idx] = min(spectra);
lambdaHa = lambda(idx);
z = lambdaHa/656.28 - 1;
speed = z*299792.458

%{Notice that speed is now a vector. A positive speed means that the star is moving away from Earth (redshifted spectrum), and a negative speed means that the star is moving toward Earth (blueshifted spectrum).%}
%{plot the spectra of all seven stars using different line properties for redshifted and blueshifted spectra. It is convenient to use a for loop to access each star's data one at a time.%}

for v = 1:7
    s= spectra(:,v)
    if speed(v)<=0
        plot(lambda,s,"--")
    else
        plot(lambda,s,"-","LineWidth",3)
    end
    hold on
end
hold off

%{The string array starnames contains the name of each star in spectra.%}

legend(starnames)

%{In the plot, you identify stars with redshifted spectra by using their line styles, and then look up their names in the legend.%}

movaway = starnames(speed>0)
