M=[1,0,0,0,0,0,2;0,1,0,0,0,0,2;0,0,1,0,0,0,2;0,0,0,1,0,0,2;0,0,0,0,1,0,2;1,1,0,0,0,1,0;1,0,1,0,0,1,0;1,0,0,1,0,1,0;1,0,0,0,1,1,0;0,1,1,0,0,1,0;0,1,0,1,0,1,0;0,1,0,0,1,1,0;0,0,1,1,0,1,0;0,0,1,0,1,1,0;0,0,0,1,1,1,0;1,1,1,0,0,1,1;1,1,0,1,0,1,1;1,1,0,0,1,1,1;1,0,1,1,0,1,1;1,0,1,0,1,1,1;1,0,0,1,1,1,1;0,1,1,1,0,1,1;0,1,1,0,1,1,1;0,1,0,1,1,1,1;0,0,1,1,1,1,1;1,1,1,1,0,1,0;1,1,1,0,1,1,0;1,1,0,1,1,1,0;1,0,1,1,1,1,0;0,1,1,1,1,1,0;1,1,1,1,1,1,2];
N=M(:,1:5);
%input data: N represents 4-dim real universal complex
%input data: M represents the constructed map
count=0;
max=0;
%auxiliary variable for determinant not equal to \pm 1 cases (exotic cases)
solve=0;
%main variable for problem solving in exotic cases
for i=1:27
    for j=(i+1):28
        for k=(j+1):29
            for l=(k+1):30
                for m=(l+1):31
                    A=N([i,j,k,l,m],:);
                    a=round(abs(det(A)));
                    if (mod(a,2)==1 && a>1)
                        count=count+1;
                        if (a>max)
                            max=a;
                        end
                        %search for exotic cases
                        B1=M([i,j,k,l,m],[2,3,4,5,6]);
                        B2=M([i,j,k,l,m],[1,3,4,5,6]);
                        B3=M([i,j,k,l,m],[1,2,4,5,6]);
                        B4=M([i,j,k,l,m],[1,2,3,5,6]);
                        B5=M([i,j,k,l,m],[1,2,3,4,6]);
                        B6=M([i,j,k,l,m],[2,3,4,5,7]);
                        B7=M([i,j,k,l,m],[1,3,4,5,7]);
                        B8=M([i,j,k,l,m],[1,2,4,5,7]);
                        B9=M([i,j,k,l,m],[1,2,3,5,7]);
                        B10=M([i,j,k,l,m],[1,2,3,4,7]);
                        b1=round(det(B1));
                        b2=round(det(B2));
                        b3=round(det(B3));
                        b4=round(det(B4));
                        b5=round(det(B5));
                        b6=round(det(B6));
                        b7=round(det(B7));
                        b8=round(det(B8));
                        b9=round(det(B9));
                        b10=round(det(B10));
                        %take submatrix of M for problem solving
                        if (mod(b1,a)+mod(b2,a)+mod(b3,a)+mod(b4,a)+mod(b5,a)+mod(b6,a)+mod(b7,a)+mod(b8,a)+mod(b9,a)+mod(b10,a)>0)
                            solve=solve+1;
                        end
                        %check coprimeness to value a
                    end
                end
            end
        end
    end
end
if (solve==count)
    result=1;
else
    result=0;
end
disp(result);
%output data: true as 1, false as 0