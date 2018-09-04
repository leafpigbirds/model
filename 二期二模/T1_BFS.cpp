#include<iostream>
#include<cstring>
#include<cmath>
#include<ctime>
#include<iomanip>
#include<algorithm>
#include<cstdio>
#include<queue>
#include<stack>
#include<cstdlib>
#include<string>
using namespace std;
int v[500][600];
int a[500][600];
int dx[30]={0,1,1,1,0,0,-1,-1,-1,2,2,2,0,0,-2,-2,-2};
int dy[30]={0,1,-1,0,1,-1,1,-1,0,2,-2,0,2,-2,2,-2,0};
int x,y;
struct node
{
	int cnt;
	int num;
}ans[20];
double cur;
bool cmp(node,node);
void DFS(int,int,int);
void local_base_point(int);
int main ()
{
	ios::sync_with_stdio(false);
	freopen("DATA3.txt","r",stdin);
//	freopen("out3.txt","w",stdout); 
	for (int i=1 ; i<=420 ; i++ )
		for (int j=1 ; j<=560 ; j++ )
		{
			cin >> cur;
			if (cur==0)
				a[i][j]=0 ;
			else
			{
				a[i][j]=1 ;
//				system("pause");
			}
		}
	int start=clock(); 
	int id=0;
	for (int i=1 ; i<=20 ; i++ )
		ans[i].num = i ;
	for (int i=1 ; i<=420 ; i++ )
		for (int j=1 ; j<=560 ; j++ )
			if (a[i][j]==1&&v[i][j]==0)	
				DFS(i,j,++id);
	for (int i=1 ; i<=420 ; i++ )
		for (int j=1 ; j<=560 ; j++ )
			if (v[i][j]!=0)
				ans[v[i][j]].cnt++ ;//连通块个数计算 
//输出检测 
{  
//	for (int i=1 ; i<=420 ; i++ )
//	{
//		for (int j=1 ; j<=560 ; j++ )
//			cout << a[i][j] << ' ' ;
//		cout << '\n' ;
//	}
//	for (int i=1 ; i<=420 ; i++ )
//	{
//		for (int j=1 ; j<=560 ; j++ )
//			cout << v[i][j] << ' ' ;
//		cout << '\n' ;
//	}
}
	int end=clock();
	cout << end << ' ' << start << '\n' ;
	cout << (double)(end-start)/CLOCKS_PER_SEC << '\n' ;
	sort(ans+1,ans+20+1,cmp);//降序排序 
	for (int i=1 ; i<=20 ; i++ )
		cout << ans[i].num << ':' << ans[i].cnt << '\n' ;//输出结果展示 	
	for (int i=2 ; i<=9 ; i++ ) 
	{
		local_base_point(i);//求圆心 
		cout << "id:" << i << ' ' << "x:" << x << ' ' << "y:" << y << '\n' ; 
	}
	return 0 ;
}
bool cmp(node x,node y)
{
	return x.cnt>y.cnt;
}
void DFS(int x,int y,int id)
{
	if (x<0||x>420||y<0||y>560)
		return ;//出界格子 
	if (v[x][y]!=0||a[x][y]!=1)
		return ;//是否可行、是否访问 
	v[x][y]=id ;//标记编号
	for (int i=1 ; i<=16 ; i++ )
		 DFS(x+dx[i],y+dy[i],id);
}
void local_base_point(int id)
{
	int head = 0 ;
	int tail = 0 ;
	int X[700][3] ;//420行 
	int distance_X[700];//head tail 距离 
	int distance_Y[700];//head tail 距离 
	int MAX = 0 ;
	for (int i=1 ; i<=420 ; i++ )
	{
		head = 0 ;
		tail = 0 ;
		for (int j=1 ; j<=560 ; j++ )
		{
			if (v[i][j]==id)
				if (a[i][j]==1)
				{
					head = j ;
					break ;
				}
		}
		for (int j=560 ; j>=1 ; j-- )
		{
			if (v[i][j]==id)
				if (a[i][j]==1)
				{
					tail = j ;
					break ;
				}
		}
		X[i][1] = head ;
		X[i][2] = tail ;
	}
	
	for (int i=1 ; i<=420 ; i++ )
		distance_X[i] = X[i][2]-X[i][1] ;//求head tail 距离
	
	MAX = 0 ;
	//定位坐标轴x
	for (int i=1 ; i<=420 ; i++ )
	{
		if (MAX<distance_X[i]) 
		{
			MAX = distance_X[i] ;
			head = i ;
			tail = i ;
		}
		if (MAX==distance_X[i])
			tail = i ;
	}
	x = floor((tail+head)/2);
//-------------------------------------------------------------	 
	int Y[700][3] ; //560列 
	for (int i=1 ; i<=560 ; i++ )
	{
		head = 0 ;
		tail = 0 ;
		for (int j=1 ; j<=420 ; j++ )
		{
			if (v[j][i]==id)
				if (a[j][i]==1)
				{
					head = j ;
					break ;
				}
		} 
		for (int j=420 ; j>=1 ; j-- )
		{
			if (v[j][i]==id)
				if (a[j][i]==1)
				{
					tail = j ;
					break ;
				}
		}
		Y[i][1] = head ;
		Y[i][2] = tail ; 
	}
	
	for (int i=1 ; i<=560  ; i++ )
		distance_Y[i] = Y[i][2]-Y[i][1] ;//求head tail 距离
		
	MAX = 0 ;
	//定位坐标轴y
	for (int i=1 ; i<=560 ; i++ )
	{
		if (MAX<distance_Y[i])
		{
			MAX = distance_Y[i] ;
			head = i ;
			tail = i ;
		}
		if (MAX==distance_Y[i])
			tail = i ;
	}
	y = floor((tail+head)/2);
}

