function varargout = TelaInicial(varargin)
% TELAINICIAL MATLAB code for TelaInicial.fig
%      TELAINICIAL, by itself, creates a new TELAINICIAL or raises the existing
%      singleton*.
%
%      H = TELAINICIAL returns the handle to a new TELAINICIAL or the handle to
%      the existing singleton*.
%
%      TELAINICIAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TELAINICIAL.M with the given input arguments.
%
%      TELAINICIAL('Property','Value',...) creates a new TELAINICIAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before TelaInicial_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to TelaInicial_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help TelaInicial

% Last Modified by GUIDE v2.5 26-Jun-2016 22:06:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TelaInicial_OpeningFcn, ...
                   'gui_OutputFcn',  @TelaInicial_OutputFcn, ...
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


% --- Executes just before TelaInicial is made visible.
function TelaInicial_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to TelaInicial (see VARARGIN)

% Choose default command line output for TelaInicial
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% Backgroung do menu inicial
bg = imread('telaInicial.jpg'); imagesc(bg);
set(gca, 'visible', 'off') ;

% UIWAIT makes TelaInicial wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = TelaInicial_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in startLevel1.
function startLevel1_Callback(hObject, eventdata, handles)
% hObject    handle to startLevel1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

close(TelaInicial);
level1Tutorial;

% --- Executes on button press in help.
function help_Callback(hObject, eventdata, handles)
% hObject    handle to help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in credits.
function credits_Callback(hObject, eventdata, handles)
% hObject    handle to credits (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in startLevel2.
function startLevel2_Callback(hObject, eventdata, handles)
% hObject    handle to startLevel2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
