classdef interface < handle
    
    properties
        interf_fig;
        interf_axis;
        interf_plot;
        interf_plot2;
        interf_text;
        interf_text2;
%         mydaq01= daq('ni');
%         mydaq02= daq('ni');  
    end
    methods
        function obj = interface
%             Create a figure
            obj.interf_fig = figure('Position',[100 35 1100 600],'Name','Interface','NumberTitle','on');
            % Plot setting
            subplot(121);
            obj.interf_plot = plot(0,0,'.k','MarkerSize',35);
             lgd = legend('Five Gestures Left, Right, Forward, Reverse and Stop control');
             title(lgd,'Artificial Neural Network based Cursor Control')
             hold on
             obj.interf_text = text(0.2,-0.5,'\circ');
             s = obj.interf_text.FontSize;
             obj.interf_text.FontSize= 25;
            % Axis setting
            set(gca,'sortmethod','childorder')
            obj.interf_axis = gca;
             obj.interf_axis.Clipping = 'off';
             obj.interf_axis.XLim = [-5.1 5.1];
             obj.interf_axis.YLim = [-5.1 5.1];
             obj.interf_axis.XTick=[];
             obj.interf_axis.YTick=[];
             obj.interf_axis.XAxisLocation = 'origin';
             obj.interf_axis.YAxisLocation = 'origin';
             obj.interf_axis.DataAspectRatio = [1.1 1.1 1.1];
            axis tight manual;
            
            subplot(122);
            obj.interf_plot2 = plot(0,0,'.k','MarkerSize',25);
            legend('Real-Time Gesture control for EPW Wheelchair Application');
%              title(lgd,'Regression Algorithm');
             hold on
             obj.interf_text2 = text(0.2,-0.5,'\circ');
             s = obj.interf_text2.FontSize;
             obj.interf_text2.FontSize= 25;
             obj.interf_axis = gca;
             obj.interf_axis.Clipping = 'off';
             obj.interf_axis.XLim = [-5.1 5.1];
             obj.interf_axis.YLim = [-5.1 5.1];
             obj.interf_axis.XTick=[];
             obj.interf_axis.YTick=[];
             obj.interf_axis.XAxisLocation = 'origin';
             obj.interf_axis.YAxisLocation = 'origin';
             obj.interf_axis.DataAspectRatio = [1.1 1.1 1.1];
            axis tight manual;
%                 obj.mydaq01.addoutput('dev1', 'ao0', 'Voltage');
%                 obj.mydaq02.addoutput('dev1', 'ao1', 'Voltage');
%                 obj.mydaq01.addinput('dev1', 'ai0', 'Voltage');
        end
       function updatedata(obj,prevdata,data)
            % Update current position
            %set(obj.interf_plot(1),'xdata',data(1),'ydata',data(2))
            diff1 = abs(data(1) - prevdata(1));
            diff2 = abs(data(2) - prevdata(2));
            if ((data(1) > prevdata(1)) && diff1 > diff2+0.003)
                tdata='Right \rightarrow';
%                 ao0_value = 2.5; 
%                 ao1_value = 3.88;
%                 obj.mydaq01.write(ao0_value)
%                 obj.mydaq02.write(ao1_value)
            elseif ((data(1) < prevdata(1)) && diff1 > diff2+0.003)
                tdata='Left \leftarrow';
%                 ao0_value = 2.5;
%                 ao1_value = 1.4;
%                 obj.mydaq01.write(ao0_value)
%                 obj.mydaq02.write(ao1_value)
            elseif ((data(2) > prevdata(2)) && diff2 > diff1+0.003)
                tdata='Forward \uparrow';
%                 ao0_value = 3.77;
%                 ao1_value = 2.5;
%                 obj.mydaq01.write(ao0_value)
%                 obj.mydaq02.write(ao1_value)
            elseif ((data(2) < prevdata(2)) && diff2 > diff1+0.003)
                tdata='Reverse \downarrow';
%                 ao0_value = 1.25;
%                 ao1_value = 2.5;
%                 obj.mydaq01.write(ao0_value)
%                 obj.mydaq02.write(ao1_value)
            else
                tdata='Stop\circ';
%                 ao0_value = 2.5;
%                 ao1_value = 2.5;
%                 obj.mydaq01.write(ao0_value)   
%                 obj.mydaq02.write(ao1_value)
            end
            set(obj.interf_text,'String',tdata);
            drawnow
        end  
    end
end