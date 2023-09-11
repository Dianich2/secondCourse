#include <iostream>
#include <stack>
using namespace std;

void main() {
	stack<int> s;
	int mas[10][3] = {
		{2, 5, 0},
		{1, 7, 8},
		{8, 0, 0},
		{6, 9, 0},
		{1, 6, 0},
		{4, 5, 9},
		{2, 8, 0},
		{2, 3, 7},
		{4, 6, 10},
		{9, 0, 0}
	};
	int found[10] = { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
	s.push(0);
	while (!s.empty()) {
		int node = s.top();
		s.pop();
		for (int j = 0; j < 3; j++) {
			bool flag = false;
			for (int k = 0; k < 10; k++) {
				if (mas[node][j] != 0 && mas[node][j] == found[k])
					flag = true;
			}
			if (mas[node][j] != 0 && flag == false) {
				s.push(mas[node][j] - 1);
				found[mas[node][j] - 1] = mas[node][j];
			}
		}
		cout << node + 1 << endl;
	}
}