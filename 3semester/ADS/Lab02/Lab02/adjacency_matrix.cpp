#include <iostream>
#include <queue>
using namespace std;

void main() {
	queue<int> q;
	int mas[10][10] = { 
  {0, 1, 0, 0, 1, 0, 0, 0, 0, 0},
  {1, 0, 0, 0, 0, 0, 1, 1, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 1, 0, 0},
  {0, 0, 0, 0, 0, 1, 0, 0, 1, 0},
  {1, 0, 0, 0, 0, 1, 0, 0, 0, 0},
  {0, 0, 0, 1, 1, 0, 0, 0, 1, 0},
  {0, 1, 0, 0, 0, 0, 0, 1, 0, 0},
  {0, 1, 1, 0, 0, 0, 1, 0, 0, 0},
  {0, 0, 0, 1, 0, 1, 0, 0, 0, 1},
  {0, 0, 0, 0, 0, 0, 0, 0, 1, 0},
	};
	int nodes[10];
	for (int i = 0; i < 10; i++)
		nodes[i] = 0;
	q.push(0);
	while (!q.empty()) {
		int node = q.front();
		q.pop();
		nodes[node] = 2;
		for (int j = 0; j < 10; j++) {
			if (mas[node][j] == 1 && nodes[j] == 0) {
				q.push(j);
				nodes[j] = 1;
			}
		}
		cout << node + 1 << endl;
	}
}