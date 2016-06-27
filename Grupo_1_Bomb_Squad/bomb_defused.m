function varargout = bomb_defused(varargin)
% BOMB_DEFUSED MATLAB code for bomb_defused.fig
%      BOMB_DEFUSED, by itself, creates a new BOMB_DEFUSED or raises the existing
%      singleton*.
%
%      H = BOMB_DEFUSED returns the handle to a new BOMB_DEFUSED or the handle to
%      the existing singleton*.
%
%      BOMB_DEFUSED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BOMB_DEFUSED.M with the given input arguments.
%
%      BOMB_DEFUSED('Property','Value',...) creates a new BOMB_DEFUSED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before bomb_defused_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to bomb_defused_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help bomb_defused

% Last Modified by GUIDE v2.5 24-Jun-2016 21:00:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @bomb_defused_OpeningFcn, ...
                   'gui_OutputFcn',  @bomb_defused_OutputFcn, ...
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


% --- Executes just before bomb_defused is made visible.
function bomb_defused_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to bomb_defused (see VARARGIN)

% Choose default command line output for bomb_defused
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes bomb_defused wait for user response (see UIRESUME)
% uiwait(handles.figure1);
bg = imread('bomb-has-been-defused.png');
imagesc(bg);
set(gca, 'visible', 'off') ;


% --- Outputs from this function are returned to the command line.
function varargout = bomb_defused_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in playAgain.
function playAgain_Callback(hObject, eventdata, handles)
% hObject    handle to playAgain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(bomb_defused);
bomsquad