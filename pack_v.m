function [NWP,NWR] = pack_v(f)

pool=f; 
mm=mean(pool);
div=mm/(10^-5);
pool=pool/div;
area=sum(pi*(pool.^2))/0.9;
side=sqrt(area);
res=1400; 

ST=side/res;
[x y]=meshgrid(0:ST:side);
p0=[side/2,side/2];
r0=pool(1);
pool=pool(2:numel(pool));
Wp(1,:)=p0;
Wr=r0;
D0=zeros(size(x,1),size(y,1));
D1=zeros(size(x,1),size(y,1));
m_M=zeros(size(x,1),size(y,1));
R1=zeros(size(x,1),size(y,1));

i=1;
j=1;
MASK=zeros(size(x));

px=Wp(:,1);
py=Wp(:,2);
down=0.0*10^-4;
up=side;
t=linspace(down,up,res+1);
SC=t(5)-t(4);
[x y]=meshgrid(down:SC:up , down:SC:up);
routter=Wr.*(1);

W=zeros(size(x));

for i=1:numel(Wr)
    tic;
    R = sqrt( (x-px(i)).^2 + (y-py(i)).^2 );
    ONES=zeros(size(x));
    ONES(R<routter(i))=inf;
    W=W+ONES;
    toc
    
end
MASK11=W;
while i<=numel(pool)
    
    tic;
    WPT=vertcat(Wp,Wp);
    WR=vertcat(Wr,Wr);
    rnext=pool(i);
    avg_center=[mean(WPT(:,1)) mean(WPT(:,2))];
    
    d1=sqrt( (x-avg_center(1)).^2 + (y-avg_center(2)).^2 );
    d_t=d1;
    m_M=zeros(size(x,1),size(y,1));
    for n=1:numel(WR)
        w=sqrt( (x-WPT(n,1)).^2 + (y-WPT(n,2)).^2 ) <= ...
            WR(n)+rnext;
        m_M=m_M+w;
    end
    m_M=m_M+MASK11;
    d_t(m_M>0)=1;
    [mx my]=find(d_t==min(min(d_t)));
    new_pt=[y(my(1),1) x(1,mx(1))];
    
    Wp=[Wp;new_pt];
    Wr=vertcat(Wr,rnext);
    
    i=i+1;
    display(['iteration #' num2str(i)])
    etoc(:,i)=toc;
    
    
    Wpc=Wp;
    while numel(Wp(:,1))>2
        mask=poly2mask(round(Wp(:,1)./ST),round(Wp(:,2)./ST),res+1,res+1);
        MASK11=MASK11+mask;
        if i>2
            break
        end
        
    end
    toc
end


idx= ~(WPT(:,1)==0 & WPT(:,2)==0);
NWP=WPT(idx,:);
NWR=WR(idx);
NWP=NWP*div;
NWR=NWR*div;

close all;
figure;axis square;title('packing');hold on
for i=1:numel(NWR);
    circle(NWP(i,:),NWR(i));
end

px=NWP(:,1);
py=NWP(:,2);
cx=mean(px);
cy=mean(py);
dr=sqrt((px-cx).^2 + (py-cy).^2);
figure;plot(dr,NWR,'o');axis on;axis square;xlabel('distance to center');ylabel('radii size');
end
