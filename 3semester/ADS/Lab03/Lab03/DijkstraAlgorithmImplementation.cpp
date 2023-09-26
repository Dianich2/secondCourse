#include <iostream>
#include <climits>
#include <queue>
using namespace std;

const int NUM_VERTICES = 9;

void findShortestPaths(int graph[NUM_VERTICES][NUM_VERTICES], int startVertex);

int main() {
    int startVertex;
    int graph[NUM_VERTICES][NUM_VERTICES] = {
        {0, 7, 10, 0, 0, 0, 0, 0, 0},  // A
        {7, 0, 0, 0, 0, 9, 27, 0, 0}, // B
        {10, 0, 0, 0, 31, 8, 0, 0, 0},// C
        {0, 0, 0, 0, 32, 0, 0, 17, 21},// D
        {0, 0, 31, 32, 0, 0, 0, 0, 0}, // E
        {0, 9, 8, 0, 0, 0, 0, 11, 0}, // F
        {0, 27, 0, 0, 0, 0, 0, 0, 15},// G
        {0, 0, 0, 17, 0, 11, 0, 0, 15},// H
        {0, 0, 0, 21, 0, 0, 15, 15, 0} // I
    };

    char symbol[3];
    bool isValidInput = false;
    cout << "Input start vertex: ";
    while (!isValidInput) {
        cin >> symbol;
        if (symbol[1] == '\0' && (symbol[0] == 'A' || symbol[0] == 'B' || symbol[0] == 'C' ||
            symbol[0] == 'D' || symbol[0] == 'E' || symbol[0] == 'F' ||
            symbol[0] == 'G' || symbol[0] == 'H' || symbol[0] == 'I')) {
            isValidInput = true;
        }
        else {
            cout << "incorrect input. go again: ";
        }
    }

    startVertex = (int)symbol[0] - 'A';
    findShortestPaths(graph, startVertex);

    return 0;
}

void findShortestPaths(int graph[NUM_VERTICES][NUM_VERTICES], int startVertex) {
    int distances[NUM_VERTICES];
    int previousVertices[NUM_VERTICES];
    bool visited[NUM_VERTICES];

    for (int i = 0; i < NUM_VERTICES; i++) {
        distances[i] = INT_MAX;
        previousVertices[i] = -1;
        visited[i] = false;
    }

    distances[startVertex] = 0;

    queue<int> q;
    q.push(startVertex);

    while (!q.empty()) {
        int currentVertex = q.front();
        q.pop();
        visited[currentVertex] = true;

        for (int i = 0; i < NUM_VERTICES; i++) {
            if (!visited[i] && graph[currentVertex][i] && distances[currentVertex] != INT_MAX &&
                distances[currentVertex] + graph[currentVertex][i] < distances[i])
            {
                distances[i] = distances[currentVertex] + graph[currentVertex][i];
                previousVertices[i] = currentVertex;
                q.push(i);
            }
        }
    }

    cout << "Shortest distances and paths: " << endl;
    for (int i = 0; i < NUM_VERTICES; i++) {
        char fromVertex = static_cast<char>(startVertex + 'A');
        char toVertex = static_cast<char>(i + 'A');
        cout << "From vertex " << fromVertex << " to vertex " << toVertex << ": " << distances[i] << ", Path: ";

        if (distances[i] != INT_MAX) {
            int current = i;
            while (current != startVertex) {
                cout << static_cast<char>(current + 'A') << " <- ";
                current = previousVertices[current];
            }
            cout << fromVertex;
        }
        else {
            cout << "Unreachable";
        }
        cout << endl;
    }
}
