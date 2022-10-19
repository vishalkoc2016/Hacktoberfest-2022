template <class T>

class FenwickTree{

private:

    vector<T> Tree;

    int n;

public:

    FenwickTree(int n){

        this->n = n;

        Tree.resize(n + 1, 0);

    }

    void init(vector<T> &arr){

        this->n = size(arr);

        Tree.resize(n + 1, 0);

        for(int i = 0; i < n; i++)

            update(i + 1, arr[i]);

    }

    void update(int idx, T delta){

        while(idx <= n)

        {

            Tree[idx] += delta;

            idx += (idx & -idx);

        }

    }

    void update(int l, int r, T delta){

        update(l, delta);

        update(r + 1, -delta);

    }

    T query(int idx){

        T sum = 0;

        while(idx > 0)

        {

            sum += Tree[idx];

            idx -= (idx & -idx);

        }

        return sum;

    }

    T query(int l, int r){

        return (l > r ? 0 : query(r) - query(l - 1));

    }

};
