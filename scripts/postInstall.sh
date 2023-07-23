#set env vars
set -o allexport; source .env; set +o allexport;

#wait until the server is ready
echo "Waiting for software to be ready ..."
sleep 30s;


url="${URL}/setup"

response=$(curl -c cookies.txt -s "$url")
csrf_token=$(echo "$response" | grep -o '<meta name="csrf-token" content="[^"]*' | awk -F '"' '{print $4}')
authenticity_token=$(echo "$response" | grep -o '<input type="hidden" name="authenticity_token" value="[^"]*' | awk -F '"' '{print $6}')

echo "csrf_token: ${csrf_token}"
echo "authenticity_token: ${authenticity_token}"

curl -b cookies.txt ${URL}/setup \
  -H 'accept: text/vnd.turbo-stream.html, text/html, application/xhtml+xml' \
  -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7,he;q=0.6' \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/x-www-form-urlencoded;charset=UTF-8' \
  -H 'pragma: no-cache' \
  -H 'sec-ch-ua: "Not.A/Brand";v="8", "Chromium";v="114", "Google Chrome";v="114"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "Windows"' \
  -H 'sec-fetch-dest: empty' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-site: same-origin' \
  -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36' \
  -H 'x-csrf-token: '${csrf_token}'' \
  --data-raw 'authenticity_token='${authenticity_token}'&[user][first_name]=root&[user][last_name]=root&[user][email]='${ADMIN_EMAIL}'&[account][timezone]=Europe/Paris&[account][name]=-&[user][password]='${ADMIN_PASSWORD}'&[encrypted_config][value]='${url}'&button=' \
  --compressed