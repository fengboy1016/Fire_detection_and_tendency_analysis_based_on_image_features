function varargout = during_the_analysis(varargin)
% DURING_THE_ANALYSIS MATLAB code for during_the_analysis.fig
%      DURING_THE_ANALYSIS, by itself, creates a new DURING_THE_ANALYSIS or raises the existing
%      singleton*.
%
%      H = DURING_THE_ANALYSIS returns the handle to a new DURING_THE_ANALYSIS or the handle to
%      the existing singleton*.
%
%      DURING_THE_ANALYSIS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DURING_THE_ANALYSIS.M with the given input arguments.
%
%      DURING_THE_ANALYSIS('Property','Value',...) creates a new DURING_THE_ANALYSIS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before during_the_analysis_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to during_the_analysis_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help during_the_analysis

% Last Modified by GUIDE v2.5 13-Feb-2019 20:05:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @during_the_analysis_OpeningFcn, ...
                   'gui_OutputFcn',  @during_the_analysis_OutputFcn, ...
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


% --- Executes just before during_the_analysis is made visible.
function during_the_analysis_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to during_the_analysis (see VARARGIN)

% Choose default command line output for during_the_analysis
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes during_the_analysis wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = during_the_analysis_OutputFcn(hObject, eventdata, handles) 
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
close(during_the_analysis);
