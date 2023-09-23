package Cart_p;

public class cart_data {
	String image , quantity , id ,  name , price;
	
	public String getImage() {
		return image;
	}
	
	public double getTotalPrice()
	{
		double tp=0;
			tp = Double.parseDouble(price) * Integer.parseInt(quantity);
		return tp;
	}
	
	public void setImage(String image) {
		this.image = image;
	}

	public String getQuantity() {
		return quantity;
	}

	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public cart_data(String image, String quantity, String id, String name, String price) {
//		super();
		this.image = image;
		this.quantity = quantity;
		this.id = id;
		this.name = name;
		this.price = price;
	}
	
}
