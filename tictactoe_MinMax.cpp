#include<bits/stdc++.h>
using namespace std;
pair<int,int> whatnext(char player, vector <string> board,bool f);
// 1 has been assigned as win value for X and -1 as win value for O win
bool nonleft(vector <string> board)
{
  for(int i=0;i<board.size();i++)
  {
    for(int j=0;j<board.size();j++)
    {
      if(board[i][j]=='_')
      return 0;
    }
  }
  return 1;
}
int checkforwins(vector<string> board)
{
  //Checking for row
  bool f=1;
  for(int i=0;i<board.size();i++)
  {
    f=1;
    for(int j=0;j<board[i].length();j++)
    {
      if(board[i][j]!='X')
      {
        f=0;
        break;
      }
    }
    if(f)
    {
      return 1;
    }
    f=1;
    for(int j=0;j<board[i].length();j++)
    {
      if(board[i][j]!='O')
      {
        f=0;
        break;
      }
    }
    if(f)
    {
      return -1;
    }
  }
  //check for coloumns
  for(int i=0;i<board.size();i++)
  {
    f=1;
    for(int j=0;j<board[i].length();j++)
    {
      if(board[j][i]!='X')
      {
        f=0;
        break;
      }
    }
    if(f)
    {
      return 1;
    }
    f=1;
    for(int j=0;j<board[i].length();j++)
    {
      if(board[j][i]!='O')
      {
        f=0;
        break;
      }
    }
    if(f)
    {
      return -1;
    }
  }
  //check for diagnols
    f=1;
    for(int j=0;j<board.size();j++)
    {
      if(board[j][j]!='X')
      {
        f=0;
        break;
      }
    }
    if(f)
    {
      return 1;
    }
    f=1;
    for(int j=0;j<board.size();j++)
    {
      if(board[j][board.size()-1-j]!='X')
      {
        f=0;
        break;
      }
    }
    if(f)
    {
      return 1;
    }
    f=1;
    for(int j=0;j<board.size();j++)
    {
      if(board[j][j]!='O')
      {
        f=0;
        break;
      }
    }
    if(f)
    {
      return -1;
    }
    f=1;
    for(int j=0;j<board.size();j++)
    {
      if(board[j][board.size()-1-j]!='O')
      {
        f=0;
        break;
      }
    }
    if(f)
    {
      return -1;
    }
    return 0;
}
int minmaxevaluation(vector<string> board,char player)
{
  int winchk = checkforwins(board);
  if(winchk!=0)
  return winchk;
  if(nonleft(board))
  return 0;
  return whatnext(player,board,1).second;
}
pair<int,int> whatnext(char player, vector <string> board,bool f)
{
  pair<int,int>best(-1,-1);
  int bestweight;
  if(player=='X')
  {
      bestweight=-2;
      for(int i=0;i<board.size();i++)
      {
        for(int j=0;j<board.size();j++)
        {
          if(board[i][j]=='_')
          {
            board[i][j]='X';
            int weight = minmaxevaluation(board,'O');
            if(weight>bestweight)
            {
              bestweight=weight;
              best.first=i;
              best.second=j;
            }
            board[i][j]='_';
          }
        }
      }
  }
  else
  {
    bestweight=2;
    for(int i=0;i<board.size();i++)
    {
      for(int j=0;j<board.size();j++)
      {
        if(board[i][j]=='_')
        {
          board[i][j]='O';
          int weight = minmaxevaluation(board,'X');
          if(weight<bestweight)
          {
            bestweight=weight;
            best.first=i;
            best.second=j;
          }
          board[i][j]='_';
        }
      }
    }
  }
  if(f)
  return make_pair(-10,bestweight);
  return best;
}

void nextMove(char player, vector <string> board)
{
pair<int,int>best = whatnext(player,board,0);
cout<<best.first<<" "<<best.second<<endl;
}
int main(void) {

    char player;
    int boardsize = 0;
    vector <string> board;

    //If player is X, I'm the first player.
    //If player is O, I'm the second player.
    cin >> player;
    //cin>>boardsize;
    //Read the board now. The board is a 3x3 array filled with X, O or _.
    for(int i=0; i<3; i++) {
      string s; cin >> s;
      board.push_back(s);
    }

   nextMove(player,board);

    return 0;
}
