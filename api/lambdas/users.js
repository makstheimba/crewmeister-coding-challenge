export const handler = async (event) => {
    const response = {
      'statusCode': 200,
      'headers': {
        "Content-Type": "application/json",
        "Access-Control-Allow-Origin": "*"
      },
      'body': JSON.stringify({
        "message": "Success",
        "payload": users
      })
    };
  
    return response;
  };
  