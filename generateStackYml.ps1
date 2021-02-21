$stack = docker-compose -f .\docker-compose.yml -f .\docker-compose.prod.yml config
$stack = $stack -replace '\d+\.\d+$', '''$0'''
$stack > .\stack.yml