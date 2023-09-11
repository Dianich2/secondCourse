#include <iostream>
#include <queue>
using namespace std;

void main() {
	queue<int> q;
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
	int found[10] = { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
	q.push(0);
	for (int j = 0; j < 22; j++) {
		bool flag = false;
		for (int k = 0; k < 10; k++) {
			if (mas[j][1] == found[k])
				flag = true;
		}
		if (flag == false) {
			q.push(mas[j][1] - 1);
			found[mas[j][1] - 1] = mas[j][1];
		}
	}
	while (!q.empty()) {
		int node = q.front();
		q.pop();
		cout << node + 1 << endl;
	}
}