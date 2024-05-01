from sklearn.datasets import load_breast_cancer
from sklearn.neighbors import KNeighborsClassifier
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler

# Load breast cancer data
data = load_breast_cancer()
X, y = data.data, data.target

# Split data into train/test sets
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)

# Feature scaling
scaler = StandardScaler()
X_train_scaled = scaler.fit_transform(X_train)
X_test_scaled = scaler.transform(X_test)



# Define weights function (inverse distance)
def weights(distances):
    return 1.0 / distances

# Create kNN classifier with weights
knn = KNeighborsClassifier(n_neighbors=5, weights=weights)

# Train the model
knn.fit(X_train_scaled, y_train)

# Make predictions
y_pred = knn.predict(X_test_scaled)


from sklearn.metrics import accuracy_score

# Calculate accuracy
accuracy = accuracy_score(y_test, y_pred)
print("Accuracy:", accuracy)


from sklearn.model_selection import cross_val_score

# Define a range of k values
k_range = range(1, 31)

# Calculate cross-validation scores for each k
scores = []
for k in k_range:
    knn = KNeighborsClassifier(n_neighbors=k, weights=weights)
    cv_scores = cross_val_score(knn, X_train_scaled, y_train, cv=10)
    scores.append(cv_scores.mean())

# Find the best k value
best_k = k_range[scores.index(max(scores))]
print("Best k:", best_k)
print("Best Score:", max(scores))


