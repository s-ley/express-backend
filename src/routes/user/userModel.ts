import {pool} from "../../config/db";

export interface User {
    id?: number|undefined
    email: string
    passwordHash: string
    name: string,
    lastName: string,
    phone: string
}

/**
 * Obtains undeleted users
 * @param offset
 * @param total
 * @return User[]
 */
export const getUsers = async(offset:number, total:number):Promise<User[]> => {
    let [rows, fields] = await pool.query(
        'SELECT id,email,name,lastName,phone FROM user WHERE deleted=0 LIMIT ?,?', [offset,total]
    );
    return rows;
}

/**
 * Obtains undeleted user
 * @param id
 * @return User | undefined - undefined if not found
 */
export const getUser = async (id:number):Promise<User|undefined> => {
    let [rows, fields] = await pool.query(
        'SELECT id,email,name,lastName,phone FROM user WHERE id=? AND deleted=0', [id]
    );
    if (rows.length === 0)
        return undefined;
    return rows[0];
}

/**
 * @param user
 * @return id - of the new user
 */
export const createUser = async (user:User):Promise<number> => {
    let query:any = await pool.query(
        'INSERT INTO `user` (`email`,`password_hash`,`name`,`lastName`,`phone`) VALUES (?,?,?,?,?)',
        [user.email, user.passwordHash, user.name, user.lastName, user.phone]
        );
    return query[0].insertId;
}

/**
 * Updates undeleted user
 * @param user
 */
export const updateUser = async (user:User):Promise<void> => {
    await pool.query(
        'UPDATE `user` SET `email`=?,`password_hash`=?,`name`=?,`lastName`=?,`phone`=? WHERE id=? AND deleted=0',
        [user.email, user.passwordHash, user.name, user.lastName, user.phone, Number(user.id)]
    );
}

/**
 * @param id
 */
export const deleteUser = async (id:number):Promise<void> => {
    await pool.query(
        'UPDATE `user` SET `deleted`=1 WHERE id=?', [id]
    );
}

/**
 * Gets hashed password of undeleted user
 * @param id
 */
export const getHashedPassword = async(id:number): Promise<string> => {
    let [rows, fields] = await pool.query(
        'SELECT password_hash FROM user WHERE id=? AND deleted=0', [id]
    );
    return rows[0].password_hash;
}