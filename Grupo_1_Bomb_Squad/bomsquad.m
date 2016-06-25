function varargout = bomsquad(varargin)
% BOMSQUAD M-file for bomsquad.fig
%      BOMSQUAD, by itself, creates a new BOMSQUAD or raises the existing
%      singleton*.
%
%      H = BOMSQUAD returns the handle to a new BOMSQUAD or the handle to
%      the existing singleton*.
%
%      BOMSQUAD('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BOMSQUAD.M with the given input arguments.
%
%      BOMSQUAD('Property','Value',...) creates a new BOMSQUAD or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before bomsquad_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to bomsquad_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help bomsquad

% Last Modified by GUIDE v2.5 24-Jun-2016 21:37:51

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @bomsquad_OpeningFcn, ...
                   'gui_OutputFcn',  @bomsquad_OutputFcn, ...
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


% --- Executes just before bomsquad is made visible.
function bomsquad_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to bomsquad (see VARARGIN)

% Choose default command line output for bomsquad
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

global thereIsTime startX endX f x y currentIndex bombTimer precision;

precision = 0.1;

thereIsTime = true;
setTime(0);

startX = -1;
endX = 2;
axis([startX endX -1 inf]);

func = getRandFunctions();
set(handles.wireFunction, 'String', func);
%f = @(x) cos(x) - exp(-x); % Made the function available as an anonymous function 'f'
f = inline(func);

x = linspace(startX, endX, 20); % Function 'f' x values
y = [];
for i = 1:length(x)
    y = [y f(x(i))];
end

currentIndex = 1; % The current index on 'x' array

set(handles.axes3,'YTickLabel',[]); % Take out the Y axis numbers

bombTimer = timer('ExecutionMode', 'FixedRate', ...
    'Period', 3, ...
    'TimerFcn', {@(~,~)updateBombValue});
disableButtons(handles);


% UIWAIT makes bomsquad wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = bomsquad_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

function disableButtons(handles)
    set(handles.cutBtn, 'Enable', 'off');
    set(handles.testBtn, 'Enable', 'off');
    
function enableButtons(handles)
    set(handles.cutBtn, 'Enable', 'on');
    set(handles.testBtn, 'Enable', 'on');

function updateBombValue
    global x y currentIndex precision;
    if currentIndex <= length(x)
        
        disp(y(currentIndex));
        
        if abs(y(currentIndex)) > precision
            disp(currentIndex);
            plot(x(1:currentIndex), y(1:currentIndex));
            currentIndex = currentIndex + 1;
        else
            disp('A bomba chegou primeiro na raiz e explodiu! Perdeu!');
            endGame(false);
        end
    else
        disp('Função acabou.');
    end
    
function endGame(win)
    global thereIsTime currentIndex bombTimer;
    currentIndex = 1;
    thereIsTime = false;
    setTime(0);
    stop(bombTimer);
    close(bomsquad);
    
    if win
        bomb_defused % Open the bomb defused screen
        [signal,Fs]=audioread('bomb_has_been_defused.wav');
    else
        exploded % Open the bomb exploded screen
        [signal,Fs]=audioread('bomb_exploded.wav');
    end
    
    % Plays the respective audio
    player=audioplayer(signal,Fs); 
    play(player)
    pause(3);
    

% --- Executes on button press in startPlay.
function startPlay_Callback(hObject, eventdata, handles)
    global bombTimer;
    set(hObject, 'Enable', 'off'); % Disable startPlay button
    enableButtons(handles);
    start(bombTimer);
    startTimer(handles);
    
function startTimer(handles)
    global thereIsTime;
    setTime(0);
    if thereIsTime
        updateTimer(handles, getTime);
        tic; % Start to count the time
        while thereIsTime
             currentTime = round(toc);
             setTime(currentTime);
             updateTimer(handles, getTime);
             pause(0.1);
        end
    end
    
function updateTimer(handles, time)
    strTime = timeToStr(time);
    set(handles.timer, 'String', strTime);

function str = timeToStr(time)
    minutes = fix(time/60);
    seconds = mod(time, 60);
    
    strMinutes = format_number(minutes);
    strSeconds = format_number(seconds);

    str = strcat(strMinutes, strcat(':', strSeconds));

function formatted = format_number(number)
    str_number = num2str(number);
    if length(str_number) == 1 % In this case the time have only one digit (1..9)
        formatted = strcat('0', str_number);
    else
        formatted = str_number;
    end

function setTime(time)
    global elapsedTime;
    elapsedTime = time;

function t = getTime
    global elapsedTime
    t = elapsedTime;

function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function cutPoint_Callback(hObject, eventdata, handles)
% hObject    handle to cutPoint (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cutPoint as text
%        str2double(get(hObject,'String')) returns contents of cutPoint as a double


% --- Executes during object creation, after setting all properties.
function cutPoint_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cutPoint (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in cutBtn.
function cutBtn_Callback(hObject, eventdata, handles)
% hObject    handle to cutBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    cutPoint = get(handles.cutPoint, 'String');
    cutPoint = str2num(cutPoint);
    
    global f precision;
    
    % Is the root of the function
    if( abs(f(cutPoint)) < precision )
        endGame(true);
        
    % Tried to cut the wire in the wrong place
    else
        disp('Cortou o fio no lugar errado! Perdeu!');
        endGame(false);
    end
    

function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


%--- Executes on button press in testBtn.
function testBtn_Callback(hObject, eventdata, handles)
% hObject    handle to testBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


%--- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function iterativeFunction_Callback(hObject, eventdata, handles)
% hObject    handle to iterativeFunction (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of iterativeFunction as text
%        str2double(get(hObject,'String')) returns contents of iterativeFunction as a double


% --- Executes during object creation, after setting all properties.
function iterativeFunction_CreateFcn(hObject, eventdata, handles)
% hObject    handle to iterativeFunction (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject, 'String', getRandIterativeFunctions);


% --- Executes on button press in deleteTimer.
function deleteTimer_Callback(hObject, eventdata, handles)
% hObject    handle to deleteTimer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global bombTimer;
stop(bombTimer);
delete(bombTimer);
