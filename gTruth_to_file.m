% Write out the labels and bounding boxes to a text file for object
% detection training
gArray = table2array(gTruth);

n_imgs = size(gArray,1);
n_classes = size(gArray,2)-1;
columnNames = gTruth.Properties.VariableNames;
for i = 1:n_imgs
    filedata = split(gArray{i,1},["/" "\" "."]);
    fout = fopen([filedata{end-1},'.txt'],'w');
    fprintf(fout, '#path/to/image.ext\n');
    fprintf(fout, '#\tcategory\n');
    fprintf(fout, '#\t\txmin ymin xmax ymax\n\n');
    fprintf(fout, '%s\n',gArray{i,1});
    for j = 1:n_classes
        fprintf(fout, '\t%s\n',columnNames{j+1});
        n_boxes = size(gArray{i,j+1},1);
        for k = 1:n_boxes
            fprintf(fout, '\t\t%d %d %d %d\n',gArray{i,j+1}(k,1),gArray{i,j+1}(k,2),gArray{i,j+1}(k,1)+gArray{i,j+1}(k,3),gArray{i,j+1}(k,2)+gArray{i,j+1}(k,4));
        end
    end
    fclose(fout);
end