function varargout = level1Tutorial(varargin)
% LEVEL1TUTORIAL MATLAB code for level1Tutorial.fig
%      LEVEL1TUTORIAL, by itself, creates a new LEVEL1TUTORIAL or raises the existing
%      singleton*.
%
%      H = LEVEL1TUTORIAL returns the handle to a new LEVEL1TUTORIAL or the handle to
%      the existing singleton*.
%
%      LEVEL1TUTORIAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LEVEL1TUTORIAL.M with the given input arguments.
%
%      LEVEL1TUTORIAL('Property','Value',...) creates a new LEVEL1TUTORIAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before level1Tutorial_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to level1Tutorial_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help level1Tutorial

% Last Modified by GUIDE v2.5 26-Jun-2016 22:31:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @level1Tutorial_OpeningFcn, ...
                   'gui_OutputFcn',  @level1Tutorial_OutputFcn, ...
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


% --- Executes just before level1Tutorial is made visible.
function level1Tutorial_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to level1Tutorial (see VARARGIN)

% Choose default command line output for level1Tutorial
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
bg = imread('level1Tutorial.jpg'); imagesc(bg);
set(gca, 'visible', 'off') ;

% UIWAIT makes level1Tutorial wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = level1Tutorial_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in startGame.
function startGame_Callback(hObject, eventdata, handles)
% hObject    handle to startGame (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(level1Tutorial);
level1;
