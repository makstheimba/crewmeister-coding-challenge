export const handler = async (event) => {
    const response = {
      'statusCode': 200,
      'headers': { "Content-Type": "application/json" },
      'body': JSON.stringify({
        "message": "Success",
        "payload": users
      })
    };
  
    return response;
  };
  