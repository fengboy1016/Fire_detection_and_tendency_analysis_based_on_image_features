function varargout = close_system(varargin)
% CLOSE_SYSTEM MATLAB code for close_system.fig
%      CLOSE_SYSTEM, by itself, creates a new CLOSE_SYSTEM or raises the existing
%      singleton*.
%
%      H = CLOSE_SYSTEM returns the handle to a new CLOSE_SYSTEM or the handle to
%      the existing singleton*.
%
%      CLOSE_SYSTEM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CLOSE_SYSTEM.M with the given input arguments.
%
%      CLOSE_SYSTEM('Property','Value',...) creates a new CLOSE_SYSTEM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before close_system_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to close_system_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help close_system

% Last Modified by GUIDE v2.5 14-Feb-2019 23:50:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @close_system_OpeningFcn, ...
                   'gui_OutputFcn',  @close_system_OutputFcn, ...
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


% --- Executes just before close_system is made visible.
function close_system_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to close_system (see VARARGIN)

% Choose default command line output for close_system
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes close_system wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = close_system_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in no.
function no_Callback(hObject, eventdata, handles)
% hObject    handle to no (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(close_system);


% --- Executes on button press in close.
function close_Callback(hObject, eventdata, handles)
% hObject    handle to close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcf);
close(fire_analysis_system);
close(welcome);
