function varargout = Fase1(varargin)
% FASE1 MATLAB code for Fase1.fig
%      FASE1, by itself, creates a new FASE1 or raises the existing
%      singleton*.
%
%      H = FASE1 returns the handle to a new FASE1 or the handle to
%      the existing singleton*.
%
%      FASE1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FASE1.M with the given input arguments.
%
%      FASE1('Property','Value',...) creates a new FASE1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Fase1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Fase1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Fase1

% Last Modified by GUIDE v2.5 25-Jun-2016 18:57:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Fase1_OpeningFcn, ...
                   'gui_OutputFcn',  @Fase1_OutputFcn, ...
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


% --- Executes just before Fase1 is made visible.
function Fase1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Fase1 (see VARARGIN)

% Choose default command line output for Fase1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
bg = imread('fase1.jpg'); imagesc(bg);
set(gca, 'visible', 'off') ;



% UIWAIT makes Fase1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Fase1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
global tempoInicial tempoCorrendo;
tempoCorrendo = true;
tempoInicial=['00:01;00,00'];
set(handles.timer,'String',tempoInicial);
tim = 0;

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
        
end



% --- Executes on button press in fio1.
function fio1_Callback(hObject, eventdata, handles)
% hObject    handle to fio1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function fio1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fio1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


    
    
