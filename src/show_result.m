function varargout = show_result(varargin)
% SHOW_RESULT MATLAB code for show_result.fig
%      SHOW_RESULT, by itself, creates a new SHOW_RESULT or raises the existing
%      singleton*.
%
%      H = SHOW_RESULT returns the handle to a new SHOW_RESULT or the handle to
%      the existing singleton*.
%
%      SHOW_RESULT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SHOW_RESULT.M with the given input arguments.
%
%      SHOW_RESULT('Property','Value',...) creates a new SHOW_RESULT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before show_result_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to show_result_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help show_result

% Last Modified by GUIDE v2.5 13-Feb-2019 16:10:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @show_result_OpeningFcn, ...
                   'gui_OutputFcn',  @show_result_OutputFcn, ...
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


% --- Executes just before show_result is made visible.
function show_result_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to show_result (see VARARGIN)

% Choose default command line output for show_result
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes show_result wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = show_result_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in flame_video.
function flame_video_Callback(hObject, eventdata, handles)
% hObject    handle to flame_video (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
implay('../processed_flame.avi');


% --- Executes on button press in frost_video.
function frost_video_Callback(hObject, eventdata, handles)
% hObject    handle to frost_video (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
implay('../processed_frost.avi');


% --- Executes on button press in flame_most.
function flame_most_Callback(hObject, eventdata, handles)
% hObject    handle to flame_most (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
peak_time_of_flame;


% --- Executes on button press in frost_most.
function frost_most_Callback(hObject, eventdata, handles)
% hObject    handle to frost_most (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
peak_time_of_frost;


% --- Executes on button press in close.
function close_Callback(hObject, eventdata, handles)
% hObject    handle to close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(show_result);
