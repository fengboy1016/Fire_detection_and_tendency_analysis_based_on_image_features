function varargout = end_of_analysis(varargin)
% END_OF_ANALYSIS MATLAB code for end_of_analysis.fig
%      END_OF_ANALYSIS, by itself, creates a new END_OF_ANALYSIS or raises the existing
%      singleton*.
%
%      H = END_OF_ANALYSIS returns the handle to a new END_OF_ANALYSIS or the handle to
%      the existing singleton*.
%
%      END_OF_ANALYSIS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in END_OF_ANALYSIS.M with the given input arguments.
%
%      END_OF_ANALYSIS('Property','Value',...) creates a new END_OF_ANALYSIS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before end_of_analysis_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to end_of_analysis_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help end_of_analysis

% Last Modified by GUIDE v2.5 13-Feb-2019 20:00:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @end_of_analysis_OpeningFcn, ...
                   'gui_OutputFcn',  @end_of_analysis_OutputFcn, ...
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


% --- Executes just before end_of_analysis is made visible.
function end_of_analysis_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to end_of_analysis (see VARARGIN)

% Choose default command line output for end_of_analysis
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes end_of_analysis wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = end_of_analysis_OutputFcn(hObject, eventdata, handles) 
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
close(end_of_analysis);
