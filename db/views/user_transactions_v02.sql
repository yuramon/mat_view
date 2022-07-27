SELECT
   sender.name AS name,
   sender.email AS email,
   sender.id AS user_id,
   transactions.amount AS amount,
   recipient.name AS recipient_name
FROM users sender
    INNER JOIN transactions ON (transactions.sender_account_id = sender.id)
    INNER JOIN users recipient ON (transactions.recipient_account_id = recipient.id)