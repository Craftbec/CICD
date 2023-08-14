TELEGRAM_BOT_TOKEN=5701806879:AAHJ1whd8kawUmPNIrmlZHf6yuRwQ4cRGWI
TELEGRAM_USER_ID=158425778
TIME=2
URL="https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage"
TEXT="$CI_JOB_NAME status: $1%0A%0AProject:+$CI_PROJECT_NAME%0AURL:+$CI_PROJECT_URL/pipelines/$CI_PIPELINE_ID/%0ABranch:+$CI_COMMIT_REF_SLUG/%0AStatus:+$CI_JOB_STATUS"

curl -s --max-time $TIME -d "chat_id=$TELEGRAM_USER_ID&disable_web_page_preview=1&text=$TEXT" $URL > /dev/null
