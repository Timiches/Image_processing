close all;
clear all;

PhotoFragment = [1	2	1	1	2	3	0	2	1,
                 1	3	0	1	1	1	3	1	2,
                 1	1	1	0	1	1	2	1	10,
                 0	1	11	8	10	1	0	12	1,
                 1	10	11	11	10	10	1	10	0,
                 3	9	11	13	11	11	10	1	1,
                 0	11	11	11	11	11	10	1	1,
                 1	1	9	10	10	11	1	9	4,
                 1	0	1	2	1	0	1	2	1];
             

Epsilon = 30;
NewPhotoFragment = PhotoFragment;

for m=1:9
    for n=1:9
        sum = 0;
        denominator = 0;
        
        for i=1:3
            for j=1:3
               if(m + i-2 >0) && (m + i-2 <10) && (n + j-2 >0) && (n + j-2 <10)
                   if (i ~= 2)||(j ~= 2)
                        sum = sum + PhotoFragment(m + i-2,n + j-2);
                        denominator = denominator + 1;
                   end;
               end;
               
            end; 
        end;
        sum = sum/denominator;
        if(abs(PhotoFragment(m,n) - sum) > Epsilon)
            NewPhotoFragment(m,n) = sum;
        end;
    end;
end;

