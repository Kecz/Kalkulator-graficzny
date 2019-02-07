%Projekt from WNO - Bartosz Bieliñski 165430

%Graphing calculator - graphs of the monotonicity function, test
%monotonicity of the function

%Environment: MATLAB R2017a


function varargout = KalkulatorV6(varargin)
% KALKULATORV6 MATLAB code for KalkulatorV6.fig
%      KALKULATORV6, by itself, creates a new KALKULATORV6 or raises the existing
%      singleton*.
%
%      H = KALKULATORV6 returns the handle to a new KALKULATORV3 or the handle to
%      the existing singleton*.
%
%      KALKULATORV6('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in KALKULATORV6.M with the given input arguments.
%
%      KALKULATORV6('Property','Value',...) creates a new KALKULATORV6 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before KalkulatorV6_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to KalkulatorV6_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help KalkulatorV6

% Last Modified by GUIDE v2.5 27-Nov-2018 21:03:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @KalkulatorV6_OpeningFcn, ...
                   'gui_OutputFcn',  @KalkulatorV6_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before KalkulatorV6 is made visible.
function KalkulatorV6_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to KalkulatorV6 (see VARARGIN)

% Choose default command line output for KalkulatorV6

%Przypisanie pocz¹tkowych wartoœci do wymagjacych tego zmiennych
handles.output = hObject;
handles.funkcja1 = 1;
handles.radiobutton = 1;
handles.radiobutton_next_plot = 1;
handles.rodzaj_plota = 1;
handles.wprowadzenie_zakresu_y = 0;
set(handles.edit_y_od, 'Enable', 'off');
set(handles.edit_y_do, 'Enable', 'off');

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes KalkulatorV6 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = KalkulatorV6_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in menu_funkcji.
function menu_funkcji_Callback(hObject, eventdata, handles)

%Downloading data from popmenu
str = get(hObject, 'String');
val = get(hObject, 'Value');

%
%W zale¿noœci od wartoœci z popupmenu, przypisuje do zmiennej w handles
%odpowiedni¹ wartoœc u¿ywan¹ póŸniej przy rysowaniu
switch str{val}
    case 'sin'
        handles.funkcja1 = 1;
    case 'cos'
        handles.funkcja1 = 2;
    case 'tan'
        handles.funkcja1 = 3;
    case 'ctg'
        handles.funkcja1 = 4;
    case 'e^'
        handles.funkcja1 = 5;
    case 'sqrt'
        handles.funkcja1 = 6;
    case 'log'
        handles.funkcja1 = 7;
    case 'log10'
        handles.funkcja1 = 8;
    case 'wielomian'
        handles.funkcja1 = 9;
    case 'x^'
        handles.funkcja1 = 10;
end

%zapis danych
guidata(hObject,handles);

% hObject    handle to menu_funkcji (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns menu_funkcji contents as cell array
%        contents{get(hObject,'Value')} returns selected item from menu_funkcji



% --- Executes when selected object is changed in uibuttongroup1.
function uibuttongroup1_SelectionChangedFcn(hObject, eventdata, handles)

%Reakcja na zmianê wyboru typu rysowanej funkcji
switch(get(eventdata.NewValue, 'Tag'))
    case 'radiobutton_opcja1' 
        handles.radiobutton = 1;
        set(handles.menu_funkcji, 'Enable', 'on');
        set(handles.menu_funkcji, 'Visible', 'on');
    case 'radiobutton_opcja2' 
        handles.radiobutton = 2;
        set(handles.menu_funkcji, 'Enable', 'off');
        set(handles.menu_funkcji, 'Visible', 'off');
    case 'radiobutton_opcja3' 
        handles.radiobutton = 3;
        set(handles.menu_funkcji, 'Enable', 'off');
        set(handles.menu_funkcji, 'Visible', 'off');
    case 'radiobutton_opcja4' 
        handles.radiobutton = 4;
        set(handles.menu_funkcji, 'Enable', 'on');
        set(handles.menu_funkcji, 'Visible', 'on');
end

%zapis danych
guidata(hObject,handles);

% --- Executes when selected object is changed in uibuttongroup3.
function uibuttongroup3_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup3 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Zmiana trybu wyœwietlania nastêpnej funkcji, mo¿liwoœci to dodaj now¹
%funkcjê do wykresu albo nadpisz star¹
switch(get(eventdata.NewValue, 'Tag'))
    
    case 'radiobutton_nadpisz' 
        handles.radiobutton_next_plot = 1;
    case 'radiobutton_dodaj' 
        handles.radiobutton_next_plot = 2;
end

%zapis danych
guidata(hObject,handles);


% --- Executes when selected object is changed in uibuttongroup4.
function uibuttongroup4_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup4 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Wybór czy wykres ma byæ domyœlnie lini¹ czy mo¿e te¿ maj¹ byæ naniesione
%na niego wszystkie punkty(przydatne przy funkcji sta³owartoœciowej)
switch(get(eventdata.NewValue, 'Tag'))
    case 'radiobutton_wzor' 
        handles.rodzaj_plota = 1;

    case 'radiobutton_wartosc' 
        handles.rodzaj_plota = 2;

end

%zapis danych
guidata(hObject,handles);


% --- Executes when selected object is changed in uibuttongroup5.
function uibuttongroup5_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup5 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Zmiana wyboru zakresy f(x), mo¿liwoœci to automatyczne dopasowanie zakresu
%albo rêczny wybór zakresu
switch(get(eventdata.NewValue, 'Tag'))
    case 'radiobutton_automatyczny' 
        handles.wprowadzenie_zakresu_y = 0;
        set(handles.edit_y_od, 'Enable', 'off');
        set(handles.edit_y_do, 'Enable', 'off');
    case 'radiobutton_reczny' 
        handles.wprowadzenie_zakresu_y = 1;
        set(handles.edit_y_od, 'Enable', 'on');
        set(handles.edit_y_do, 'Enable', 'on');

end

%zapis danych
guidata(hObject,handles);


% --- Executes on button press in Rysuj_Pushbutton.
function Rysuj_Pushbutton_Callback(hObject, eventdata, handles)

    %Zerowanie komunikatu o b³êdzie
    set(handles.text_komunikat, 'String', '');
    set(handles.text_komunikat, 'FontSize', 14);

    %Zczytanie z GUI zakresu x na wykresie, zakresu y na wykresie oraz dok³adnoœci czyli podzia³ki na
    %osi x i zapisanie ich do zmiennych typu double w strukturze handles
    string_x_od = get(handles.edit_x_od, 'string');
    x_od = str2double(string_x_od);
    handles.x_od = x_od;
    
    string_x_do = get(handles.edit_x_do, 'string');
    x_do = str2double(string_x_do);
    handles.x_do = x_do;
    
    string_dokladnosc = get(handles.edit_dokladnosc, 'string');
    dokladnosc = str2double(string_dokladnosc);
    
    %Dodawanie do handles wektora x
    handles.x = x_od:dokladnosc:x_do;
    
    string_y_od = get(handles.edit_y_od, 'string');
    y_od = str2double(string_y_od);
    handles.y_od = y_od;
    
    string_y_do = get(handles.edit_y_do, 'string');
    y_do = str2double(string_y_do);
    handles.y_do = y_do;
    
    %Wybieranie rodzaju dodawania nowego plota do wykresu
    if handles.radiobutton_next_plot == 1
        set(handles.axes1, 'NextPlot', 'replace');
    elseif handles.radiobutton_next_plot == 2
        set(handles.axes1, 'NextPlot', 'add');
    end
    
    % Update handles structure
    guidata(hObject,handles);

    
    %Wywo³ywanie odpowiednich opcji rysuj¹cych, ale z mechanizmem obs³ugi
    %b³êdów w przypadku podania nieprawid³owych danych wejœciowych
     try
         
        if handles.radiobutton == 1
            Opcja1(handles)

        elseif handles.radiobutton == 2
            Opcja2(handles)

        elseif handles.radiobutton == 3
            Opcja3(handles)

        elseif handles.radiobutton == 4
            Opcja4(handles)
    
        end
        
    catch
        set(handles.text_komunikat, 'String', 'Error - B³êdne dane wejœciowe');
        set(handles.text_komunikat, 'FontSize', 20);
        warning('B³êdne dane wejœciowe');
     end


%Rysowanie wybranej funkcji z rozwijanego menu, której argumentem jest
%podany wielomian
function Opcja1(handles)

    %Zresetowanie komunikatu o b³êdzie
    set(handles.text_komunikat, 'String', '');

    %Pobranie danych o wartoœci wspó³rzynników wielomianu 
    string_wsp_a = get(handles.edit_wsp_a, 'string');
    wsp_a = str2double(string_wsp_a);

    string_wsp_b = get(handles.edit_wsp_b, 'string');
    wsp_b = str2double(string_wsp_b);

    string_wsp_c = get(handles.edit_wsp_c, 'string');
    wsp_c = str2double(string_wsp_c);

    string_wsp_d = get(handles.edit_wsp_d, 'string');
    wsp_d = str2double(string_wsp_d);
    
    %Rysowanie odpowiedniej funkcji w zale¿noœci od wybranej opcji
    
    %sinus
    if handles.funkcja1 == 1        
        
        x = handles.x;
        funkcja = sin(wsp_a*x.^3 + wsp_b*x.^2 + wsp_c*x + wsp_d );
        plot(x, funkcja);
        
         %Dodawanie ograniczeñ na osiach jeœli u¿ytkownik wybra³ tê opcjê
         if(handles.wprowadzenie_zakresu_y == 1)
             ylim([handles.y_od handles.y_do]);
         end
        
         xlim([handles.x_od handles.x_do]);
                
        %Wpisywanie do pola tekstowego wybranej funkcji
        wyswietl_sin = ['sin(', string_wsp_a, '*x.^3 + ', string_wsp_b, '*x.^2 + ', string_wsp_c, '*x + ', string_wsp_d, ')'];
        set(handles.edit_wyswietl,'String', wyswietl_sin)
        
        %Funkcja badaj¹ca monotonicznoœæ wybranej funkcji
        Badanie_monotonicznosci(funkcja, handles);
        
    %cosinus    
    elseif handles.funkcja1 == 2        
        
        x = handles.x;
        funkcja = cos(wsp_a*x.^3 + wsp_b*x.^2 + wsp_c*x + wsp_d );
        plot(x, funkcja);
        
        if(handles.wprowadzenie_zakresu_y == 1)
            ylim([handles.y_od handles.y_do]);
        end
        
        xlim([handles.x_od handles.x_do]);
                
        wyswietl_cos = ['cos(', string_wsp_a, '*x.^3 + ', string_wsp_b, '*x.^2 + ', string_wsp_c, '*x + ', string_wsp_d, ')'];
        set(handles.edit_wyswietl,'String', wyswietl_cos)
        
        Badanie_monotonicznosci(funkcja, handles);
        
    %tangens    
    elseif handles.funkcja1 == 3        
        
        %Liczenie ile od asymptoty znajduje siê funkcja tan jeœli
        %u¿ytkownik poda³ tylko parametr d (sprawdzenie czy nie poda³
        %wartoœci z asymptoty)
        if wsp_d >=0
            przyblizenie_tan = rem(wsp_d + pi/2, pi);
        elseif wsp_d < 0
            przyblizenie_tan = rem(-wsp_d + pi/2, pi);
        end
        
        %Sprawdzanie czy u¿ywkownik nie poda³ sta³ej wartoœci tan, która
        %jest sprzeczna
        if wsp_a == 0 && wsp_b == 0 && wsp_c == 0 && (przyblizenie_tan<0.03 || przyblizenie_tan > 3.11)
            set(handles.text_komunikat, 'String', 'Poda³eœ nieprawid³owe dane');
        else
            set(handles.text_komunikat, 'String', '');
            
            x = handles.x;
            funkcja = tan(wsp_a*x.^3 + wsp_b*x.^2 + wsp_c*x + wsp_d);
            
            x_tan = [];
            [~, koniec_tan] = size(handles.x);

            %Przepiswyanie do wektora x tylko takich wartoœci f(x) które
            %nie s¹ zbyt du¿e, bo tan dla -pi/2 i +pi/2 d¹¿y do
            %nieskoñczonoœci, wiêc to ogranicza nam zbiór wartoœci funkcji,
            %¿eby wykres by³ czytelny, te miejsca, gdzie wartoœci s¹ za
            %du¿e s¹ nadpisane przez Inf, poniewa¿ Ind zostawia puste 
            %miejsce w wykresie

            for i=1:koniec_tan

               if tan((handles.x(1, i)^3)*wsp_a + (handles.x(1, i)^2)*wsp_b + (handles.x(1, i))*wsp_c + wsp_d)> handles.y_do || tan((handles.x(1, i)^3)*wsp_a + (handles.x(1, i)^2)*wsp_b + (handles.x(1, i))*wsp_c + wsp_d) < handles.y_od
                    x_tan = [x_tan, Inf];
               else 
                   x_tan = [x_tan, handles.x(1, i)];
               end

            end
            
        plot(x_tan, funkcja);
        
        if(handles.wprowadzenie_zakresu_y == 1)
            ylim([handles.y_od handles.y_do]);
        end
        
        xlim([handles.x_od handles.x_do]);
                
        wyswietl_tan = ['tan(', string_wsp_a, '*x.^3 + ', string_wsp_b, '*x.^2 + ', string_wsp_c, '*x + ', string_wsp_d, ')'];
        set(handles.edit_wyswietl,'String', wyswietl_tan)
        
        Badanie_monotonicznosci(funkcja, handles);
        end
        
    %cotangens   
    elseif handles.funkcja1 == 4        
        
        if wsp_d >=0
            przyblizenie_cot = rem(wsp_d, pi);
        elseif wsp_d < 0
            przyblizenie_cot = rem(-wsp_d, pi);
        end
            
        if wsp_a == 0 && wsp_b == 0 && wsp_c == 0 && (przyblizenie_cot<0.03 || przyblizenie_cot > 3.11)
            set(handles.text_komunikat, 'String', 'Poda³eœ nieprawid³owe dane');
        else
            set(handles.text_komunikat, 'String', '');
            
            x = handles.x;
            funkcja = cot(wsp_a*x.^3 + wsp_b*x.^2 + wsp_c*x + wsp_d);
            
            x_cot = [];
            [~, koniec_cot] = size(handles.x);

            %Przepiswyanie do wektora x tylko takich wartoœci f(x) które
            %nie s¹ zbyt du¿e, bo cot dla -pi/2 i +pi/2 d¹¿y do
            %nieskoñczonoœci, wiêc to ogranicza nam zbiór wartoœci funkcji,
            %¿eby wykres by³ czytelny

            for i=1:koniec_cot

               if cot((handles.x(1, i)^3)*wsp_a + (handles.x(1, i)^2)*wsp_b + (handles.x(1, i))*wsp_c + wsp_d)<30 && cot((handles.x(1, i)^3)*wsp_a + (handles.x(1, i)^2)*wsp_b + (handles.x(1, i))*wsp_c + wsp_d) > -30
                    x_cot = [x_cot, handles.x(1, i)];
               else
                   x_cot = [x_cot, Inf];
               end

            end

            plot(x_cot, funkcja);
            
            if(handles.wprowadzenie_zakresu_y == 1)
                   ylim([handles.y_od handles.y_do]);
            end     
        
            xlim([handles.x_od handles.x_do]);
                
            wyswietl_cot = ['cot(', string_wsp_a, '*x.^3 + ', string_wsp_b, '*x.^2 + ', string_wsp_c, '*x + ', string_wsp_d, ')'];
            set(handles.edit_wyswietl,'String', wyswietl_cot)
            
            Badanie_monotonicznosci(funkcja, handles);
        end
        
    %funkcja esksponencjalna    
    elseif handles.funkcja1 == 5        
        
        x = handles.x;
        funkcja = exp(wsp_a*x.^3 + wsp_b*x.^2 + wsp_c*x + wsp_d );
        plot(x, funkcja);
        
        if(handles.wprowadzenie_zakresu_y == 1)
            ylim([handles.y_od handles.y_do]);
        end
        
        xlim([handles.x_od handles.x_do]);
                
        wyswietl_exp = ['exp(', string_wsp_a, '*x.^3 + ', string_wsp_b, '*x.^2 + ', string_wsp_c, '*x + ', string_wsp_d, ')'];
        set(handles.edit_wyswietl,'String', wyswietl_exp)
        
        Badanie_monotonicznosci(funkcja, handles);
        
    %pierwiastek    
    elseif handles.funkcja1 == 6        
        
        x = handles.x;
        
        %Sprawdzanie czy u¿ytkownik nie poda³ ujemnej wartoœci dla u³amka
        if wsp_a == 0 && wsp_b == 0 && wsp_c == 0 && wsp_d < 0
            set(handles.text_komunikat, 'String', 'Poda³eœ nieprawid³owe dane');
        else
            set(handles.text_komunikat, 'String', '');
            funkcja = real(sqrt(wsp_a*x.^3 + wsp_b*x.^2 + wsp_c*x + wsp_d ));
            plot(x, funkcja);
            
            if(handles.wprowadzenie_zakresu_y == 1)
                ylim([handles.y_od handles.y_do]);
            end
        
            xlim([handles.x_od handles.x_do]);
                
            wyswietl_sqrt = ['sqrt(', string_wsp_a, '*x.^3 + ', string_wsp_b, '*x.^2 + ', string_wsp_c, '*x + ', string_wsp_d, ')'];
            set(handles.edit_wyswietl,'String', wyswietl_sqrt)
            
            Badanie_monotonicznosci(funkcja, handles);
        end
            
    %logarytm naturalny    
    elseif handles.funkcja1 == 7        
        
        %Sprawdzanie czy u¿ytkownik nie poda³ ujemnej wartoœci dla logarytmu
        if wsp_a == 0 && wsp_b == 0 && wsp_c == 0 && wsp_d < 0
            set(handles.text_komunikat, 'String', 'Poda³eœ nieprawid³owe dane');
        else
            set(handles.text_komunikat, 'String', '');
            
            x=handles.x;
            funkcja = real(log(wsp_a*x.^3 + wsp_b*x.^2 + wsp_c*x + wsp_d ));
            
            x_log = [];
            [~, koniec_log] = size(handles.x);

            %Przepiswyanie do wektora x tylko takich wartoœci f(x) które
            %spe³niaj¹ za³o¿enia dla logarytmów

            for i=1:koniec_log

               wartosc_log = (handles.x(1, i)^3)*wsp_a + (handles.x(1, i)^2)*wsp_b + (handles.x(1, i))*wsp_c + wsp_d;
               if wartosc_log > 0
                    x_log = [x_log, handles.x(1, i)];
               else
                   x_log = [x_log, Inf];
               end

            end
            
            %Jeœli jedynie 3 punkty spe³nij¹ za³o¿enie, to znaczy, ¿e
            %podane dane s¹ nieprawid³owe, gdy¿ wygenerowa³y tylko 3
            %prawid³owe pkt - funkcja jest jakby na granicy swojej
            %dziedziny
            if size(x_log) < 3
                set(handles.text_komunikat, 'String', 'Poda³eœ nieprawid³owe dane, prawdopodobnie nie spe³niaj¹ one za³o¿eñ dla danej funkcji');
            else
                set(handles.text_komunikat, 'String', '');
                
                plot(x_log, funkcja);    
                 if(handles.wprowadzenie_zakresu_y == 1)
                    ylim([handles.y_od handles.y_do]);
                 end
        
                xlim([handles.x_od handles.x_do]);
                
                wyswietl_log = ['log(', string_wsp_a, '*x.^3 + ', string_wsp_b, '*x.^2 + ', string_wsp_c, '*x + ', string_wsp_d, ')'];       
                set(handles.edit_wyswietl,'String', wyswietl_log)
                
                Badanie_monotonicznosci(funkcja, handles);
            end
        end
        
    %logarytm o podstawie 10    
    elseif handles.funkcja1 == 8        
        
        if wsp_a == 0 && wsp_b == 0 && wsp_c == 0 && wsp_d < 0
            set(handles.text_komunikat, 'String', 'Poda³eœ nieprawid³owe dane');
        else
            set(handles.text_komunikat, 'String', '');
            
            x=handles.x;
            funkcja = real(log10(wsp_a*x.^3 + wsp_b*x.^2 + wsp_c*x + wsp_d ));
            x_log10 = [];
            [~, koniec_log10] = size(handles.x);

            %Przepiswyanie do wektora x tylko takich wartoœci f(x) które
            %spe³niaj¹ za³o¿enia dla logarytmów

            for i=1:koniec_log10

               wartosc_log10 = (handles.x(1, i)^3)*wsp_a + (handles.x(1, i)^2)*wsp_b + (handles.x(1, i))*wsp_c + wsp_d;
               if wartosc_log10 > 0
                    x_log10 = [x_log10, handles.x(1, i)];
               else
                   x_log10 = [x_log10, Inf];
               end

            end
            
            if size(x_log10) < 3
                set(handles.text_komunikat, 'String', 'Poda³eœ nieprawid³owe dane, prawdopodobnie nie spe³niaj¹ one za³o¿eñ dla danej funkcji');
            else
                set(handles.text_komunikat, 'String', '');
                
                plot(x_log10, funkcja);  
                if(handles.wprowadzenie_zakresu_y == 1)
                    ylim([handles.y_od handles.y_do]);
                end
        
                xlim([handles.x_od handles.x_do]);
        
                wyswietl_log10 = ['log10(', string_wsp_a, '*x.^3 + ', string_wsp_b, '*x.^2 + ', string_wsp_c, '*x + ', string_wsp_d, ')'];
                set(handles.edit_wyswietl,'String', wyswietl_log10)
                
                Badanie_monotonicznosci(funkcja, handles);
            end
        end
        
    %wielomian zmiennej x    
    elseif handles.funkcja1 == 9        
        
        x = handles.x;
        funkcja = wsp_a*x.^3 + wsp_b*x.^2 + wsp_c*x + wsp_d;
        plot(x, funkcja );
        
        if(handles.wprowadzenie_zakresu_y == 1)
            ylim([handles.y_od handles.y_do]);
        end
        
        xlim([handles.x_od handles.x_do]);
        
        wyswietl_wielomian = [string_wsp_a, '*x.^3 + ', string_wsp_b, '*x.^2 + ', string_wsp_c, '*x + ', string_wsp_d];
        set(handles.edit_wyswietl,'String', wyswietl_wielomian)
        
        Badanie_monotonicznosci(funkcja, handles);
        
    %x^(wielomian zmiennej x)    
    elseif handles.funkcja1 == 10       
            
        x = handles.x;
        funkcja = (x.^(wsp_a*x.^3 + wsp_b*x.^2 + wsp_c*x + wsp_d ));
        plot(x, funkcja);
        
        if(handles.wprowadzenie_zakresu_y == 1)
            ylim([handles.y_od handles.y_do]);
        end
        
        xlim([handles.x_od handles.x_do]);
        
        wyswietl_power = ['x.^(', string_wsp_a, '*x.^3 + ', string_wsp_b, '*x.^2 + ', string_wsp_c, '*x + ', string_wsp_d, ')'];
        set(handles.edit_wyswietl,'String', wyswietl_power)
        
        Badanie_monotonicznosci(funkcja, handles);
        
    end
    
    
%logarytm o dowolnej podstawie z wielomianu zmiennej x
function Opcja2(handles)

    %Odczytywanie podstawy logarytmu z pola tekstowego
    string_podstawa_loga = get(handles.edit_podstawa_loga, 'string');
    podstawa_loga = str2double(string_podstawa_loga);
    
    %Sprawdzanie czy u¿ytkownik nie poda³ b³êdnej podstawy
    if podstawa_loga<=0 || podstawa_loga == 1
        set(handles.text_komunikat, 'String', 'Poda³eœ nieprawid³owe dane');
     
    else
        set(handles.text_komunikat, 'String', '');
          
        string_wsp_a = get(handles.edit_wsp_a, 'string');
        wsp_a = str2double(string_wsp_a);

        string_wsp_b = get(handles.edit_wsp_b, 'string');
        wsp_b = str2double(string_wsp_b);

        string_wsp_c = get(handles.edit_wsp_c, 'string');
        wsp_c = str2double(string_wsp_c);

        string_wsp_d = get(handles.edit_wsp_d, 'string');
        wsp_d = str2double(string_wsp_d);
        
        x=handles.x;
        funkcja = real(log(wsp_a*x.^3 + wsp_b*x.^2 + wsp_c*x + wsp_d )/log(podstawa_loga));

        x_loga = [];
        [~, koniec_loga] = size(handles.x);
        
        %Przepiswyanie do wektora x tylko takich wartoœci f(x) które
        %spe³niaj¹ za³o¿enia dla logarytmów
        
        %Przepiswyanie do wektora x tylko takich wartoœci f(x) które
        %spe³niaj¹ za³o¿enia dla logarytmów, wartoœci nie spe³niaj¹ce
        %za³o¿eñ zapisywane s¹ jako Inf, gdy¿ takie wartosci matlab pomija
        %rysuj¹æ wykres pozostawiaj¹c pust¹ dziurê w plocie
        for i=1:koniec_loga
            
           wartosc_loga = (handles.x(1, i)^3)*wsp_a + (handles.x(1, i)^2)*wsp_b + (handles.x(1, i))*wsp_c + wsp_d;
           if wartosc_loga > 0
                x_loga = [x_loga, handles.x(1, i)];
           else
                x_loga = [x_loga, Inf];
           end
                
        end
        
        if size(x_loga) < 3
            set(handles.text_komunikat, 'String', 'Poda³eœ nieprawid³owe dane, prawdopodobnie nie spe³niaj¹ one za³o¿eñ dla danej funkcji');
        else
            set(handles.text_komunikat, 'String', '');
            
            plot(x_loga,real(funkcja));
            
             if(handles.wprowadzenie_zakresu_y == 1)
                ylim([handles.y_od handles.y_do]);
             end
        
             xlim([handles.x_od handles.x_do]);
        
            wyswietl_loga_inna_podstawa = ['log', '(', string_wsp_a, '*x.^3 + ', string_wsp_b, '*x.^2 + ', string_wsp_c, '*x + ', string_wsp_d, ')', '/', 'log', '(', string_podstawa_loga,')'];
            set(handles.edit_wyswietl,'String', wyswietl_loga_inna_podstawa)
            
            Badanie_monotonicznosci(funkcja, handles);
        end
    
    end
    
   
%Funkcja potêgowa o dowolnej sta³ej podstawie, w potêdze jest wielomian zmiennej x czyli f(x)    
function Opcja3(handles)

    %Wczytywanie podstawy potêgi
    string_podstawa_potegi = get(handles.edit_podstawa_potegi, 'string');
    podstawa_potegi = str2double(string_podstawa_potegi);
    
    %Sprawdzanie czy podstawa jest zgodna z za³o¿eniami
    if podstawa_potegi<=0
        set(handles.text_komunikat, 'String', 'Poda³eœ nieprawid³owe dane');
    else
        
        set(handles.text_komunikat, 'String', '');
          
        string_wsp_a = get(handles.edit_wsp_a, 'string');
        wsp_a = str2double(string_wsp_a);

        string_wsp_b = get(handles.edit_wsp_b, 'string');
        wsp_b = str2double(string_wsp_b);

        string_wsp_c = get(handles.edit_wsp_c, 'string');
        wsp_c = str2double(string_wsp_c);

        string_wsp_d = get(handles.edit_wsp_d, 'string');
        wsp_d = str2double(string_wsp_d);

        x = handles.x;
        funkcja = podstawa_potegi.^(wsp_a*x.^3 + wsp_b*x.^2 + wsp_c*x + wsp_d );
        
        plot(x, funkcja);
        
        if(handles.wprowadzenie_zakresu_y == 1)
            ylim([handles.y_od handles.y_do]);
        end
        
        xlim([handles.x_od handles.x_do]);
        
        wyswietl_potega_a = [string_podstawa_potegi, '.', '^(', string_wsp_a, '*x.^3 + ', string_wsp_b, '*x.^2 + ', string_wsp_c, '*x + ', string_wsp_d, ')'];
        set(handles.edit_wyswietl,'String', wyswietl_potega_a)
        
        Badanie_monotonicznosci(funkcja, handles);
        
    end


%Rysowanie funkcji wprowadzonej przez u¿ytkownika w pole tekstowe    
function Opcja4(handles)

    %Tworzenie wektora argumentu x
    x = handles.x;
    
    %Pobieranie wzoru jako string z odpowiedniego pola tekstowego
    wpisany_wzor = get(handles.edit_wyswietl, 'string');
    
    %Sprawdzane czy w stringu wystêpuje tangens albo cotanges, bo jeœli
    %wystêpuje to konieczne bêdzie ograniczenie wartoœci funkcji, ¿eby nie
    %lecia³a do nieskoñczonoœci w asymptotach
    szukanie_tan = strfind(wpisany_wzor, 'tan');
    [~, wielkosc_szukanie_tan] = size(szukanie_tan);
    
    szukanie_cot = strfind(wpisany_wzor, 'cot');
    [~, wielkosc_szukanie_cot] = size(szukanie_cot);
    
    %Sprawdzanie czy w stringu wystêpuje w ogóle zmienna x, bo jeœli nie to
    %wtedy funkcja ma sta³¹ wartoœæ i wiemy, ¿e jest sta³a
    szukanie_x = strfind(wpisany_wzor, 'x');
    [~, wielkosc_szukanie_x] = size(szukanie_x);
    
    %Sprawdzanie czy wczytany string mo¿e byæ przekonwertowany na wzór
    %matematyczny, jeœli nie, to wyœwietlony zostaje odpowiedni komunikat
    try
        %Konwertowanie stringa do funkcji matematycznej z u¿yciem 'eval'
        funkcja = eval(wpisany_wzor);
    catch
        set(handles.text_komunikat, 'String', 'Error - B³êdne dane wejœciowe - Zalecany restart');
        set(handles.text_komunikat, 'FontSize', 20);
        warning('B³êdne dane wejœciowe');
    end
    
    
    %funkcja = eval(wpisany_wzor);
   
    %Rysowanie wykresów (u¿ywanie plota bez zaznaczania wszystkich pkt)
    if(handles.rodzaj_plota == 1)
        
        %Jeœli znaleziono w stringu funkcji wyst¹pienie cot albo tan to
        %wprowadŸ ograniczenia analogicznie jak dla samego tan albo cot
        if(wielkosc_szukanie_cot > 0 || wielkosc_szukanie_tan > 0)
            
            set(handles.text_komunikat, 'String', '');
            x_tan = [];
            [~, koniec_tan] = size(handles.x);

            for i=1:koniec_tan

               if funkcja(i) > handles.y_do || funkcja(i) < handles.y_od
                    x_tan = [x_tan, Inf];
               else 
                    x_tan = [x_tan, handles.x(1, i)];
               end

            end
            plot(x_tan, real(funkcja), '-');
            
        else
            plot(x, real(funkcja), '-');
        end
        
        if(handles.wprowadzenie_zakresu_y == 1)
            ylim([handles.y_od handles.y_do]);
        end
        
        xlim([handles.x_od handles.x_do]);
        
    %Rysowanie plota rysuj¹c wszystkie punkty na wykresie - u¿ywane najlepiej dla funkcji sta³owartoœciowych, gdy¿ matlab
    %lepiej sobie radzi z rysowaniem takich funkcji, jesli zaznacza je
    %punktami, do tego bardziej optymalnie jest przypisac rêcznie do t¹ sam¹ wartoœæ f(x) do wszystkich x
    elseif(handles.rodzaj_plota == 2)
        
        if(wielkosc_szukanie_cot > 0 || wielkosc_szukanie_tan > 0)
            
            set(handles.text_komunikat, 'String', '');
            x_tan = [];
            [~, koniec_tan] = size(handles.x);

            for i=1:koniec_tan

               if funkcja(i) > handles.y_do || funkcja(i) < handles.y_od
                    x_tan = [x_tan, Inf];
               else 
                    x_tan = [x_tan, handles.x(1, i)];
               end

            end
            plot(x_tan, real(funkcja), '.');
            
        % Jeœli funkcja nie ma zmiennej x, czyli jest sta³owartoœciowa
        elseif(wielkosc_szukanie_x == 0)
            
            wartosc_funkcji = funkcja;
            
           [~, dlugosc_x] = size(handles.x);
           for i =1:dlugosc_x
               funkcja(i) = wartosc_funkcji;
           end
           
           plot(x, real(funkcja), '.');
           
        else
            plot(x, real(funkcja), '.');
        end
        
        if(handles.wprowadzenie_zakresu_y == 1)
            ylim([handles.y_od handles.y_do]);
        end
        
        xlim([handles.x_od handles.x_do]);
        
    end
    
    Badanie_monotonicznosci(funkcja, handles);
 

%Funkcja badaj¹ca cechy monotonicznosci funkcji matematycznej
function Badanie_monotonicznosci(funkcja, handles)
    
    %Sprawdzanie monotonicznoœci oraz typu monotonicznoœci
    czy_monotoniczna = issorted(funkcja, 'monotonic');
    if(czy_monotoniczna == 1)
        set(handles.text_czy_monotoniczna, 'String', 'tak');
        
        %Funkcja sprawdzaj¹ca czy dana funkcja matematyczna jest
        %sta³owartoœciowa
        czy_constant1 = Sprawdzanie_czy_constant(funkcja, handles);
        if(czy_constant1 == 1)
            set(handles.text_typ_monotonicznosci, 'String', 'sta³a');
  
        elseif(issorted(funkcja, 'ascend')==1)
           
            if(issorted(funkcja, 'strictascend')==1)
                set(handles.text_typ_monotonicznosci, 'String', 'stale rosn¹ca');        
            else
                set(handles.text_typ_monotonicznosci, 'String', 'niemalej¹ca');
            end

        elseif(issorted(funkcja, 'descend')==1)
            
            if(issorted(funkcja, 'strictdescend')==1)
                set(handles.text_typ_monotonicznosci, 'String', 'stale malej¹ca');        
            else
                set(handles.text_typ_monotonicznosci, 'String', 'nierosn¹ca');
            end
        end

    else
        set(handles.text_czy_monotoniczna, 'String', 'nie');
        set(handles.text_typ_monotonicznosci, 'String', '-');
    end
    
    %Badanie wypuk³oœci
    
    %Druga pochodna:
    druga_pochodna = diff(diff(funkcja));
    %Flagi obrazuj¹ce wypuk³oœæ
    czy_wypukla = 0;
    czy_wklesla = 0;
    
    [~, wielkosc_pochodnej] = size(druga_pochodna);
    
    %Sprawdzanie wypuk³oœæi, dla funkcji wypuk³ej druga pochodna jest
    %zawsze nieujemna, a dla f. wklês³ej jest zawsze niedodatnia
    for i=1:wielkosc_pochodnej
        if(druga_pochodna(i) >= 0)
            czy_wypukla = 1;
        else
            czy_wypukla = 0;
            break
        end
    end
    
    for i=1:wielkosc_pochodnej
        if(druga_pochodna(i) <= 0)
            czy_wklesla = 1;
        else
            czy_wklesla = 0;
            break
        end
    end
    
    if(czy_wypukla == 1)
        set(handles.text_wypuklosc, 'String', 'Wypuk³a');
    elseif(czy_wklesla == 1)
        set(handles.text_wypuklosc, 'String', 'Wklês³a');
    else
        set(handles.text_wypuklosc, 'String', 'nie');
    end
    
    
    %Ten fragment kody zosta³ zast¹piony funkcj¹ matlabow¹ max() i min()
%{
    %Szukanie minimów i maximów
    Dotychczasowe_min = funkcja(1);
    Dotychczasowe_max = funkcja(1);
    
    [~, dlugosc_x] = size(handles.x);
    
    %Przeszukiwanie wartoœci funkcji w celu sprawdzenia czy s¹ wartoœci
    %wiêksze lub mniejsze ni¿ dotychczasowe znalezione min i max
    for i =1:dlugosc_x
        if(funkcja(i) > Dotychczasowe_max)
            Dotychczasowe_max = funkcja(i);
        end
        
        if(funkcja(i) < Dotychczasowe_min)
            Dotychczasowe_min = funkcja(i);
        end
    end
    
%}
    Dotychczasowe_max = max(funkcja);
    Dotychczasowe_min = min(funkcja);
    
    set(handles.text_max, 'String', Dotychczasowe_max);
    set(handles.text_min, 'String', Dotychczasowe_min);
    
    

%Funkcja sprawdzaj¹ca czy funkcja matematyczna jest funkcj¹ sta³¹
function czy_constant =  Sprawdzanie_czy_constant(funkcja, handles)

    [~, wielkosc_x] = size(handles.x);
    
    %Jeœli wszystkie wartoœci danej funkcji s¹ takie same to jest to
    %funkcja sta³owartoœciowa
    for i=1:wielkosc_x - 1
        if(funkcja(i) == funkcja(i+1))
             czy_takie_same =1;
        else
            czy_takie_same = 0;
            break
        end    
    end
    
    if(czy_takie_same == 1) 
        czy_constant = 1;
    else
        czy_constant = 0;
    end
    
    
% --- Executes during object creation, after setting all properties.
function menu_funkcji_CreateFcn(hObject, eventdata, handles)
% hObject    handle to menu_funkcji (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit_wsp_a_Callback(hObject, eventdata, handles)
% hObject    handle to edit_wsp_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_wsp_a as text
%        str2double(get(hObject,'String')) returns contents of edit_wsp_a as a double


% --- Executes during object creation, after setting all properties.
function edit_wsp_a_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_wsp_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit_wsp_b_Callback(hObject, eventdata, handles)
% hObject    handle to edit_wsp_b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_wsp_b as text
%        str2double(get(hObject,'String')) returns contents of edit_wsp_b as a double


% --- Executes during object creation, after setting all properties.
function edit_wsp_b_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_wsp_b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit_wsp_c_Callback(hObject, eventdata, handles)
% hObject    handle to edit_wsp_c (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_wsp_c as text
%        str2double(get(hObject,'String')) returns contents of edit_wsp_c as a double


% --- Executes during object creation, after setting all properties.
function edit_wsp_c_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_wsp_c (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit_wsp_d_Callback(hObject, eventdata, handles)
% hObject    handle to edit_wsp_d (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_wsp_d as text
%        str2double(get(hObject,'String')) returns contents of edit_wsp_d as a double


% --- Executes during object creation, after setting all properties.
function edit_wsp_d_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_wsp_d (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function uibuttongroup1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uibuttongroup1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object deletion, before destroying properties.
function uibuttongroup1_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to uibuttongroup2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


function edit_wyswietl_Callback(hObject, eventdata, handles)
% hObject    handle to edit_wyswietl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_wyswietl as text
%        str2double(get(hObject,'String')) returns contents of edit_wyswietl as a double


% --- Executes during object creation, after setting all properties.
function edit_wyswietl_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_wyswietl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit_podstawa_loga_Callback(hObject, eventdata, handles)
% hObject    handle to edit_podstawa_loga (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_podstawa_loga as text
%        str2double(get(hObject,'String')) returns contents of edit_podstawa_loga as a double


% --- Executes during object creation, after setting all properties.
function edit_podstawa_loga_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_podstawa_loga (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
    

function edit_x_od_Callback(hObject, eventdata, handles)
% hObject    handle to edit_x_od (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_x_od as text
%        str2double(get(hObject,'String')) returns contents of edit_x_od as a double


% --- Executes during object creation, after setting all properties.
function edit_x_od_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_x_od (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit_x_do_Callback(hObject, eventdata, handles)
% hObject    handle to edit_x_do (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_x_do as text
%        str2double(get(hObject,'String')) returns contents of edit_x_do as a double


% --- Executes during object creation, after setting all properties.
function edit_x_do_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_x_do (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3


% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit_podstawa_potegi_Callback(hObject, eventdata, handles)
% hObject    handle to edit_podstawa_potegi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_podstawa_potegi as text
%        str2double(get(hObject,'String')) returns contents of edit_podstawa_potegi as a double


% --- Executes during object creation, after setting all properties.
function edit_podstawa_potegi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_podstawa_potegi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object deletion, before destroying properties.
function uibuttongroup3_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to uibuttongroup3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


function edit_y_od_Callback(hObject, eventdata, handles)
% hObject    handle to edit_y_od (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_y_od as text
%        str2double(get(hObject,'String')) returns contents of edit_y_od as a double


% --- Executes during object creation, after setting all properties.
function edit_y_od_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_y_od (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit_y_do_Callback(hObject, eventdata, handles)
% hObject    handle to edit_y_do (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_y_do as text
%        str2double(get(hObject,'String')) returns contents of edit_y_do as a double


% --- Executes during object creation, after setting all properties.
function edit_y_do_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_y_do (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit_dokladnosc_Callback(hObject, eventdata, handles)
% hObject    handle to edit_dokladnosc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_dokladnosc as text
%        str2double(get(hObject,'String')) returns contents of edit_dokladnosc as a double


% --- Executes during object creation, after setting all properties.
function edit_dokladnosc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_dokladnosc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


%Button zamykaj¹cy GUI
% --- Executes on button press in pushbutton_zamknij.
function pushbutton_zamknij_Callback(hObject, eventdata, handles)
%clc;
clearStr = 'clear all';
evalin('base',clearStr);
delete(handles.figure1);
% hObject    handle to pushbutton_zamknij (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
