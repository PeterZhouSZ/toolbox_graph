function write_obj(filename, vertex, face, options)

% write_off - write a mesh to an OBJ file
%
%   write_obj(filename, vertex, face, options)
%
%   vertex must be of size [n,3]
%   face must be of size [p,3]
%
%   Copyright (c) 2004 Gabriel Peyré

if nargin<4
    options.null = 0;
end

if size(vertex,2)~=3
    vertex=vertex';
end
if size(vertex,2)~=3
    error('vertex does not have the correct format.');
end


if size(face,2)~=3
    face=face';
end
if size(face,2)~=3
    error('face does not have the correct format.');
end

fid = fopen(filename,'wt');
if( fid==-1 )
    error('Can''t open the file.');
    return;
end

% vertex position
fprintf(fid, '# %d vertex\n', size(vertex,1));
fprintf(fid, 'v %f %f %f\n', vertex');

% vertex texture
if isfield(options, 'texture')
    nvert = size(vertex,1);
    object_texture = zeros(nvert, 2);
    m = ceil(sqrt(nvert));
    if m^2~=nvert
        error('To use normal map the number of vertex must be a square.');
    end
    x = 0:1/(m-1):1;
    [Y,X] = meshgrid(x,x);
    object_texture(:,1) = Y(:);
    object_texture(:,2) = X(end:-1:1);
    fprintf(fid, 'vt %f %f\n', object_texture');
   
    % face
    fprintf(fid, '# %d faces\n', size(face,1));
    face_texcorrd = [face(:,1), face(:,1), face(:,2), face(:,2), face(:,3), face(:,3)];
    fprintf(fid, 'f %d/%d %d/%d %d/%d\n', face_texcorrd');
else
     % face
    fprintf(fid, '# %d faces\n', size(face,1));
    fprintf(fid, 'f %d %d %d\n', face');
end


fclose(fid);
end