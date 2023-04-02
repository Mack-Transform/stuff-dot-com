def model(dbt, session):

    # setting configuration
    dbt.config(materialized= "table")

    # define customer Snowpark df
    cust_df = dbt.ref("stg_customers1")

    #Convert Snowpark df to pandas df
    pd_cust = cust_df.to_pandas()
    pd_cust.POSTAL_CODE = [str(i) for i in pd_cust.POSTAL_CODE]

    # add leading zeros
    for i in range(len(pd_cust)):
        if len(pd_cust.POSTAL_CODE[i])<5:
            pd_cust.loc[i, "POSTAL_CODE"] = "0" + pd_cust.POSTAL_CODE[i]
    
    #convert back to Snowpark df
    cust_df = session.create_dataframe(pd_cust)

    return cust_df