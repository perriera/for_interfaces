from sklearn.datasets import load_breast_cancer
from sklearn.model_selection import train_test_split
from sklearn.neighbors import KNeighborsClassifier
from sklearn.preprocessing import StandardScaler
from sklearn.metrics import accuracy_score
import numpy as np

# Load dataset
data = load_breast_cancer()
X = data.data
y = data.target

# Split dataset into training and testing sets
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

scaler = StandardScaler()
X_train = scaler.fit_transform(X_train)
X_test = scaler.transform(X_test)

best_score = 0
best_k = 1

for k in range(1, 21):  # Test k from 1 to 20
    # Create and train the kNN classifier
    knn = KNeighborsClassifier(n_neighbors=k, weights='distance')
    knn.fit(X_train, y_train)
    
    # Predict and calculate accuracy
    y_pred = knn.predict(X_test)
    score = accuracy_score(y_test, y_pred)
    
    if score > best_score:
        best_score = score
        best_k = k

print(f"Best k: {best_k}, Best score: {best_score}")

