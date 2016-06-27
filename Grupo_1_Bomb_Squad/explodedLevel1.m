function varargout = explodedLevel1(varargin)
% EXPLODEDLEVEL1 MATLAB code for explodedLevel1.fig
%      EXPLODEDLEVEL1, by itself, creates a new EXPLODEDLEVEL1 or raises the existing
%      singleton*.
%
%      H = EXPLODEDLEVEL1 returns the handle to a new EXPLODEDLEVEL1 or the handle to
%      the existing singleton*.
%
%      EXPLODEDLEVEL1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EXPLODEDLEVEL1.M with the given input arguments.
%
%      EXPLODEDLEVEL1('Property','Value',...) creates a new EXPLODEDLEVEL1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before explodedLevel1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to explodedLevel1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help explodedLevel1

% Last Modified by GUIDE v2.5 26-Jun-2016 20:37:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @explodedLevel1_OpeningFcn, ...
                   'gui_OutputFcn',  @explodedLevel1_OutputFcn, ...
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


% --- Executes just before explodedLevel1 is made visible.
function explodedLevel1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to explodedLevel1 (see VARARGIN)

% Choose default command line output for explodedLevel1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

bg = imread('explosionLevel1.jpg'); imagesc(bg);
set(gca, 'visible', 'off') ;

% UIWAIT makes explodedLevel1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = explodedLevel1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in tryAgain.
function tryAgain_Callback(hObject, eventdata, handles)
% hObject    handle to tryAgain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(explodedLevel1);
level1 %opens the level1 again

% --- Executes on button press in backToMenu.
function backToMenu_Callback(hObject, eventdata, handles)
% hObject    handle to backToMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
TelaInicial %opens the main menu
close(explodedLevel1);
