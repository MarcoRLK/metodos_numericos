function varargout = level1(varargin)
%LEVEL1 M-file for level1.fig
%      LEVEL1, by itself, creates a new LEVEL1 or raises the existing
%      singleton*.
%
%      H = LEVEL1 returns the handle to a new LEVEL1 or the handle to
%      the existing singleton*.
%
%      LEVEL1('Property','Value',...) creates a new LEVEL1 using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to level1_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      LEVEL1('CALLBACK') and LEVEL1('CALLBACK',hObject,...) call the
%      local function named CALLBACK in LEVEL1.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help level1

% Last Modified by GUIDE v2.5 26-Jun-2016 18:24:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @level1_OpeningFcn, ...
                   'gui_OutputFcn',  @level1_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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


% --- Executes just before level1 is made visible.
function level1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for level1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

global rightWire iteractiveFunctions;

%setting backgound
bg = imread('fase1.jpg'); imagesc(bg);
set(gca, 'visible', 'off') ;

%setting functions
functions = {'sen(x)' ; 'cos(x)' ; 'tg(x)' ; 'sec(x)'};
iteractiveFunctions = {'x - sen(x)/cos(x)' ; 'x - cos(x)/-sen(x)' ;
                        'x - tg(x)/sec(x)^2' ; 'x-sec(x)/sec(x)*tg(x)'};
   
wrongIteractFunctions = {'x - sen(x)/-sen(x)' ; 'x - cos(x)/sen(x)' ;
                        'x - tg(x)/-sec(x)^2' ; 'x-sec(x)/sec(x)+tg(x)'};
set(handles.func1, 'String',functions(1));
set(handles.func2, 'String',functions(2));
set(handles.func3, 'String',functions(3));
set(handles.func4, 'String',functions(4));

%setting wrong interactive functions
set(handles.inter1, 'String',wrongIteractFunctions(1));
set(handles.inter2, 'String',wrongIteractFunctions(2));
set(handles.inter3, 'String',wrongIteractFunctions(3));
set(handles.inter4, 'String',wrongIteractFunctions(4));

%defining the right wire
rightWire = round(rand(1)*3) + 1;

%calling function to place the right itecactive function in the right wire
placeRightFunction(hObject, eventdata, handles);

function placeRightFunction(hObject, eventdata, handles)

global rightWire iteractiveFunctions;
switch rightWire
    case 1
        set(handles.inter1, 'String',iteractiveFunctions(1));
    case 2
        set(handles.inter2, 'String',iteractiveFunctions(2));
    case 3
        set(handles.inter3, 'String',iteractiveFunctions(3));
    case 4
        set(handles.inter4, 'String',iteractiveFunctions(4));
end

% UIWAIT makes level1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = level1_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global chosenWire;
tempoInicial=['00:01;00,00'];
set(handles.timer,'String',tempoInicial);
tim = 0;

tempoCorrendo = true;
if tempoCorrendo == true;
   cro=get(handles.timer,'String');
   tim=str2num(cro(1,[1 2]))*3600+str2num(cro(1,[4 5]))*60+str2num(cro(1,[7 8]))+str2num(cro(1,[10 11]))/100;
   t = 0;
end

tic
while tempoCorrendo == true
    
    time=t+tim;
    hhhh=fix(time/3600);
    mmmm=fix((time-hhhh*3600)/60);
    ssss=fix(time-hhhh*3600-mmmm*60);
    mile=fix((time-hhhh*3600-mmmm*60-ssss)*100);
    hh=num2str(hhhh);
    v=size(hh,2);
    if v==1
        hh=['0',hh];
    end
    mm=num2str(mmmm);
    v=size(mm,2);
    if v==1
        mm=['0',mm];
    end
    ss=num2str(ssss);
    v=size(ss,2);
    if v==1
        ss=['0',ss];
    end
    mi=num2str(mile);
    v=size(mi,2);
    if v==1
        mi=['0',mi];
    end
    hora=[hh,':',mm,';',ss,',',mi];    
    set(handles.timer,'String',hora);
    t=-toc;
    pause(0.01)
    
        
    if hora == ['00:00;00,00']
        chosenWire = 0;
        close all;
        explodedLevel1 % Open the bomb exploded screen
        x = 1
        break;
    end
end


% Get default command line output from handles structure
varargout{1} = handles.output;



% --- Executes during object creation, after setting all properties.
function timer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to timer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in fio1.
function fio1_Callback(hObject, eventdata, handles)
% hObject    handle to fio1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global chosenWire;
chosenWire = 1;
feedBack();


% --- Executes on button press in fio2.
function fio2_Callback(hObject, eventdata, handles)
% hObject    handle to fio2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global chosenWire;
chosenWire = 2;
feedBack();

% --- Executes on button press in fio3.
function fio3_Callback(hObject, eventdata, handles)
% hObject    handle to fio3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global chosenWire;
chosenWire = 3;
feedBack();

% --- Executes on button press in fio4.
function fio4_Callback(hObject, eventdata, handles)
% hObject    handle to fio4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global chosenWire;
chosenWire = 4;
feedBack();

function feedBack()
global chosenWire rightWire;
if chosenWire == rightWire
    close all;
    defusedLevel1 % Open the bomb defused screen
else
    close all;
    explodedLevel1 % Open the bomb exploded screen
end
