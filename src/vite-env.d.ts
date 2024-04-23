/// <reference types="vite/client" />

declare global {
  // eslint-disable-next-line @typescript-eslint/consistent-type-definitions
  interface Window {
    _env_: {
      HELLO: string
    }
  }
}

export {}
