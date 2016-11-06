#include<bits/stdc++.h>
using namespace std;

int minmax(vector<int>a,int decide,int idx,int d)
{
  if(d==log2(a.size()))
  {
    return a[idx];
  }
  if (decide) {
    return max(minmax(a,0,2*idx,d+1),minmax(a,0,2*idx+1,d+1));
  }
  else
  {
    return min(minmax(a,1,2*idx,d+1),minmax(a,1,2*idx+1,d+1));
  }

}
int main()
{
  vector<int>a;
  cout << "Enter number of nodes" <<endl;
  int n,t;
  cin>>n;
  for(int i=0;i<n;i++)
  {
    cin>>t;
    a.push_back(t);
  }
  int ans = minmax(a,1,0,0);
  cout<<"Optimal value is :"<<ans<<endl;
  return 0;
}
