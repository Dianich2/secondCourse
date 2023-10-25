#include <vector>
#include <algorithm>
#include <iostream>

#define V 8

int matrix[V][V] = { { INT_MAX,  2,  INT_MAX,  8,  2,  INT_MAX,  INT_MAX, INT_MAX },
				 {       2,  INT_MAX,  3, 10,  5,  INT_MAX,  INT_MAX, INT_MAX },
				 { INT_MAX,  3,  INT_MAX,  INT_MAX, 12,  INT_MAX,  INT_MAX, 7 },
				 { 8, 10,  INT_MAX,  INT_MAX, 14,  3,  1, INT_MAX },
				 { 2,  5, 12, 14,  INT_MAX, 11,  4, 8 },
				 { INT_MAX,  INT_MAX,  INT_MAX,  3, 11,  INT_MAX,  6, INT_MAX },
				 { INT_MAX,  INT_MAX,  INT_MAX,  1,  4,  6,  INT_MAX, 9 },
				 { INT_MAX,  INT_MAX,  7,  INT_MAX,  8,  INT_MAX,  9, INT_MAX } };

using namespace std;

bool isVisited(vector<int> visited, int check)
{
	for (int g = 0; g < visited.size(); g++)
		if (check == visited[g])
			return true;
	return false;
}

void PrimAlgorithm(int graph[V][V]) {
	std::vector<int> visited;
	visited.push_back(0);

	int result[V][V] = {};
	int sum = 0;

	while (visited.size() != V) {
		int weight = INT_MAX;
		int start = INT_MAX;
		int current = INT_MAX;

		for (int a = 0; a < visited.size(); a++) {
			for (int i = 0; i < V; i++) {
				if (graph[visited[a]][i] < weight && !isVisited(visited, i)) {
					weight = graph[visited[a]][i];
					current = i;
					start = visited[a];
				}
			}
		}
		result[start][current] = weight;
		visited.push_back(current);
		sum += weight;

		std::cout << start + 1 << " to " << current + 1 << ":  " << weight << "\n";

		/*if (current != INT_MAX && start != INT_MAX) {
			result[start][current] = weight;
			visited.push_back(current);
			sum += weight;

			std::cout << start + 1 << " to " << current + 1 << ":  " << weight << "\n";
		}*/
	}

	//std::cout << "Min spannig tree weight: " << sum << std::endl << endl;
}

void KruskalAlgorithm() {
	std::vector <int> visited;
	std::vector <int> min_distanses;

	do {
		int minimum = INT_MAX;
		int j_of_min_rib = INT_MAX;
		int i_of_min_rib;
		for (int i = 0; i < V; i++) {
			for (int j = 0; j < V; j++) {
				auto iter = std::find(visited.begin(), visited.end(), i);

				if (minimum > matrix[i][j] && iter == visited.end()) {
					minimum = matrix[i][j];
					j_of_min_rib = j;
					i_of_min_rib = i;
				}
			}
		}

		min_distanses.push_back(minimum);
		matrix[j_of_min_rib][i_of_min_rib] = INT_MAX;
		matrix[i_of_min_rib][j_of_min_rib] = INT_MAX;
		visited.push_back(i_of_min_rib);
		cout << i_of_min_rib + 1 << " to " << j_of_min_rib + 1 << ":  " << minimum << endl;

		/*if (j_of_min_rib != INT_MAX)
		{
			min_distanses.push_back(minimum);
			matrix[j_of_min_rib][i_of_min_rib] = INT_MAX;
			matrix[i_of_min_rib][j_of_min_rib] = INT_MAX;
			visited.push_back(i_of_min_rib);
			cout << i_of_min_rib + 1 << " to " << j_of_min_rib + 1 << ":  " << minimum << endl;
		}*/
	} while (min_distanses.size() != V - 1);
	int sum = 0;

	for (auto i = 0; i < min_distanses.size(); i++) {
		sum += min_distanses[i];
	}
	//std::cout << "Min spannig tree weight: " << sum << std::endl;
}


int main()
{
	setlocale(LC_ALL, "rus");

	cout << "Prim algorithm:" << endl;
	PrimAlgorithm(matrix);

	cout << "Kruskal algorithm:" << endl;
	KruskalAlgorithm();

	return 0;
}