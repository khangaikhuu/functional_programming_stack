# Functional Programming Web Stack

A modern web application built entirely with functional programming languages.

## Tech Stack

- **Frontend**: Elm 0.19.1
  - Pure functional language for web applications
  - Strong type system
  - No runtime exceptions
  
- **Backend**: OCaml with Dream
  - Pure functional programming
  - High-performance web framework
  - Strong static type system
  - Pattern matching and algebraic data types
  
- **Database**: PostgreSQL
  - Reliable and robust database
  - Strong integration with Elixir/Phoenix
  - Integration via Caqti

## Prerequisites

- Elixir 1.14 or later
- Erlang/OTP 25 or later
- Elm 0.19.1
- OCaml 4.14.0 or later
- Opam (OCaml package manager)
- Dune build system
- PostgreSQL 14 or later
- Node.js 18 or later (for build tools)

## Setup Instructions

### Backend Setup

#### Elixir/Phoenix

1. Install Elixir dependencies:
   ```bash
   cd back-end
   mix deps.get
   mix ecto.create
   mix ecto.migrate
   ```

2. Start Phoenix server:
   ```bash
   mix phx.server
   ```

#### OCaml with Dream

1. Install OCaml and setup opam:
   ```bash
   # Initialize opam if not already done
   opam init
   
   # Create and switch to a new environment for the project
   opam switch create . ocaml-base-compiler.4.14.0
   eval $(opam env)
   ```

2. Install dependencies:
   ```bash
   cd back-end
   opam install . --deps-only
   ```

3. Build and run the server:
   ```bash
   dune build
   dune exec server
   ```

### Frontend Setup

1. Install Elm and npm dependencies:
   ```bash
   cd front-end
   npm install
   elm make src/Main.elm --output=public/elm.js
   ```

2. Start development server:
   ```bash
   npm start
   ```

## Development

The application will be available at:
- Frontend: http://localhost:3000
- Backend API (Elixir/Phoenix): http://localhost:4000
- Backend API (OCaml with Dream): http://localhost:8080

The application provides these initial endpoints:
- `GET /`: Returns a hello message
- `GET /api/health`: Health check endpoint

## Project Structure

```
.
├── back-end/          # Elixir/Phoenix backend and OCaml backend
│   ├── phoenix/      # Elixir/Phoenix backend
│   │   ├── config/   # Configuration files
│   │   ├── lib/      # Library code
│   │   └── test/     # Test files
│   ├── ocaml/        # OCaml backend
│   │   ├── bin/      # Executable sources
│   │   │   ├── server.ml # Main server file
│   │   │   └── dune     # Build configuration
│   │   └── lib/      # Library code
│   └── db/           # Database migrations and seeds
├── front-end/         # Elm frontend
└── db/               # Database migrations and seeds