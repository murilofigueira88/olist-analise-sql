📌 ETAPA 03 — CONSULTAS ANALÍTICAS DE NEGÓCIO (SQL)

Objetivo: responder perguntas reais de negócio usando SQL 

1️⃣ Visão geral — Total de pedidos e clientes

-- Total de pedidos
SELECT COUNT(*) AS total_pedidos
FROM orders;

-- Total de clientes únicos
SELECT COUNT(DISTINCT customer_id) AS total_clientes
FROM customers;

2️⃣ Pedidos por status

SELECT
    order_status,
    COUNT(*) AS total_pedidos
FROM orders
GROUP BY order_status
ORDER BY total_pedidos DESC;

3️⃣ Evolução mensal de pedidos

SELECT
    DATE_FORMAT(order_purchase_timestamp, '%Y-%m') AS mes,
    COUNT(*) AS total_pedidos
FROM orders
GROUP BY mes
ORDER BY mes;

4️⃣ Receita total e receita média por pedido


-- Receita total
SELECT
    ROUND(SUM(price + freight_value), 2) AS receita_total
FROM order_items;

-- Receita média por pedido
SELECT
    ROUND(SUM(price + freight_value) / COUNT(DISTINCT order_id), 2) AS ticket_medio
FROM order_items;


5️⃣ Top 10 produtos por receita

SELECT
    p.product_id,
    p.product_category_name,
    ROUND(SUM(oi.price + oi.freight_value), 2) AS receita
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY p.product_id, p.product_category_name
ORDER BY receita DESC
LIMIT 10;


6️⃣ Formas de pagamento mais utilizadas

SELECT
    payment_type,
    COUNT(*) AS total_pagamentos
FROM payments
GROUP BY payment_type
ORDER BY total_pagamentos DESC;

7️⃣ Tempo médio de entrega (dias)

SELECT
    ROUND(AVG(DATEDIFF(order_delivered_customer_date, order_purchase_timestamp)), 2)
        AS tempo_medio_entrega_dias
FROM orders
WHERE order_delivered_customer_date IS NOT NULL;


8️⃣ Avaliação média dos pedidos

SELECT
    ROUND(AVG(review_score), 2) AS avaliacao_media
FROM reviews;

9️⃣ Relação entre tempo de entrega e avaliação

SELECT
    r.review_score,
    ROUND(AVG(DATEDIFF(o.order_delivered_customer_date, o.order_purchase_timestamp)), 2)
        AS tempo_medio_entrega
FROM orders o
JOIN reviews r
    ON o.order_id = r.order_id
WHERE o.order_delivered_customer_date IS NOT NULL
GROUP BY r.review_score
ORDER BY r.review_score;

🔟 Estados com mais pedidos (clientes)

SELECT
    c.customer_state,
    COUNT(o.order_id) AS total_pedidos
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_state
ORDER BY total_pedidos DESC;

-----------------------------------------------------------------------------------------------------------------

