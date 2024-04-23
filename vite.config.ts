import react from '@vitejs/plugin-react-swc'
import postcssPresetEnv from 'postcss-preset-env'
import { defineConfig } from 'vite'

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [react()],
  css: {
    postcss: {
      plugins: [postcssPresetEnv],
    },
  },
})
