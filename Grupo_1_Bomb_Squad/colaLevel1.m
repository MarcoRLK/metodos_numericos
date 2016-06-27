function varargout = colaLevel1(varargin)
% COLALEVEL1 MATLAB code for colaLevel1.fig
%      COLALEVEL1, by itself, creates a new COLALEVEL1 or raises the existing
%      singleton*.
%
%      H = COLALEVEL1 returns the handle to a new COLALEVEL1 or the handle to
%      the existing singleton*.
%
%      COLALEVEL1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in COLALEVEL1.M with the given input arguments.
%
%      COLALEVEL1('Property','Value',...) creates a new COLALEVEL1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before colaLevel1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to colaLevel1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help colaLevel1

% Last Modified by GUIDE v2.5 26-Jun-2016 23:18:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @colaLevel1_OpeningFcn, ...
                   'gui_OutputFcn',  @colaLevel1_OutputFcn, ...
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


% --- Executes just before colaLevel1 is made visible.
function colaLevel1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to colaLevel1 (see VARARGIN)

% Choose default command line output for colaLevel1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
bg = imread('colaLevel1.jpg'); imagesc(bg);
set(gca, 'visible', 'off') ;

% UIWAIT makes colaLevel1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = colaLevel1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(colaLevel1);
