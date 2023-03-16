#! /bin/bash

echo -e "\n~~~ Salon Appointment Scheduler ~~~"

PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"

MAIN_MENU () {
  #error message
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  # list services
  SERVICES=$($PSQL "SELECT service_id, name from services ORDER BY service_id")
  LIST_SERVICE_IDS=()
  while read SERVICE_ID BAR NAME
  do 
    echo -e "$SERVICE_ID) $NAME"
    LIST_SERVICE_IDS+=($SERVICE_ID)
  done <<< "$SERVICES"
  #echo "${LIST_SERVICE_IDS[@]}"

  echo -e "\nWhich service do you need?"
  read SERVICE_ID_SELECTED
  # if not a number or not from the list
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]] || ! [[ "${LIST_SERVICE_IDS[@]}" =~ $SERVICE_ID_SELECTED ]]
  then
    MAIN_MENU "Select a number from the list."
  else
    SERVICE_NAME="$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")"
    
    # get customer info
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
    # if customer doesn't exist
    if [[ -z $CUSTOMER_NAME ]]; then
      # get new customer name
      echo -e "\nWhat's your name?"
      read CUSTOMER_NAME
      # insert new customer
      INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
    fi
    # get customer_id
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
    # schedule time
    echo -e "\nWhat time do you want to book?"
    read SERVICE_TIME
    
    NEW_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES('$CUSTOMER_ID', $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
    echo I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME.
  fi
  
  exit 0
}

MAIN_MENU
