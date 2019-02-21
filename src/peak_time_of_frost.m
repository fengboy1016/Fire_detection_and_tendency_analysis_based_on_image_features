function varargout = peak_time_of_frost(varargin)
% PEAK_TIME_OF_FROST MATLAB code for peak_time_of_frost.fig
%      PEAK_TIME_OF_FROST, by itself, creates a new PEAK_TIME_OF_FROST or raises the existing
%      singleton*.
%
%      H = PEAK_TIME_OF_FROST returns the handle to a new PEAK_TIME_OF_FROST or the handle to
%      the existing singleton*.
%
%      PEAK_TIME_OF_FROST('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PEAK_TIME_OF_FROST.M with the given input arguments.
%
%      PEAK_TIME_OF_FROST('Property','Value',...) creates a new PEAK_TIME_OF_FROST or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before peak_time_of_frost_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to peak_time_of_frost_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help peak_time_of_frost

% Last Modified by GUIDE v2.5 13-Feb-2019 16:26:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @peak_time_of_frost_OpeningFcn, ...
                   'gui_OutputFcn',  @peak_time_of_frost_OutputFcn, ...
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


% --- Executes just before peak_time_of_frost is made visible.
function peak_time_of_frost_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to peak_time_of_frost (see VARARGIN)

% Choose default command line output for peak_time_of_frost
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes peak_time_of_frost wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = peak_time_of_frost_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in show_frost_most.
function show_frost_most_Callback(hObject, eventdata, handles)
% hObject    handle to show_frost_most (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
frost_trend=textread('../var/frost.txt','%f','delimiter', ',');
%%% 烟雾面积最大图像
big_index_frost = find(frost_trend==max(frost_trend)) ;
axes(handles.frost_most);
imshow(['../original_flame/' num2str(big_index_frost) '.jpg']);
title('烟雾面积最大的图像','FontSize',12);


% --- Executes on button press in close.
function close_Callback(hObject, eventdata, handles)
% hObject    handle to close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(peak_time_of_frost);
