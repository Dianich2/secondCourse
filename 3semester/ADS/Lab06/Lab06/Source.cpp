#include <iostream>
#include <string>
#include <queue>
#include <unordered_map>

using namespace std;

struct HuffmanNode {
    char data;
    int frequency;
    HuffmanNode* left;
    HuffmanNode* right;

    HuffmanNode(char data, int frequency) {
        this->data = data;
        this->frequency = frequency;
        left = right = nullptr;
    }
};

struct Compare {
    bool operator()(HuffmanNode* lhs, HuffmanNode* rhs) {
        return lhs->frequency > rhs->frequency;
    }
};

void traverseHuffmanTree(HuffmanNode* node, string code, unordered_map<char, string>& codes) {
    if (node == nullptr) {
        return;
    }

    if (node->left == nullptr && node->right == nullptr) {
        codes[node->data] = code;
    }

    traverseHuffmanTree(node->left, code + "0", codes);
    traverseHuffmanTree(node->right, code + "1", codes);
}

void buildHuffmanTree(string text, unordered_map<char, string>& codes) {
    priority_queue<HuffmanNode*, vector<HuffmanNode*>, Compare> pq;

    unordered_map<char, int> freqMap;
    for (char c : text) {
        freqMap[c]++;
    }

    // Создание узлов дерева и добавление их в очередь с приоритетом
    for (auto& pair : freqMap) {
        HuffmanNode* node = new HuffmanNode(pair.first, pair.second);
        pq.push(node);
    }

    // Построение дерева Хаффмана
    while (pq.size() > 1) {
        HuffmanNode* min1 = pq.top();
        pq.pop();
        HuffmanNode* min2 = pq.top();
        pq.pop();

        HuffmanNode* newNode = new HuffmanNode('$', min1->frequency + min2->frequency);
        newNode->left = min1;
        newNode->right = min2;

        pq.push(newNode);
    }

    // Обход дерева и формирование кодовых последовательностей
    if (!pq.empty()) {
        HuffmanNode* root = pq.top();

        string code;
        traverseHuffmanTree(root, code, codes);

        delete root;
    }
}


string encodeText(string text, unordered_map<char, string>& codes) {
    string encodedText;
    for (char c : text) {
        encodedText += codes[c];
    }
    return encodedText;
}

int main() {
    string text;
    cout << "Input text: ";
    getline(cin, text);

    unordered_map<char, string> codes;
    buildHuffmanTree(text, codes);

    cout << endl << "Symbol frequency table :" << endl;
    unordered_map<char, int> freqMap;
    for (char c : text) {
        freqMap[c]++;
    }
    for (auto& pair : freqMap) {
        double frequency = (static_cast<double>(pair.second) / text.length()) * 100;
        cout << pair.first << ": " << "  " << static_cast<double>(pair.second) << endl;
    }
    cout << endl;

    cout << "Codes table:" << endl;
    for (auto& pair : codes) {
        cout << pair.first << ": " << pair.second << endl;
    }
    cout << endl;

    cout << encodeText(text, codes);
    cout << endl;
}