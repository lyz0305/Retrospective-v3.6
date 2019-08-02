% MPWork31 -- Matching-Pursuit, Cosine Packet Tour on Four Basic Signals
%
%     	LinChirp
% 		TwoChirp
%		QuadChirp
%		MishMash
%
%  Must run after MPWork21.
%
	n   = 1024;
	qmf = MakeONFilter('Coiflet',3);
%
	%compressfig  = figure;
	%equivratefig = figure;
	%equivdimfig  = figure;
	figarray = zeros(4,1);
%
	for i=1:4,

		if i==1,
			SigName = 'LinChirp';
		elseif i==2,
			SigName = 'TwoChirp';
		elseif i==3,
			SigName = 'QuadChirp';
		elseif i==4,
			SigName = 'MishMash';
		end			
%
		hs = MakeSignal(SigName,n);
		figarray(i) = figure;
		[mpatoms,mpresid] = CPPursuitTour('P',hs,6,'Sine',300,SigName);
		subplot(2,2,3)
		axis([0 500 0 10])
	
		energy = norm(hs).^2;
		mpcnums = [energy ; energy - cumsum(mpatoms(:,1).^2)];

		figure(compressfig);
		subplot(2,2,i)
		PlotSemiCompressNum(mpcnums,'MPCP', SigName);

		figure(equivratefig);
		subplot(2,2,i)
		PlotEquivRate(mpcnums,'CP', SigName)

		figure(equivdimfig);
		subplot(2,2,i)
		PlotEquivDimension(mpcnums,'CP', SigName)

	end
%
	ifprint(compressfig, 'mp_fig315.ps')
	ifprint(equivratefig,'mp_fig316.ps')
	ifprint(equivdimfig, 'mp_fig317.ps')
	
	for i=1:4,
		ifprint(figarray(i),['mp_fig31' int2str(i) '.ps']);
	end

			
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
