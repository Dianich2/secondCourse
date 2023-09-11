#include <iostream>
#include <stack>
using namespace std;

void main() {
	stack<int> s;
	int mas[22][2] = {
		{1, 2},
		{1, 5},
		{2, 1},
		{2, 7},
		{2, 8},
		{3, 8},
		{4, 6},
		{4, 9},
		{5, 1},
		{5, 6},
		{6, 4},
		{6, 5},
		{6, 9},
		{7, 2},
		{7, 8},
		{8, 2},
		{8, 3},
		{8, 7},
		{9, 4},
		{9, 6},
		{9, 10},
		{10, 9}

	};
	int found[11] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
	
	s.push(0);

	while (!s.empty()) {
		int node = s.top();
		s.pop();

		if (!found[node]) {
			found[node] = 1;
			cout << node + 1 << endl;
		}

		for (int j = 0; j < 22; j++) {
			if (mas[j][0] == node + 1 && !found[mas[j][1] - 1]) {
				s.push(mas[j][1] - 1);
			}
		}
	}
}