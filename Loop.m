function varargout = Loop(varargin)
% LOOP MATLAB code for Loop.fig
%      LOOP, by itself, creates a new LOOP or raises the existing
%      singleton*.
%
%      H = LOOP returns the handle to a new LOOP or the handle to
%      the existing singleton*.
%
%      LOOP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LOOP.M with the given input arguments.
%
%      LOOP('Property','Value',...) creates a new LOOP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Loop_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Loop_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Loop

% Last Modified by GUIDE v2.5 13-Jul-2017 14:15:57

% Begin initialization code - DO NOT EDIT

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Loop_OpeningFcn, ...
                   'gui_OutputFcn',  @Loop_OutputFcn, ...
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


% --- Executes just before Loop is made visible.
function Loop_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Loop (see VARARGIN)

% Choose default command line output for Loop
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

%Where to add programs

while 1
    D = importdata('Data.txt')
    
end


% UIWAIT makes Loop wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Loop_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
