#include <iostream>
using namespace std;


void main() {
	const int N = 6;

	int D[N][N] =
	{
			   {0, 28, 21, 59, 12, 27},
			   {7, 0, 24, INT_MAX, 21, 9},
			   {9, 32, 0, 13, 11, INT_MAX},
			   {8, INT_MAX, 5, 0, 16, INT_MAX},
			   {14, 13, 15, 10, 0, 22},
			   {15, 18, INT_MAX, INT_MAX, 6, 0}
	};
	int S[N][N] =
	{
		{0, 2, 3, 4, 5, 6},
		{1, 0, 3, 4, 5, 6},
		{1, 2, 0, 4, 5, 6},
		{1, 2, 3, 0, 5, 6},
		{1, 2, 3, 4, 0, 6},
		{1, 2, 3, 4, 5, 0},
	};

	for (int k = 0; k < N; ++k) {
		for (int i = 0; i < N; ++i) {
			for (int j = 0; j < N; ++j) {
				if (D[i][k] != INT_MAX && D[k][j] != INT_MAX && D[i][k] + D[k][j] < D[i][j]) {
					D[i][j] = D[i][k] + D[k][j];
					S[i][j] = S[i][k];
				}
			}
		}
	}

	cout << "Matrix D:" << endl;
	for (int i = 0; i < N; ++i) {
		cout << "\t\t";
		for (int j = 0; j < N; ++j) {
			if (D[i][j] == INT_MAX)
				cout << "INF\t";
			else
				cout << D[i][j] << "\t";
		}
		cout << endl;
	}
	
	cout << "\nMatrix S:" << endl;
	for (int i = 0; i < N; ++i) {
		cout << "\t\t";
		for (int j = 0; j < N; ++j) {
			cout << S[i][j] << "\t";
		}
		cout << endl;
	}
}