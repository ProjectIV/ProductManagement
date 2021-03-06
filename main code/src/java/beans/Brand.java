/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

/**
 *
 * @author Hung
 */
public class Brand {
    private String name, logo, manufacturer, description;
    private int id;
    private boolean disable;

    public Brand(int id, String name, String logo, String manufacturer, String description, boolean disable) {
        this.name = name;
        this.logo = logo;
        this.manufacturer = manufacturer;
        this.description = description;
        this.id = id;
        this.disable = disable;
    }

    public Brand() {
    }

    public boolean isDisable() {
        return disable;
    }

    public void setDisable(boolean disable) {
        this.disable = disable;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public String getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "Brand{" + "name=" + name + ", logo=" + logo + ", manufacturer=" + manufacturer + ", description=" + description + ", id=" + id + '}';
    }
    
    
}
