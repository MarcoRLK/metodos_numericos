function varargout = exploded(varargin)
% EXPLODED MATLAB code for exploded.fig
%      EXPLODED, by itself, creates a new EXPLODED or raises the existing
%      singleton*.
%
%      H = EXPLODED returns the handle to a new EXPLODED or the handle to
%      the existing singleton*.
%
%      EXPLODED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EXPLODED.M with the given input arguments.
%
%      EXPLODED('Property','Value',...) creates a new EXPLODED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before exploded_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to exploded_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help exploded

% Last Modified by GUIDE v2.5 24-Jun-2016 19:04:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @exploded_OpeningFcn, ...
                   'gui_OutputFcn',  @exploded_OutputFcn, ...
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


% --- Executes just before exploded is made visible.
function exploded_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to exploded (see VARARGIN)

% Choose default command line output for exploded
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes exploded wait for user response (see UIRESUME)
% uiwait(handles.figure1);
bg = imread('explosion.jpg');
imagesc(bg);
set(gca, 'visible', 'off') ;


% --- Outputs from this function are returned to the command line.
function varargout = exploded_OutputFcn(hObject, eventdata, handles) 
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
close(exploded);
bomsquad