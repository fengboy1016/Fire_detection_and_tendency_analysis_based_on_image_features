function varargout = released_ID(varargin)
% RELEASED_ID MATLAB code for released_ID.fig
%      RELEASED_ID, by itself, creates a new RELEASED_ID or raises the existing
%      singleton*.
%
%      H = RELEASED_ID returns the handle to a new RELEASED_ID or the handle to
%      the existing singleton*.
%
%      RELEASED_ID('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RELEASED_ID.M with the given input arguments.
%
%      RELEASED_ID('Property','Value',...) creates a new RELEASED_ID or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before released_ID_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to released_ID_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help released_ID

% Last Modified by GUIDE v2.5 13-Feb-2019 19:56:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @released_ID_OpeningFcn, ...
                   'gui_OutputFcn',  @released_ID_OutputFcn, ...
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


% --- Executes just before released_ID is made visible.
function released_ID_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to released_ID (see VARARGIN)

% Choose default command line output for released_ID
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes released_ID wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = released_ID_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in close.
function close_Callback(hObject, eventdata, handles)
% hObject    handle to close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(released_ID);
