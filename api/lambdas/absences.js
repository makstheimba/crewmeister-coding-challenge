export const handler = async (event) => {
    const query = event.queryStringParameters || {};
    const page = parseInt(query.page || 1)
    const limit = 10;
    const type = query.type;
    const date = query.date;

    let filtered = absences;
    if (type) {
        filtered = filtered.filter(absence => absence.type === type);
    }
    if (date) {
        filtered = filtered.filter(absence => {
            return new Date(date) >= new Date(absence.startDate) && new Date(date) <= new Date(absence.endDate);
        });
    }

    const startIndex = (page - 1) * limit;
    const endIndex = page * limit;
    const result = filtered.slice(startIndex, endIndex);

    return {
        statusCode: 200,
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({
          "message": "Success",
          "payload": {
            "list": result,
            "total": filtered.length
          }
        })
    };
};
