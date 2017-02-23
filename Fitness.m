function Value = Fitness( Target,image )

%     Safi = 0;
%    for i = 1:50
%        for j = 1:50
%            Safi = Safi + cast(abs(Target(i,j,1) - image(i,j,1)),'int64');
%            Safi = Safi + cast(abs(Target(i,j,2) - image(i,j,2)),'int64');
%            Safi = Safi + cast(abs(Target(i,j,3) - image (i,j,3)),'int64');
%        end
%    end
%    Value = Safi;
Value = norm(double(Target(:)) - double(image(:)));

end