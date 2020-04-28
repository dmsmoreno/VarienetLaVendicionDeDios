use Punto_de_venta;
SET GLOBAL log_bin_trust_function_creators = 1;
CREATE TABLE ajuste_inventario 
(
	id INTEGER PRIMARY KEY AUTO_INCREMENT, 
    id_articulo INTEGER,
    id_usuario VARCHAR(20),
    descripcion VARCHAR(100) NOT NULL, 
    fecha DATE NOT NULL,
    FOREIGN KEY (id_articulo) REFERENCES articulos(id),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id)
);
/*------------------------------------------------------------------------*/



/*---------------------------------------------------------------------------------*/
DELIMITER $
CREATE  FUNCTION sumarStock(id_articulo INTEGER, cantidad INTEGER) RETURNS int(11)
BEGIN 

DECLARE stock_inicial INT;

/*SELECT detalle_productos.cantidad INTO cantidad_articulo_en_producto FROM detalle_productos, articulos, productos WHERE productos.id = detalle_productos.id_producto AND articulos.id = detalle_productos.id_articulo;*/

SELECT stock INTO stock_inicial FROM articulos WHERE id = id_articulo;

/*UPDATE  articulos SET stock  = stock_inicial + stock_ingreso WHERE id = id_articulo;**/

RETURN stock_inicial + cantidad;  

end $
DELIMITER ;

/*---------------------------------------------------------------------------------*/



/*------------------------------------------------------------------------------------*/
DELIMITER $
CREATE  FUNCTION restarStockSinProducto(id_articulo INT, cantidad INT) RETURNS int(11)
BEGIN 

DECLARE stock_inicial INT;
/*DECLARE cantidad_articulo_en_producto INT;

/*SELECT detalle_productos.cantidad INTO cantidad_articulo_en_producto FROM detalle_productos, articulos, productos WHERE productos.id = detalle_productos.id_producto AND articulos.id = detalle_productos.id_articulo;*/

/*SELECT detalle_productos.cantidad INTO cantidad_articulo_en_producto FROM detalle_productos WHERE detalle_productos.id_producto = id_producto AND  detalle_productos.id_articulo = id_articulo;*/

SELECT stock INTO stock_inicial FROM articulos WHERE id = id_articulo;

/*UPDATE  articulos SET stock  = stock_inicial + stock_ingreso WHERE id = id_articulo;**/

RETURN stock_inicial - cantidad;  

end $
DELIMITER ;