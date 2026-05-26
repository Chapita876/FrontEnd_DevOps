# ---- Stage 1: Build ----
FROM alpine AS builder
WORKDIR /app
COPY . .


FROM nginx:alpine
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
COPY --from=builder /app /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]