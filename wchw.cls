\ProvidesClass{wchw}

\LoadClass{article}

\PassOptionsToPackage{letterpaper,margin=1in}{geometry}
\RequirePackage{geometry}

\RequirePackage{wcsetup}

% Macros for typesetting questions with (optionally) random-access numbering.
%
% Usage:
% \begin{questions}
%   \question[20]
%     Why is there air?
%   \question[23]
%     What would happen if there were no air?
%     \begin{questions}
%       \question
%         Describe the effect on the aviation industry.
%       \question
%         Describe the effect on the balloon industry.
%      \end{questions}
% \end{questions}
% 
% Macro names may conflict with exam.cls, but that class is semantically incompatible anyway.
%
% Adapted from: http://tex.stackexchange.com/a/27578/37357.
\newenvironment{questions}%
{\begin{enumerate}\providecommand{\question}[1][\value{enum\romannumeral\@enumdepth}+1]{\setcounter{enum\romannumeral\@enumdepth}{##1-1}\item}}%
{\end{enumerate}}
