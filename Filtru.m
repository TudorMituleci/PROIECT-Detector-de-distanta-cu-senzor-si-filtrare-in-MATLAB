port = "COM4";        
baudrate = 115200;
s = serialport(port, baudrate);
configureTerminator(s, "LF");

windowSize = 20;                  
rawData = zeros(1, windowSize);   
filteredData = zeros(1, windowSize);

figure;
hRaw = plot(rawData, 'b'); hold on;
hFiltered = plot(filteredData, 'r', 'LineWidth', 2);
legend('Original', 'Filtrat');
ylim([0 100]); 
xlabel('Probe');
ylabel('Distanță (cm)');
title('Citire Live din senzor');
grid on;

while true
    try
        line = readline(s);
        value = str2double(line);

        if ~isnan(value)
            rawData = [rawData(2:end), value];
            filteredData = movmean(rawData, windowSize);

            set(hRaw, 'YData', rawData);
            set(hFiltered, 'YData', filteredData);
            drawnow;
        end
    catch
        warning("Eroare la citire.");
        break;
    end
end

clear s;