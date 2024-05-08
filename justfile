all: dissertation presentation

dissertation:
  @just dissertation/

presentation:
  @just presentation/

clean:
  @just dissertation/clean
  @just presentation/clean
