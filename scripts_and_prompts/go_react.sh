#!/usr/bin/env bash
set -e

# Vérification des binaires
for cmd in node npm go; do
  if ! command -v "$cmd" >/dev/null 2>&1; then
    echo "Erreur : $cmd n'est pas installé."
    exit 1
  fi
done

# Nom de l'app
read -p "Nom de l'application : " APP_NAME
if [ -z "$APP_NAME" ]; then
  echo "Erreur : le nom de l'application ne peut pas être vide."
  exit 1
fi

mkdir -p "$APP_NAME"
cd "$APP_NAME"

#####################################
# BACKEND D'ABORD
#####################################
mkdir -p backend
cd backend

go mod init "${APP_NAME}-backend"

mkdir -p cmd/api
mkdir -p internal/domain
mkdir -p internal/usecase/user

cat > cmd/api/main.go << 'EOF'
package main

import (
	"fmt"
	"log"
	"net/http"
)

func main() {
	mux := http.NewServeMux()

	mux.HandleFunc("/health", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintln(w, "OK")
	})

	fmt.Println("Backend Go démarré sur http://localhost:8080")
	if err := http.ListenAndServe(":8080", mux); err != nil {
		log.Fatal(err)
	}
}
EOF

cat > internal/domain/user.go << 'EOF'
package domain

type User struct {
	ID    string
	Name  string
	Email string
}
EOF

cat > internal/usecase/user/get_user.go << 'EOF'
package user

import "APP_BACKEND_MODULE/internal/domain"

type GetUserOutput struct {
	User domain.User
}

type UserReadRepository interface {
	FindByID(id string) (domain.User, error)
}

func GetUser(repo UserReadRepository, id string) (GetUserOutput, error) {
	u, err := repo.FindByID(id)
	if err != nil {
		return GetUserOutput{}, err
	}
	return GetUserOutput{User: u}, nil
}
EOF

sed -i "s|APP_BACKEND_MODULE|${APP_NAME}-backend|g" internal/usecase/user/get_user.go

cd ..

#####################################
# FRONTEND ENSUITE
#####################################
mkdir -p frontend
cd frontend

# 1) Création du projet CRA + TypeScript (Jest est inclus)
npx create-react-app . --template typescript

# 2) Installation de Tailwind
npm install -D tailwindcss@3 postcss autoprefixer
npx tailwindcss init -p

# 2bis) Installation de React Router pour le web
npm install react-router-dom

# 3) Config Tailwind
cat > tailwind.config.js << 'EOF'
/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./src/**/*.{js,jsx,ts,tsx}",
  ],
  theme: {
    extend: {},
  },
  plugins: [],
};
EOF

# 4) Directives Tailwind dans index.css
cat > src/index.css << 'EOF'
@tailwind base;
@tailwind components;
@tailwind utilities;
EOF

# 5) Réorganisation de l'arborescence front

# Nettoyage des fichiers CRA inutiles
rm -f src/App.css src/App.test.tsx src/logo.svg src/reportWebVitals.ts src/setupTests.ts
rm -f public/logo192.png public/logo512.png public/manifest.json public/robots.txt

mkdir -p src/app
mkdir -p src/features/users
mkdir -p src/helpers/ui
mkdir -p src/helpers/commons

# App.tsx + routes.tsx avec React Router
cat > src/app/App.tsx << 'EOF'
import React from 'react';
import { BrowserRouter } from 'react-router-dom';
import { Routes } from './routes';

export const App: React.FC = () => {
  return (
    <BrowserRouter>
      <div className="min-h-screen bg-slate-900 text-slate-100">
        <Routes />
      </div>
    </BrowserRouter>
  );
};
EOF

cat > src/app/routes.tsx << 'EOF'
import React from 'react';
import { Routes as RouterRoutes, Route } from 'react-router-dom';
import { UsersPage } from '../features/users/UsersPage';

export const Routes: React.FC = () => {
  return (
    <RouterRoutes>
      <Route path="/" element={<UsersPage />} />
    </RouterRoutes>
  );
};
EOF

# UsersPage + useUsers
cat > src/features/users/UsersPage.tsx << 'EOF'
import React from 'react';
import { useUsers } from './useUsers';

export const UsersPage: React.FC = () => {
  const { users, isLoading } = useUsers();

  if (isLoading) {
    return <div className="p-4">Chargement des utilisateurs...</div>;
  }

  return (
    <main className="p-4">
      <h1 className="text-2xl font-bold mb-4">Utilisateurs</h1>
      <ul className="space-y-2">
        {users.map((user) => (
          <li key={user.id} className="rounded bg-slate-800 px-3 py-2">
            <p className="font-medium">{user.name}</p>
            <p className="text-sm text-slate-400">{user.email}</p>
          </li>
        ))}
      </ul>
    </main>
  );
};
EOF

cat > src/features/users/useUsers.ts << 'EOF'
import { useEffect, useState } from 'react';

type User = {
  id: string;
  name: string;
  email: string;
};

type State = {
  users: User[];
  isLoading: boolean;
};

export const useUsers = (): State => {
  const [state, setState] = useState<State>({
    users: [],
    isLoading: true,
  });

  useEffect(() => {
    const timeout = setTimeout(() => {
      setState({
        isLoading: false,
        users: [
          { id: '1', name: 'Alice', email: 'alice@example.com' },
          { id: '2', name: 'Bob', email: 'bob@example.com' },
        ],
      });
    }, 500);

    return () => clearTimeout(timeout);
  }, []);

  return state;
};
EOF

# index.tsx qui utilise App
cat > src/index.tsx << 'EOF'
import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import { App } from './app/App';

const rootElement = document.getElementById('root') as HTMLElement;
const root = ReactDOM.createRoot(rootElement);

root.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);
EOF

# 6) Dossier __tests__ Jest à la racine du projet React (pas dans src)
mkdir -p __tests__

cat > __tests__/App.test.tsx << 'EOF'
import React from 'react';
import { render, screen } from '@testing-library/react';
import '@testing-library/jest-dom';
import { App } from '../src/app/App';

test('renders users title', () => {
  render(<App />);
  expect(screen.getByText(/Utilisateurs/i)).toBeInTheDocument();
});
EOF

echo "Projet créé dans $APP_NAME : backend + frontend (TypeScript, Jest, Tailwind, React Router, __tests__ à la racine du frontend)."
